//
//  DetailsViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-27.
//

import UIKit
import SDWebImage
import Apollo

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let apolloClient = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    @IBOutlet weak var tableView: UITableView!
    
    var character = CharacterDetail()
    var infoSection: [String : String] = [:]
    var locationSection: [String : String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacter(ID: character.id!)
        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadCharacter(ID: String) {
        apolloClient.fetch(query: MortySchema.CharacterQuery(characterId: ID)) { result in
            guard let data = try? result.get().data else { return }
            if let char = data.character {
                var characterEpisodes: [Episode] = []
                
                self.character.name = char.name
                self.character.image = char.image
                self.character.origin = char.origin?.name
                self.character.location = char.location?.name
                
                for epi in char.episode {
                    let episode = Episode()
                    episode.id = epi?.id
                    episode.name = epi?.name
                    episode.info = epi?.episode
                    episode.date = epi?.air_date
                    characterEpisodes.append(episode)
                }
                self.character.episodes = characterEpisodes
                
                self.infoSection = [
                    "Status" : char.status!,
                    "Species" : char.species!,
                    "Gender" : char.gender!
                ]
                
                self.locationSection = [
                    "First seen in" : self.character.origin!,
                    "Last location" : self.character.location!
                ]
                
                self.title = self.character.name
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 2
        case 3:
            return character.episodes.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            //Character image cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageCell
            if let image = character.image {
                cell.imageCellView.sd_setImage(with: URL(string: image))
            }
            return cell
            
        case 1:
            //cell of Info section
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            if !infoSection.isEmpty {
                cell.infoLeftLabel.text = Array(infoSection)[indexPath.row].key
                cell.infoRightLabel.text = Array(infoSection)[indexPath.row].value
            }
            return cell
        case 2:
            //cell of location section
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            if !locationSection.isEmpty {
                cell.infoLeftLabel.text = Array(locationSection)[indexPath.row].key
                cell.infoRightLabel.text = Array(locationSection)[indexPath.row].value
            }
            return cell
        case 3:
            //cell of episode section
            let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath)
            
            if !character.episodes.isEmpty {
                let episodeName = character.episodes[indexPath.row].name
                let episodeInfo = character.episodes[indexPath.row].info
                let episodeDate = character.episodes[indexPath.row].date
                cell.textLabel?.text = episodeInfo! + " " + episodeName!
                cell.detailTextLabel?.text = episodeDate
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "APPEARANCE"
        case 1:
            return "INFO"
        case 2:
            return "LOCATION"
        case 3:
            return "EPISODE"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            performSegue(withIdentifier: "characterToEpisode", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characterToEpisode" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let VC = segue.destination as! EpisodeDetailsViewController
                VC.episode.id = character.episodes[indexPath.row].id
            }
        }
    }
}

