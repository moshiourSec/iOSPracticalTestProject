//
//  HTTPStatusCodes.swift
//  iOSPracticalTestProject
//
//  Created by Moshiur Rahman Bilash on 5/17/21.
//

import Foundation

enum HTTPStatusCodes: Int,Error {
    // 200 Success
    case OK = 200
    case NoContent = 204
    case BadRequest = 400 // Bad Request
    case InternalServerError = 500
}



