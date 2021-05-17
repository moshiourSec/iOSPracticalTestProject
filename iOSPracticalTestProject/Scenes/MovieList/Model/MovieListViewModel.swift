//
//  MovieListViewModel.swift
//  iOSPracticalTestProject
//
//  Created by Moshiur Rahman Bilash on 5/17/21.
//

import Foundation

protocol MovieListViewModelDelegate {
    func loadCategory()
}


class MovieListViewModel {
    
    private(set) var delegate: MovieListViewModelDelegate?
    
    func viewDidLoad<T>(_ vc: T) {
        self.delegate = vc.self as? MovieListViewModelDelegate
    }
    
    
    func CreateMovieListRequest() -> Resource {
        
        let urlString = "\(URL.movieList)"
        
        guard let url = URL(string: urlString) else {
            fatalError("URl was incorrect")
        }
        var resource = Resource(url: url)
        resource.httpMethod = HttpMethod.get
        return resource
    }

    
}
