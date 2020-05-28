//
//  Networking.swift
//  SRCore
//
//  Created by Srinivasan Rajendran on 2020-05-28.
//

import Foundation

extension SRCore {
    public class Networking {
        public class Manager {
            public init() {}
            private let session = URLSession.shared

            public func loadData(from url: URL,
                                 completionHandler: @escaping (NetworkResult<Data>) -> Void) {
                let task = session.dataTask(with: url) { data, response, error in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
                task.resume()
            }
        }

        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}
