//
//  AuthConfigurator.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 26.02.2021.
//

import UIKit

class AuthConfigurator {
    
    static func build(with userSession: UserSessionController) -> AuthModuleOutput {
        let vc = AuthViewController()
        let presenter = AuthPresenter()
        presenter.userSession = userSession
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
}
