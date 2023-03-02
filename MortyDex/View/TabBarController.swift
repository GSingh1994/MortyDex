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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacters()
        loadEpisodes()
        loadLocations()
    }
    
    func loadCharacters() {
        apolloClient.fetch(query: MortySchema.AllCharactersQuery(page: 1)) { result in
            guard let data = try? result.get().data else { return }
            
            var allCharacters: [Character] = []
            
            if let charactersData = data.characters?.results {
                for char in charactersData {
                    let character = Character()
                    character.id = char?.id
                    character.name = char?.name
                    character.image = char?.image
                    allCharacters.append(character)
                }
            }
            
            //send character data to MainVC
            let nav = self.viewControllers![0] as! UINavigationController
            let mainVC = nav.topViewController as! MainViewController
            mainVC.allCharacters = allCharacters
            mainVC.collectionView.reloadData()
        }
        
    }
    func loadEpisodes() {
        apolloClient.fetch(query: MortySchema.AllEpisodesQuery(page: 1)) { result in
            guard let data = try? result.get().data else { return }
            
            var allEpisodes: [Episode] = []
            
            if let episodeData = data.episodes?.results {
                for epi in episodeData {
                    let episode = Episode()
                    episode.id = epi?.id
                    episode.name = epi?.name
                    episode.info = epi?.episode
                    episode.date = epi?.air_date
                    allEpisodes.append(episode)
                }
            }
            //send episode data to episodeVC
            let nav = self.viewControllers![2] as! UINavigationController
            let episodesVC = nav.topViewController as! EpisodesViewController
            episodesVC.allEpisodes = allEpisodes
        }
    }
    
    func loadLocations() {
        apolloClient.fetch(query: MortySchema.AllLocationsQuery(page: 1)) { result in
            guard let data = try? result.get().data else { return }
            
            var allLocations: [Location] = []
            
            if let locationData = data.locations?.results {
                for loc in locationData {
                    let location = Location()
                    location.id = loc?.id
                    location.name = loc?.name
                    location.dimension = loc?.dimension
                    location.type = loc?.type
                    allLocations.append(location)
                }
                
                //send location data to locationVC
                let nav = self.viewControllers![1] as! UINavigationController
                let locationsVC = nav.topViewController as! LocationsViewController
                locationsVC.allLocations = allLocations
            }
        }
    }
}
