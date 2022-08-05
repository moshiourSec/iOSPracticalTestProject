//
//  HTTPStatusCode.swift
//  iOSPracticalTestProject
//
//  Created by Md. Moshiour Rahman on 5/8/22.
//

import Foundation

enum HTTPStatusCodes: Int,Error {
    // 200 Success
    case OK = 200
    case NoContent = 204
    case BadRequest = 400 // Bad Request
    case InternalServerError = 500
}


