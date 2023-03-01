//
//  EpisodeDetailsViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-03-01.
//

import UIKit

class EpisodeDetailsViewController: UITableViewController {

    var currentEpisode: Episode?
    var infoSection: [String?: String?] = [nil : nil]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        tableView.register(UINib(nibName: "AvatarViewCell", bundle: nil), forCellReuseIdentifier: "avatarDetailCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        title = currentEpisode?.name
        infoSection = ["Episode": currentEpisode?.info, "Air date": currentEpisode?.date]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return (currentEpisode?.characters.count)!
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            cell.infoLeftLabel.text = Array(infoSection)[indexPath.row].key
            cell.infoRightLabel.text = Array(infoSection)[indexPath.row].value
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "avatarDetailCell", for: indexPath) as! AvatarViewCell
            cell.leftLabel.text = currentEpisode?.characters[indexPath.row].name
            cell.leftImageView.sd_setImage(with: URL(string: (currentEpisode?.characters[indexPath.row].image)!))
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

}
