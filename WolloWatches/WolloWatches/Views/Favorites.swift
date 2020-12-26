//
//  Favorites.swift
//  WolloWatches
//
//  Created by Macbook on 29.10.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import Foundation

struct Favorites: Codable {
    var favoritesResults: [VideoList]
    
    enum CodingKeys: String, CodingKey {
        case favoritesResults = "results"
    }
}
