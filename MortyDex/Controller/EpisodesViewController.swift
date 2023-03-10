//
//  EpisodesViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-03-01.
//

import UIKit

class EpisodesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allEpisodes: [Episode] = []
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "Episodes"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodesCell", for: indexPath)
        let name = allEpisodes[indexPath.row].name
        let info = allEpisodes[indexPath.row].info
        let date = allEpisodes[indexPath.row].date
        cell.textLabel?.text = "\(info!) | \(name!)"
        cell.detailTextLabel?.text = date
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "episodeToDetails", sender: self)
    }
    
    //load data on scroll
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
                let vc = self.navigationController?.tabBarController as! TabBarController
                page += 1
                vc.loadEpisodes(page: page)
                tableView.reloadData()
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "episodeToDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let VC = segue.destination as! EpisodeDetailsViewController
                
                //pass selected location
                VC.episode.id = allEpisodes[indexPath.row].id
            }
        }
    }
}
