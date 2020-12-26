//
//  News.swift
//  WolloWatches
//
//  Created by Teslenko Anastasiya on 30.09.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//
import UIKit
import Foundation

struct News: Codable {
    var results: [NewsList]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
