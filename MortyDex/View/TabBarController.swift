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
    
    var allCharacters: [Character] = []
    var characterEpisodes: [Episode] = []

    var allLocations: [Location] = []
    var locationResidents: [Resident] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacters()
        loadLocations()
    }
    
    func loadCharacters() {
        apolloClient.fetch(query: MortySchema.AllCharactersQuery(page: 1)) { result in
            guard let data = try? result.get().data else { return }
            
            if let charactersData = data.characters?.results {
                for char in charactersData {
        
                    //get episodes
                    for e in char!.episode {
                        let episode = Episode(name: e?.name, info: e?.episode, date: e?.air_date)
                        self.characterEpisodes.append(episode)
                    }
                    
                    //fill-out struct instance
                    let character = Character(name: char?.name, image: char?.image, info: ["Status": char?.status,"Gender": char?.gender, "Species": char?.species], location: ["Origin": char?.origin?.name, "Last seen": char?.location?.name], episodes: self.characterEpisodes)
                    
                    self.allCharacters.append(character)
                    self.characterEpisodes = []
                }
            }
            //send character data to MainVC
            let nav = self.viewControllers![0] as! UINavigationController
            let MainVC = nav.topViewController as! MainViewController
            MainVC.allCharacters = self.allCharacters
            MainVC.characterEpisodes = self.characterEpisodes
            MainVC.collectionView.reloadData()
        }
        
    }
    
    func loadLocations() {
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
            let nav = self.viewControllers![1] as! UINavigationController
            let LocationsVC = nav.topViewController as! LocationsViewController
            LocationsVC.allLocations = self.allLocations
        }
    }
}
