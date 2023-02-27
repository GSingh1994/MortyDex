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
        if section == 1 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Character image cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: [0,0]) as! ImageCell
        cell.imageCellView.sd_setImage(with: URL(string: characterImageValue!))
        
        return cell
    }
    
}

