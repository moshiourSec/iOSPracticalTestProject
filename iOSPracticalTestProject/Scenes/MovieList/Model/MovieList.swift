//
//  MovieList.swift
//  iOSPracticalTestProject
//
//  Created by Moshiur Rahman Bilash on 5/17/21.
//

import Foundation

struct MovieList: Codable {
    var page: Int?
    var results: [Results]?
}

struct Results: Codable {
    var title: String?
    var overview: String?
    var poster_path: String?
    
    
}
