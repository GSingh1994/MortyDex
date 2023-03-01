//
//  LocationDetailsViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-28.
//

import UIKit

class LocationDetailsViewController: UITableViewController {
    
    var currentSelection: Location?
    var infoSection: [String?: String?] = [nil : nil]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        tableView.register(UINib(nibName: "AvatarViewCell", bundle: nil), forCellReuseIdentifier: "avatarDetailCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        title = currentSelection?.name
        infoSection = ["Type": currentSelection?.type, "Dimension": currentSelection?.dimension]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return (currentSelection?.resident.count)!
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
            cell.leftLabel.text = currentSelection?.resident[indexPath.row].name
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
            return "RESIDENTS"
        default:
            return ""
        }
    }
}