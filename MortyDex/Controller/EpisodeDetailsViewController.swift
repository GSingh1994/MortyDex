//
//  EpisodeDetailsViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-03-01.
//

import UIKit
import Apollo

class EpisodeDetailsViewController: UITableViewController {
    let apolloClient = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)

    var episode = EpisodeDetail()
    var infoSection: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEpisode(ID: episode.id!)
        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        tableView.register(UINib(nibName: "AvatarViewCell", bundle: nil), forCellReuseIdentifier: "avatarDetailCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadEpisode(ID: String) {
        apolloClient.fetch(query: MortySchema.EpisodeQuery(episodeId: ID)) { result in
            guard let data = try? result.get().data else { return }
            if let episode = data.episode {
                
                var characters: [Character] = []
                
                self.episode.name = episode.name
                self.episode.info = episode.episode
                self.episode.date = episode.air_date
                
                for char in episode.characters {
                    let character = Character()
                    character.id = char?.id
                    character.name = char?.name
                    character.image = char?.image
                    characters.append(character)
                }
                
                self.episode.characters = characters
                
                self.infoSection = [
                    "Episode": self.episode.info!,
                    "Air date": self.episode.date!]
                
                self.title = self.episode.name
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return episode.characters.count
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            if !infoSection.isEmpty {
                cell.infoLeftLabel.text = Array(infoSection)[indexPath.row].key
                cell.infoRightLabel.text = Array(infoSection)[indexPath.row].value
            }
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "avatarDetailCell", for: indexPath) as! AvatarViewCell
            cell.leftLabel.text = episode.characters[indexPath.row].name
            cell.leftImageView.sd_setImage(with: URL(string: (episode.characters[indexPath.row].image)!))
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "INFO"
        case 1:
            return "CHARACTERS"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "episodeToCharacter", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "episodeToCharacter" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let VC = segue.destination as! DetailsViewController
                
                //pass selected character ID
                VC.character.id = self.episode.characters[indexPath.row].id
            }
        }
    }
}
