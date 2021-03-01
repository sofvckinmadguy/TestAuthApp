//
//  Network.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 01.03.2021.
//

import Foundation


protocol Networkable {
    func signIn(email: String, password: String, completion: @escaping (Result<AuthResponse, NetworkError>) -> Void)
}
