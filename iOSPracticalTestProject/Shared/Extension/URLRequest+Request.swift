//
//  URLRequest+Request.swift
//  iOSPracticalTestProject
//
//  Created by Moshiur Rahman Bilash on 5/17/21.
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
