//
//  JSONDecoder+Decoder.swift
//  iOSPracticalTestProject
//
//  Created by Md. Moshiour Rahman on 5/8/22.
//

import Foundation

enum ParseResult<T,H> {
    case success(T)
    case failure(H)
}

extension JSONDecoder{

    static func decodeData<T:Decodable>(model: T.Type,_ data: Data?,completion: @escaping(ParseResult<T, Error>)->Void){
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(model, from: data!)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
}
