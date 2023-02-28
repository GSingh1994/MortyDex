//
//  LocationDetailsViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-28.
//

import UIKit

class LocationDetailsViewController: UITableViewController {
    
    var currentSelection: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        tableView.dataSource = self
        tableView.delegate = self
        title = currentSelection?.name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "locationsDetailCell", for: indexPath)
            let type = currentSelection?.type
            let dimension = currentSelection?.dimension
            
//            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
//            cell.infoLeftLabel.text = type
//            cell.infoRightLabel.text = dimension
            cell.textLabel?.text = type
            cell.detailTextLabel?.text = dimension
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
