//
//  URLResponse+Extensions.swift
//  iOSPracticalTestProject
//
//  Created by Md. Moshiour Rahman on 5/8/22.
//

import Foundation

extension URLResponse {

    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
