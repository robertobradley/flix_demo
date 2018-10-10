//
//  MoiveApiManager.swift
//  flix_demo
//
//  Created by user144731 on 10/9/18.
//  Copyright © 2018 Roberto Bradley. All rights reserved.
//

import Foundation

    class MovieApiManager {
        
        static let baseUrl = "https://api.themoviedb.org/3/movie/"
        static let apiKey = "19abbb5538b8ef9816f9f3206294d95f"
        var session: URLSession
        
        init() {
            session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        }
        
        func nowPlayingMovies(completion: @escaping ([Movie]?, Error?) -> ()) {
            let url = URL(string: MovieApiManager.baseUrl + "now_playing?api_key=\(MovieApiManager.apiKey)")!
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            let task = session.dataTask(with: request) { (data, response, error) in
                // This will run when the network request returns
                if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                    
                    let movies = Movie.movies(dictionaries: movieDictionaries)
                    completion(movies, nil)
                } else {
                    completion(nil, error)
                }
            }
            task.resume()
        }
        
        func superheroMovies(completion: @escaping ([Movie]?, Error?) -> ()) {
            let url = URL(string: MovieApiManager.baseUrl + "297762/similar?api_key=\(MovieApiManager.apiKey)")!
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            let task = session.dataTask(with: request) { (data, response, error) in
                
                // This will run when the network request returns
                if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                    
                    let movies = Movie.movies(dictionaries: movieDictionaries)
                    completion(movies, nil)
                } else {
                    completion(nil, error)
                }
            }
            task.resume()
        }
        
        //popular function
        func popularMovies(completion: @escaping ([Movie]?, Error?) -> ()) {
            let url = URL(string: MovieApiManager.baseUrl + "popular?api_key=\(MovieApiManager.apiKey)")!
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            let task = session.dataTask(with: request) { (data, response, error) in
                
                // This will run when the network request returns
                if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                    
                    let movies = Movie.movies(dictionaries: movieDictionaries)
                    completion(movies, nil)
                } else {
                    completion(nil, error)
                }
            }
            task.resume()
        }
        
    }
