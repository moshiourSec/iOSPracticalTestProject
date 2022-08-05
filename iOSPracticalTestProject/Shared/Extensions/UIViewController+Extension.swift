//
//  UIViewController+Extension.swift
//  iOSPracticalTestProject
//
//  Created by BJIT LTD on 5/8/22.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
extension UIViewController {

    @available(iOS 13.0, *)
    static func instantiate<T>(storyBoard: String) -> T {
        let storyboard = UIStoryboard(name: storyBoard, bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }

}

enum StoryBoard: String {

    case main = "Main"

    var name:String {
        return self.rawValue
    }
}
