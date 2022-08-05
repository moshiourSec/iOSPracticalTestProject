//
//  Coordinator.swift
//  iOSPracticalTestProject
//
//  Created by Md. Moshiour Rahman on 5/8/22.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get}
    func start()
}
