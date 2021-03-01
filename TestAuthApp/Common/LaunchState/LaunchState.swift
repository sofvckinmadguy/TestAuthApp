//
//  LaunchState.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 28.02.2021.
//

class LaunchState {
    
    fileprivate let userSession: UserSessionController!
    fileprivate let router: Routable!
    
    init(userSession: UserSessionController, router: Routable) {
        self.userSession = userSession
        self.router = router
    }
    
    fileprivate func runState() {
        if userSession.canRestorePreviousSession() {
            var mainConfig = MainConfigurator.build(userSession: userSession)
            mainConfig.onSignOut = { [weak self] in
                self?.runState()
            }
            router.setRootModule(mainConfig, hideBar: true)
        } else {
            var authConfig = AuthConfigurator.build(with: userSession)
            authConfig.onSignIn = { [weak self] in
                self?.runState()
            }
            router.setRootModule(authConfig, hideBar: true)
        }
    }
    
}

// MARK: -AppLaunchState
extension LaunchState: AppLaunchState {
    
    func start() {
        self.runState()
    }
    
}
