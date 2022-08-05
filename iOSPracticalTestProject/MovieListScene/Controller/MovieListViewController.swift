//
//  ViewController.swift
//  iOSPracticalTestProject
//
//  Created by Md. Moshiour Rahman on 5/8/22.
//

import UIKit

class MovieListViewController: BaseViewController {

    private lazy var navigationView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.numberOfLines = 0
        label.text = "Movie List"
        return label
    }()

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.returnKeyType = .done
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.placeholder = "Search"
        searchBar.sizeToFit()

        return searchBar
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(MovieListTableViewCell.self,
                           forCellReuseIdentifier: MovieListTableViewCell.identifier)
        return tableView
    }()

    var coordinator: MovieListVCCoordinator?
    private(set) var tableViewDataSource: GenericDataSource<MovieListTableViewCell,MovieListCellVM>!
    private(set) var viewModel = MovieListViewModel()
    let activity = ActivityIndicator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setUpView()
        self.viewModel.viewDidLoad(self)
        self.getMovieList()
        self.initilizedMovieListDataSource()
    }

    func setUpView() {
        searchBar.delegate = self
        view.addSubview(navigationView)
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        SetUpUIConstraints()
    }

    private func initilizedMovieListDataSource(){

        self.tableViewDataSource = GenericDataSource.init(cellIdentifier: "MovieListTableViewCell", items:self.viewModel.movieList, configureCell: { (cell, vm,indexpath) in
            cell.eachItem = vm
        })
    self.tableView.dataSource = self.tableViewDataSource
    }

    func getMovieList() {
        self.viewModel.getMovieListData(resource: self.viewModel.createMovieListRequest())
    }

}

extension MovieListViewController: MovieListViewModelDelegate {
    func showOrHideLoader(loader: Bool) {
        DispatchQueue.main.async { [self] in
            if loader == true {
                print("loading ")
                activity.showLoading(view: self.view)
            } else {
                activity.hideLoading()
            }
        }
    }

    func loadMovieListView() {
        self.tableViewDataSource.updateItems(self.viewModel.movieList)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

    }
}

extension MovieListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload(_:)), object: searchBar)
        perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 0.3)
    }

    @objc func reload(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else {
            getMovieList()
            return
        }

        self.viewModel.getMovieListData(resource: self.viewModel.createMovieListRequest(query))
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
     }
}


extension MovieListViewController {

    func SetUpUIConstraints() {
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            navigationView.heightAnchor.constraint(equalToConstant: 90),

            titleLabel.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor, constant: -16),
            NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: navigationView, attribute: .centerY, multiplier: 1.3, constant: 0),

            searchBar.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 55.0),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant:0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

    }
}


