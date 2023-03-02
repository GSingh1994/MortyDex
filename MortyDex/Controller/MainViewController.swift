//
//  ViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-26.
//

import UIKit
import SDWebImage

class MainViewController: UICollectionViewController {
    var allCharacters: [Character] = []
    var characterEpisodes: [Episode] = []
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Characters"
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
        cell.characterImage.sd_setImage(with: URL(string: allCharacters[indexPath.item].image!))
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "mainToDetails", sender: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.item == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            let vc = self.navigationController?.tabBarController as! TabBarController
            page += 1
            vc.loadCharacters(page: page)
            collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToDetails" {
            if let indexPath = collectionView.indexPathsForSelectedItems {
                let currentIndex = indexPath[0][1]
                let VC = segue.destination as! DetailsViewController
                
                //pass selected character ID
                VC.character.id = self.allCharacters[currentIndex].id
            }
        }
    }
}

