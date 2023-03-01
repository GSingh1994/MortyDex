//
//  CharacterDetail.swift
//  MortyDex
//
//  Created by Gagan on 2023-03-01.
//

import Foundation

class CharacterDetail: Character {
    var status: String? = nil
    var species: String? = nil
    var gender: String? = nil
    var origin: String? = nil
    var location: String? = nil
    var episodes: [Episode] = []
}
