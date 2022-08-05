//
//  URLRequest+Request.swift
//  iOSPracticalTestProject
//
//  Created by Md. Moshiour Rahman on 5/8/22.
//

import Foundation

extension URLRequest{

    static func requestWith(resource:Resource)-> URLRequest{
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        print("url: \(resource.url)")
        request.addValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        return request
    }
}


enum HTTPHeaderField: String {
    case contentType     = "Content-Type"
}
enum ContentType: String {
    case json            = "application/json"
}
