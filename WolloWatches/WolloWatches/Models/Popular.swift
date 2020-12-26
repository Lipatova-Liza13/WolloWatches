//
//  Popular.swift
//  WolloWatches
//
//  Created by Macbook on 06.11.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import Foundation

struct Popular: Codable {
    var popularResults: [PopularList]
    
    enum CodingKeys: String, CodingKey {
        case popularResults = "results"
    }
}
