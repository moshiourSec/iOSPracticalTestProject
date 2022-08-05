//
//  URLs.swift
//  iOSPracticalTestProject
//
//  Created by Md. Moshiour Rahman on 5/8/22.
//

import Foundation

enum BaseURL : String {
    case movieDBBaseURL = "https://api.themoviedb.org"
    case moviePosterURL = "https://image.tmdb.org/t/p/w500/"
}

struct URLManager {
    static func getUrl(baseURL: BaseURL, path: String) -> URL?{
        return URL(string: baseURL.rawValue + path)
    }
}

extension URL {

    static let movieListURL = URLManager.getUrl(baseURL: .movieDBBaseURL, path: "/3/search/movie")

    mutating func appendQueryItem(name: String, value: String?) {

        guard var urlComponents = URLComponents(string: absoluteString) else { return }

        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        let queryItem = URLQueryItem(name: name, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        self = urlComponents.url!
    }
}
