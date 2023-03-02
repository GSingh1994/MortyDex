//
//  LocationDetail.swift
//  MortyDex
//
//  Created by Gagan on 2023-03-01.
//

import Foundation

class LocationDetail: Location {
    var residents: [Resident] = []
}

class Resident {
    var id: String?
    var name: String?
    var image: String?
}
