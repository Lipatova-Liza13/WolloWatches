//
//  VideoList.swift
//  WolloWatches
//
//  Created by Macbook on 29.10.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import Foundation

struct VideoList: Codable {
    var videoName: String
    var videoKey: String
    
    enum CodingKeys: String, CodingKey {
        case videoName = "name"
        case videoKey = "key"
    }
}
