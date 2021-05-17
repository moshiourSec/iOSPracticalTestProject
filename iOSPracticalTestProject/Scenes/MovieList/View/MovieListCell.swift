//
//  MovieListTableViewCell.swift
//  iOSPracticalTestProject
//
//  Created by Moshiur Rahman Bilash on 5/17/21.
//

import UIKit

class MovieListCell: UITableViewCell {
    
    @IBOutlet weak var  posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptonLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var eachCell:MovieListCellVM!{
        didSet {
            
            let placeholderImage = UIImage(named: "movie_PlaceHolder")
            self.posterImageView.getImage(url: "\(URL.imageURL)\(eachCell.poster_path ?? "")", placeholderImage: placeholderImage) { (success) in
                        //   cell.bannerImageView.contentMode = .scaleAspectFill
                           
                       } failer: { (failed) in
                           self.posterImageView.image = placeholderImage
                          // cell.bannerImageView.contentMode = .scaleAspectFit
                       }
            self.titleLabel.text = eachCell.title
            self.descriptonLabel.text = eachCell.overview
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
