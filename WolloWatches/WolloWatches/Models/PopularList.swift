//
//  PopularList.swift
//  WolloWatches
//
//  Created by Macbook on 06.11.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import Foundation

struct PopularList: Codable {
    var name: String
    var rating: Double
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case name = "title"
        case rating = "vote_average"
        case image = "poster_path"
    }
}
