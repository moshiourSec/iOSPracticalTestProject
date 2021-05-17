//
//  ImageView+Extension.swift
//  iOSPracticalTestProject
//
//  Created by Moshiur Rahman Bilash on 5/17/21.
//

import Foundation
import UIKit

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

