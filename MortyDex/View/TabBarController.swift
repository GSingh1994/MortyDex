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
    
    //    var allCharacters: [Character] = []
    //    var characterEpisodes: [Episode] = []
    
    var allLocations: [Location] = []
    var locationResidents: [Resident] = []
    
    //    var allEpisodes: [Episode] = []
    //    var episodeCharacters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacters()
        //        loadLocations(pageNum: 0)
        loadEpisodes()
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
                    allEpisodes.append(episode)                    }
            }
            //send episode data to episodeVC
            let nav = self.viewControllers![2] as! UINavigationController
            let episodesVC = nav.topViewController as! EpisodesViewController
            episodesVC.allEpisodes = allEpisodes
//            episodesVC.tableView.reloadData()//??
        }
    }
    
    //    func loadLocations(pageNum: Int) {
    //        apolloClient.fetch(query: MortySchema.AllLocationsQuery(page: GraphQLNullable<Int>(integerLiteral: pageNum))) { result in
    //            guard let data = try? result.get().data else { return }
    //
    //            if let locationData = data.locations?.results {
    //                for location in locationData {
    //
    //                    //get residents
    //                    for resident in location!.residents {
    //                        let resident = Resident(name: resident?.name, image: resident?.image)
    //                        self.locationResidents.append(resident)
    //                    }
    //
    //                    let location = Location(name: location?.name, type: location?.type, dimension: location?.dimension, resident: self.locationResidents)
    //
    //                    self.allLocations.append(location)
    //                    self.locationResidents = []
    //                }
    //            }
    //
    //            //send location data to locationVC
    //            let nav = self.viewControllers![1] as! UINavigationController
    //            let locationsVC = nav.topViewController as! LocationsViewController
    //            locationsVC.allLocations = self.allLocations
    //        }
    //    }
    
    
}
