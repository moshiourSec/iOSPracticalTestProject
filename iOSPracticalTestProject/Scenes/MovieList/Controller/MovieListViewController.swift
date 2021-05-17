//
//  MovieListViewController.swift
//  iOSPracticalTestProject
//
//  Created by Moshiur Rahman Bilash on 5/17/21.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var coordinator: MovieListVCCoordinator?
    private(set) var viewModel = MovieListViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.viewDidLoad(self)
        getMovieList()
        
    }
    
    func getMovieList() {
        self.viewModel.getMovieListData(resource: self.viewModel.CreateMovieListRequest())
    }
    
}
