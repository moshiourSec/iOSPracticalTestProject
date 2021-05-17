//
//  MovieListViewController.swift
//  iOSPracticalTestProject
//
//  Created by Moshiur Rahman Bilash on 5/17/21.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    private(set) var tableViewDataSource: GenericDataSource<MovieListCell,MovieListCellVM>!
    var coordinator: MovieListVCCoordinator?
    private(set) var viewModel = MovieListViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.viewDidLoad(self)
        self.getMovieList()
        self.initilizedMovieListDataSource()
    }
    
    private func initilizedMovieListDataSource(){

        self.tableViewDataSource = GenericDataSource.init(cellIdentifier: "MovieListCell", items:self.viewModel.movieList, configureCell: { (cell, vm,indexpath) in
            cell.eachCell = vm
        })
    self.movieListTableView.dataSource = self.tableViewDataSource
}

    
    func getMovieList() {
        self.viewModel.getMovieListData(resource: self.viewModel.CreateMovieListRequest())
    }
    
}

extension MovieListViewController: MovieListViewModelDelegate {
    func loadMovieListView() {
        self.tableViewDataSource.updateItems(self.viewModel.movieList)
        DispatchQueue.main.async {
            print("1111111")
            self.movieListTableView.reloadData()
        }
        
    }
    
    
}
