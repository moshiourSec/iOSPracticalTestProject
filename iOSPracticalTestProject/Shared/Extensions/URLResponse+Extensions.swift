//
//  URLResponse+Extensions.swift
//  iOSPracticalTestProject
//
//  Created by BJIT LTD on 5/8/22.
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
