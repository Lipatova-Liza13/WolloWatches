//
//  NewsList.swift
//  WolloWatches
//
//  Created by Teslenko Anastasiya on 09.10.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import Foundation

struct NewsList: Codable {
    var headline: String
    var summary: String
    var date: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case headline = "original_title"
        case summary = "overview"
        case date = "release_date"
        case image = "poster_path"
    }
}
