//
//  UserSessionController.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 7/20/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//

import Foundation

public final class UserSessionController {
    
    private let userSession: UserSession
    
    public init(storage: TokensStoragable = TokensStorage(storage: UserDefaults.standard)) {
        userSession = UserSession(storage: storage)
    }
    
    public func openSession(with provider: SessionInfo) {
        userSession.startSession(with: provider)
    }
    
    public func closeSession() {
        userSession.stopSession()
    }
    
    public func canRestorePreviousSession() -> Bool { userSession.canRestorePreviousSession() }
}
