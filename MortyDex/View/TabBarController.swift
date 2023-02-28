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

        let charactersNavController = self.viewControllers![1] as! UINavigationController
        let LocationsVC = charactersNavController.topViewController as! LocationsViewController
        
        loadData()
    }
    
    func loadData() {
        apolloClient.fetch(query: MortySchema.AllCharactersQuery(page: 1)) { result in
            guard let data = try? result.get().data else { return }
            
//            if let charactersData = data.characters?.results {
//                for char in charactersData {
//        
//                    //get episodes
//                    for e in char!.episode {
//                        let episode = Episode(name: e?.name, info: e?.episode, date: e?.air_date)
//                        self.characterEpisodes.append(episode)
//                    }
//                    
//                    //fill-out struct instance
//                    let character = Character(name: char?.name, image: char?.image, info: ["Status": char?.status,"Gender": char?.gender, "Species": char?.species], location: ["Origin": char?.origin?.name, "Last seen": char?.location?.name], episodes: self.characterEpisodes)
//                    
//                    self.allCharacters.append(character)
//                    self.characterEpisodes = []
//                }
//            }
//            self.collectionView.reloadData()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
