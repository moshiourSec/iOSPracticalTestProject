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
           // self.imageView ==
            self.titleLabel.text = eachCell.title
            self.descriptonLabel.text = eachCell.overview
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
