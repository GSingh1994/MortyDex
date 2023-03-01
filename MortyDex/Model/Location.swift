//
//  Location.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-28.
//

import Foundation

struct Location {
    let name: String?
    let type: String?
    let dimension: String?
    let resident: [Resident]
}

struct Resident {
    let name: String?
    let image: String?
}
