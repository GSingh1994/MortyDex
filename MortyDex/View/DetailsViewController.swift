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
    
    
    var characterNameValue: String?
    var characterImageValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.dataSource = self
        tableView.dataSource = self
        characterNameLabel.text = characterNameValue
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 1
        case 2:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            //Character image cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageCell
            cell.imageCellView.sd_setImage(with: URL(string: characterImageValue!))
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
        default:
            return ""
        }
        
    }
    
}

