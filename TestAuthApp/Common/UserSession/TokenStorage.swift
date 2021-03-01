//
//  TokenStorage.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 7/20/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//

import Foundation

enum StorageKeys: String {
  case userId = "userId"
  case token = "token"
}

public final class TokensStorage: TokensStoragable {
  
  private let storage: UserDefaults
  
  public init(storage: UserDefaults) {
    self.storage = storage
  }
  
  public func obtain() -> SessionInfo? {
    guard let userId = storage.object(forKey: StorageKeys.userId.rawValue),
          let token = storage.object(forKey: StorageKeys.token.rawValue) else {
      return nil
    }
    return SessionInfo(userId: userId as! String, token: token as! String)
  }
  
  public func save(data: SessionInfo) {
    storage.set(data.userId, forKey: StorageKeys.userId.rawValue)
    storage.set(data.token, forKey: StorageKeys.token.rawValue)
  }
  
  public func clean() {
    storage.removeObject(forKey: StorageKeys.userId.rawValue)
    storage.removeObject(forKey: StorageKeys.token.rawValue)
  }
  
}
