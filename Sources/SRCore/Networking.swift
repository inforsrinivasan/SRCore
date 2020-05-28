//
//  Networking.swift
//  SRCore
//
//  Created by Srinivasan Rajendran on 2020-05-28.
//

import Foundation

protocol NetworkSession {
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void)
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: request) { (data, _, error) in
            completionHandler(data,error)
        }
        task.resume()
    }

    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url) { data, _, error in
            completionHandler(data,error)
        }
        task.resume()
    }
}

extension SRCore {
    public class Networking {
        public class Manager {
            public init() {}
            internal var session: NetworkSession = URLSession.shared

            /// Calls the internet to retreive data
            /// - Parameters:
            ///   - url: the location you wish to fetch data from
            ///   - completionHandler: returns a result object which signifies the sattus of the request
            public func loadData(from url: URL,
                                 completionHandler: @escaping (NetworkResult<Data>) -> Void) {
                session.get(from: url) { data, error in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }

            }

            /// Send data to specific location
            /// - Parameters:
            ///   - url: the location you wish to send data
            ///   - body: object you wish to send over the network
            ///   - completionHandler: return result object which signifies the status of request
            public func sendData<I: Codable>(to url: URL, body: I, completionHandler: @escaping (NetworkResult<Data>) -> Void) {
                var request = URLRequest(url: url)
                do {
                    let httpBody = try JSONEncoder().encode(body)
                    request.httpBody = httpBody
                    request.httpMethod = "POST"
                    session.post(with: request) { data, error in
                        let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                        completionHandler(result)
                    }
                } catch let error {
                    completionHandler(.failure(error))
                }
            }
        }

        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}
