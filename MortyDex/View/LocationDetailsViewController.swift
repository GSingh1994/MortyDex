//
//  LocationDetailsViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-28.
//

import UIKit
import SDWebImage
import Apollo

class LocationDetailsViewController: UITableViewController {
    let apolloClient = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    
    var location = LocationDetail()
    var infoSection: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLocation(ID: location.id!)
        
        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        tableView.register(UINib(nibName: "AvatarViewCell", bundle: nil), forCellReuseIdentifier: "avatarDetailCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadLocation(ID: String) {
        apolloClient.fetch(query: MortySchema.LocationQuery(locationId: ID)) { result in
            guard let data = try? result.get().data else { return }
            if let location = data.location {
                
                var residents: [Resident] = []
                
                self.location.name = location.name
                self.location.type = location.type
                self.location.dimension = location.dimension
                
                for res in location.residents {
                    let resident = Resident()
                    resident.id = res?.id
                    resident.name = res?.name
                    resident.image = res?.image
                    residents.append(resident)
                }
                
                self.infoSection = [
                    "Type": location.type!,
                    "Dimension": location.dimension!
                ]
                
                self.location.residents = residents
                self.title = self.location.name
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return location.residents.count
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            if !infoSection.isEmpty {
                cell.infoLeftLabel.text = Array(infoSection)[indexPath.row].key
                cell.infoRightLabel.text = Array(infoSection)[indexPath.row].value
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "avatarDetailCell", for: indexPath) as! AvatarViewCell
            cell.leftLabel.text = location.residents[indexPath.row].name
            cell.leftImageView.sd_setImage(with: URL(string: (location.residents[indexPath.row].image)!))
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "locationToCharacter", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "locationToCharacter" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let VC = segue.destination as! DetailsViewController
                
                //pass selected character ID
                VC.character.id = location.residents[indexPath.row].id
            }
        }
    }
}
