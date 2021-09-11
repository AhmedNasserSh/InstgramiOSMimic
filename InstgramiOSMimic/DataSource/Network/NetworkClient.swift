//
//  NetworkClient.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
class NetworkClient {
    func load<Output>(request: Request<Output>, completion: @escaping (Result<Output,NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request.url) { data, _, error in
            guard  error == nil else {
                completion(.failure(.server))
                return
            }
            
            guard let model = data.flatMap(request.parse) else {
                completion(.failure(.parse))
                return
            }
            
            completion(.success(model))
        }
    }
}
