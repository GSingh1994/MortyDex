//
//  LocationsViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-28.
//

import UIKit

class LocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var allLocations: [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return allLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationsCell", for: indexPath)
        let name = allLocations[indexPath.row].name
        let type = allLocations[indexPath.row].type
        let dimension = allLocations[indexPath.row].dimension
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = "\(dimension!) | \(type!)"
        return cell
    }

}
