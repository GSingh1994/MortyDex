//
//  ViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-26.
//

import UIKit
import Foundation
import Apollo



class ViewController: UIViewController {
    let apolloClient = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    override func viewDidLoad() {
        super.viewDidLoad()
        apolloClient.fetch(query: MortySchema.AllCharactersQuery(page: 1)) { result in
          guard let data = try? result.get().data else { return }
            print(data.characters?.results![1]?.name) // Luke Skywalker
        }
        
    }


}

