//
//  MovieList.swift
//  iOSPracticalTestProject
//
//  Created by Md. Moshiour Rahman on 5/8/22.
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
