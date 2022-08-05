//
//  ViewController.swift
//  iOSPracticalTestProject
//
//  Created by BJIT LTD on 5/8/22.
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setUpView()
    }

    func setUpView() {
        view.addSubview(navigationView)
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        SetUpUIConstraints()
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


