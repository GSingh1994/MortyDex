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
        self.title = "Locations"
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "locationToDetails", sender: self)
    }
    
    //load data on scroll
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            
            let vc = self.navigationController?.tabBarController as! TabBarController
            vc.loadLocations(pageNum: 1)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "locationToDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let VC = segue.destination as! LocationDetailsViewController
                
                //pass selected location
                VC.currentSelection = self.allLocations[indexPath.row]
            }
        }
    }
    
}
