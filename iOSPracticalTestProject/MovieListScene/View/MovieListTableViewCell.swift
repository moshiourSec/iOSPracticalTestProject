//
//  MovieListTableViewCell.swift
//  iOSPracticalTestProject
//
//  Created by BJIT LTD on 5/8/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        contentView.addSubview(containerView)
        containerView.addSubview(moviePosterImageView)
        containerView.addSubview(movieTitleLabel)
        containerView.addSubview(overviewLabel)
        setUpUIConstraints()
    }

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let moviePosterImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

}

extension MovieListTableViewCell {

    private func setUpUIConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            containerView.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            containerView.heightAnchor.constraint(greaterThanOrEqualTo: moviePosterImageView.heightAnchor),

            moviePosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 128.0),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 90.0),
            moviePosterImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),

            movieTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            movieTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            movieTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

            overviewLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor,
                                               constant:10.0),
            overviewLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: 0.0),
            overviewLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])

    }
}
