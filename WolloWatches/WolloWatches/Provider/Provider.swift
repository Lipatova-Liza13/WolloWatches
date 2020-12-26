//
//  Provider.swift
//  WolloWatches
//
//  Created by Teslenko Anastasiya on 06.10.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//
import UIKit
import Foundation

class Provider {
    let baseUrl = "https://api.themoviedb.org/"
    let apiKey = "0ff69c32b74d705c975bcd6fe072688a&"
    let language = "language=en-US"

    public func fetchNewsJSON(completition: @escaping(Result<[NewsList], Error>) ->()) {
        let fullUrlStr = baseUrl  + "3/movie/top_rated?api_key=" + apiKey + language + "&page=1"
        let url = URL(string: fullUrlStr)!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                completition(.failure(error))
                return
            }
            do {
                let decoder = JSONDecoder()
                let event = try decoder.decode(News.self, from: data!)
                completition(.success(event.results))
            } catch let error as NSError {
                completition(.failure(error))
            }
        }
        task.resume()
    }
    
    public func fetchFavoritesJSON(completition: @escaping(Result<[VideoList], Error>) ->()) {
        let fullUrlStr = baseUrl  + "3/movie/550/videos?api_key=" + apiKey + language
        let url = URL(string: fullUrlStr)!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                completition(.failure(error))
                return
            }
            do {
                let decoder = JSONDecoder()
                let event = try decoder.decode(Favorites.self, from: data!)
                completition(.success(event.favoritesResults))
            } catch let error as NSError {
                completition(.failure(error))
            }
        }
        task.resume()
    }
    
    public func fetchWhatToWatchJSON(completition: @escaping(Result<[PopularList], Error>) ->()) {
        let fullUrlStr = baseUrl  + "3/movie/popular?api_key=" + apiKey + language
        let url = URL(string: fullUrlStr)!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            do {
                let decoder = JSONDecoder()
                let event = try decoder.decode(Popular.self, from: data!)
                completition(.success(event.popularResults))
            } catch let error as NSError {
                completition(.failure(error))
            }
            if let error = error {
                completition(.failure(error))
                return
            }
        }
        task.resume()
    }
}
