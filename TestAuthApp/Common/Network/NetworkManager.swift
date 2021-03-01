//
//  NetworkManager.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 01.03.2021.
//

import Foundation


enum NetworkError: String, Error {
    case authenticationError = "wrong password"
    case unrecognized = "unrecognized error"
}

final class NetworkManager {
    
    fileprivate let baseUrlPath: String = "https://api-qa.mvpnow.io/v1"
    fileprivate let projectid: String = "58b3193b-9f15-4715-a1e3-2e88e375f62b"
    
    fileprivate func configureParams(email: String, password: String) -> Dictionary<String, String> {
        let paramsDict: Dictionary<String, String> = [
            "email": email,
            "password": password,
            "project_id": projectid
        ]
        return paramsDict
    }
}


extension NetworkManager: Networkable {
    
    
    func signIn(email: String, password: String, completion: @escaping (Result<AuthResponse, NetworkError>) -> Void) {
        let appendingPath = "/sessions"
        let fullPath = baseUrlPath + appendingPath
        guard let url = URL(string: fullPath) else {
            print("error configuring url")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: configureParams(email: email, password: password), options: .prettyPrinted) else {
            completion(.failure(.unrecognized))
            print("can't configure params")
            return
        }
        request.httpBody = httpBody
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 401 {
                        print(response)
                        completion(.failure(.authenticationError))
                        return
                    }
                    if let data = data {
                        do {
                            let decodedData = try JSONDecoder().decode(AuthResponse.self, from: data)
                            completion(.success(decodedData))
                        } catch let error {
                            print("error in decoding: \(error.localizedDescription)")
                            completion(.failure(.unrecognized))
                        }
                    }
                }
            }
        }.resume()
    }
    
}
