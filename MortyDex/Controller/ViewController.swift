//
//  ViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-26.
//

import UIKit
import Foundation
import Apollo

class ViewController: UICollectionViewController {
    let apolloClient = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    
    var allCharacters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apolloClient.fetch(query: MortySchema.AllCharactersQuery(page: 1)) { result in
            guard let data = try? result.get().data else { return }
            
            if let charactersData = data.characters?.results {
                for char in charactersData {
                    let character = Character(name: (char?.name)!, image: (char?.image)!)
                    self.allCharacters.append(character)
                }
            }
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCharacters.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Character", for: indexPath) as! CharacterCell
        //cell decorations
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        //cell data
        cell.characterName.text = allCharacters[indexPath.item].name
        
        let url = NSURL(string: allCharacters[indexPath.item].image)
        let imagedata = NSData.init(contentsOf: url! as URL)
        
        if imagedata != nil {
            cell.characterImage.image = UIImage(data:imagedata! as Data)
        }
        
        return cell
    }
    
}

