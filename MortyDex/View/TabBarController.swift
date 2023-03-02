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
    var allLocations: [Location] = []
    var allEpisodes: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacters(page: 1)
        loadEpisodes(page: 1)
        loadLocations(page: 1)
    }
    
    func loadCharacters(page: Int) {
        apolloClient.fetch(query: MortySchema.AllCharactersQuery(page: GraphQLNullable<Int>(integerLiteral: page))) { result in
            guard let data = try? result.get().data else { return }
            
 
            
            if let charactersData = data.characters?.results {
                for char in charactersData {
                    let character = Character()
                    character.id = char?.id
                    character.name = char?.name
                    character.image = char?.image
                    self.allCharacters.append(character)
                }
            }
            
            //send character data to MainVC
            let nav = self.viewControllers![0] as! UINavigationController
            let mainVC = nav.topViewController as! MainViewController
            mainVC.allCharacters = self.allCharacters
            mainVC.collectionView.reloadData()
        }
        
    }
    func loadEpisodes(page: Int) {
        apolloClient.fetch(query: MortySchema.AllEpisodesQuery(page: GraphQLNullable<Int>(integerLiteral: page))) { result in
            guard let data = try? result.get().data else { return }
            
            if let episodeData = data.episodes?.results {
                for epi in episodeData {
                    let episode = Episode()
                    episode.id = epi?.id
                    episode.name = epi?.name
                    episode.info = epi?.episode
                    episode.date = epi?.air_date
                    self.allEpisodes.append(episode)
                }
            }
            //send episode data to episodeVC
            let nav = self.viewControllers![2] as! UINavigationController
            let episodesVC = nav.topViewController as! EpisodesViewController
            episodesVC.allEpisodes = self.allEpisodes
        }
    }
    
    func loadLocations(page: Int) {
        apolloClient.fetch(query: MortySchema.AllLocationsQuery(page: GraphQLNullable<Int>(integerLiteral: page))) { result in
            guard let data = try? result.get().data else { return }
            
            if let locationData = data.locations?.results {
                for loc in locationData {
                    let location = Location()
                    location.id = loc?.id
                    location.name = loc?.name
                    location.dimension = loc?.dimension
                    location.type = loc?.type
                    self.allLocations.append(location)
                }
                
                //send location data to locationVC
                let nav = self.viewControllers![1] as! UINavigationController
                let locationsVC = nav.topViewController as! LocationsViewController
                locationsVC.allLocations = self.allLocations
            }
        }
    }
}
