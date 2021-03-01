//
//  AuthResponse.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 01.03.2021.
//

import Foundation


struct AuthResponse: Decodable {
    
    let token: String
    let user: UserResponse
    
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case user
    }
}

struct UserResponse: Decodable {
    
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}
