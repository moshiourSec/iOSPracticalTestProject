//
//  ImageView+Extensions.swift
//  iOSPracticalTestProject
//
//  Created by Md. Moshiour Rahman on 5/8/22.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func getImage(url: String, placeholderImage:  UIImage?, success:@escaping (_ _result : Any? ) -> Void,  failer:@escaping (_ _result : Any? ) -> Void) {
        self.sd_imageIndicator = SDWebImageActivityIndicator.white
        self.sd_setImage(with: URL(string: url), placeholderImage:  placeholderImage, options: SDWebImageOptions(rawValue: 0), completed: { image, error, cacheType, imageURL in

            if error == nil {
                self.image = image
                success(true)
            }else {
                failer(false)
            }
        })
    }
}
