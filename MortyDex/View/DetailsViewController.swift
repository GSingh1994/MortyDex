//
//  DetailsViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-27.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentSelection: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        characterNameLabel.text = currentSelection?.name
        tableView.dataSource = self
        tableView.delegate = self //?
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 1
        case 2:
            return 3
        case 3:
            return 2
        case 4:
            return (currentSelection?.episodes.count)!
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch indexPath.section {
        case 1:
            //Character image cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageCell
            cell.imageCellView.sd_setImage(with: URL(string: (currentSelection?.image)!))
            return cell
            
        case 2:
            //cell of Info section
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            cell.infoLeftLabel.text = Array(currentSelection!.info)[indexPath.row].key
            cell.infoRightLabel.text = Array(currentSelection!.info)[indexPath.row].value
            return cell
        case 3:
            //cell of location section
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            cell.infoLeftLabel.text = Array(currentSelection!.location)[indexPath.row].key
            cell.infoRightLabel.text = Array(currentSelection!.location)[indexPath.row].value
            return cell
        case 4:
            //cell of episode section
            let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath)
            let episodeName = currentSelection?.episodes[indexPath.row].name
            let episodeInfo = currentSelection?.episodes[indexPath.row].info
            let episodeDate = currentSelection?.episodes[indexPath.row].date
            cell.textLabel?.text = episodeInfo! + " " + episodeName!
            cell.detailTextLabel?.text = episodeDate
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "APPEARANCE"
        case 2:
            return "INFO"
        case 3:
            return "LOCATION"
        case 4:
            return "EPISODE"
        default:
            return ""
        }
    }
}

