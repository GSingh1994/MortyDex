//
//  TabBarController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-28.
//

import UIKit
import Apollo

class TabBarController: UITabBarController {
    
    let apolloClient = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    var allLocations: [Location] = []
    var locationResidents: [Resident] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        apolloClient.fetch(query: MortySchema.AllLocationsQuery(page: 1)) { result in
            guard let data = try? result.get().data else { return }
            
            if let locationData = data.locations?.results {
                for loc in locationData {
                    
                    //get residents
                    for r in loc!.residents {
                        let resident = Resident(name: r?.name, image: r?.image)
                        self.locationResidents.append(resident)
                    }
                    
                    let location = Location(name: loc?.name, type: loc?.type, dimension: loc?.dimension, resident: self.locationResidents)
                    
                    self.allLocations.append(location)
                    self.locationResidents = []
                }
            }
            
            //send location data to locationVC
            let charactersNavController = self.viewControllers![1] as! UINavigationController
            let LocationsVC = charactersNavController.topViewController as! LocationsViewController
            LocationsVC.allLocations = self.allLocations
        }
    }
}
