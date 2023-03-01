//
//  LocationDetail.swift
//  MortyDex
//
//  Created by Gagan on 2023-03-01.
//

import Foundation

class LocationDetail: Location {
    let resident: [Resident] = []
}

struct Resident {
    let id: String?
    let name: String?
    let image: String?
}
