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
    
    var allEpisodes: [Episode] = []
    var episodeCharacters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacters(pageNum: 0)
        loadLocations(pageNum: 0)
        loadEpisodes()
    }
    
    func loadCharacters(pageNum: Int) {
        apolloClient.fetch(query: MortySchema.AllCharactersQuery(page: GraphQLNullable<Int>(integerLiteral: pageNum))) { result in
            guard let data = try? result.get().data else { return }
            
            if let charactersData = data.characters?.results {
                for character in charactersData {
                    
                    //get episodes
                    for episode in character!.episode {
                        let episode = Episode(name: episode?.name, info: episode?.episode, date: episode?.air_date, characters: self.episodeCharacters)
                        self.characterEpisodes.append(episode)
                    }
                    
                    //fill-out struct instance
                    let character = Character(name: character?.name, image: character?.image, info: ["Status": character?.status,"Gender": character?.gender, "Species": character?.species], location: ["Origin": character?.origin?.name, "Last seen": character?.location?.name], episodes: self.characterEpisodes)
                    
                    self.allCharacters.append(character)
                    self.characterEpisodes = []
                }
            }
            //send character data to MainVC
            let nav = self.viewControllers![0] as! UINavigationController
            let mainVC = nav.topViewController as! MainViewController
            mainVC.allCharacters = self.allCharacters
            mainVC.characterEpisodes = self.characterEpisodes
            mainVC.collectionView.reloadData()
        }
        
    }
    
    func loadLocations(pageNum: Int) {
        apolloClient.fetch(query: MortySchema.AllLocationsQuery(page: GraphQLNullable<Int>(integerLiteral: pageNum))) { result in
            guard let data = try? result.get().data else { return }
            
            if let locationData = data.locations?.results {
                for location in locationData {
                    
                    //get residents
                    for resident in location!.residents {
                        let resident = Resident(name: resident?.name, image: resident?.image)
                        self.locationResidents.append(resident)
                    }
                    
                    let location = Location(name: location?.name, type: location?.type, dimension: location?.dimension, resident: self.locationResidents)
                    
                    self.allLocations.append(location)
                    self.locationResidents = []
                }
            }
            
            //send location data to locationVC
            let nav = self.viewControllers![1] as! UINavigationController
            let locationsVC = nav.topViewController as! LocationsViewController
            locationsVC.allLocations = self.allLocations
        }
    }
    
    func loadEpisodes() {
        apolloClient.fetch(query: MortySchema.AllEpisodesQuery(page: 0)) { result in
            guard let data = try? result.get().data else { return }
            
            if let episodeData = data.episodes?.results {
                for episode in episodeData {
                    
                    for character in episode!.characters {
                        let character = Character(name: character?.name, image: character?.image, info: ["" : ""], location: ["" : ""], episodes: self.characterEpisodes)
                        self.episodeCharacters.append(character)
                    }
                    
                    let episode = Episode(name: episode?.name, info: episode?.episode, date: episode?.air_date, characters: self.episodeCharacters)
                    self.allEpisodes.append(episode)
                    self.episodeCharacters = []
                }
            }
            //send episode data to episodeVC
            let nav = self.viewControllers![2] as! UINavigationController
            let episodesVC = nav.topViewController as! EpisodesViewController
            episodesVC.allEpisodes = self.allEpisodes
        }
    }
}
