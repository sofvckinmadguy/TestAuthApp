//
//  AuthPresenter.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 26.02.2021.
//

import Foundation


class AuthPresenter {
    
    weak var view: AuthViewInput!
    fileprivate let networkManager: Networkable = NetworkManager()
    var userSession: UserSessionController!
}

extension AuthPresenter: AuthViewOutput {
    
    func signIn(email: String?, password: String?) {
        guard let email = email, let password = password else {
            view.showAlert(title: "Error", message: "Fill all fields", buttonTitle: "Ok", handler: nil)
            return
        }
        view.startHUD()
        let onResult: (Result<AuthResponse, NetworkError>) -> Void = { [weak self] result in
            switch result {
            case .success(let response):
                self?.view.stopHUD()
                self?.userSession.openSession(with: SessionInfo(userId: response.user.id, token: response.token))
                self?.view.signInSucceed()
            case .failure(let error):
                self?.view.stopHUD()
                switch error {
                case .authenticationError:
                    self?.view.wrongPassword()
                default:
                    self?.view.showAlert(title: "Error", message: error.rawValue, buttonTitle: "Ok", handler: nil)
                }
            }
        }
        networkManager.signIn(email: email, password: password, completion: onResult)
    }
    
}
