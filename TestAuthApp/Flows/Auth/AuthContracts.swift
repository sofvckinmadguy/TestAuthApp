//
//  AuthContracts.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 26.02.2021.
//

import Foundation

protocol AuthViewInput: class {
    func showAlert(title: String, message: String, buttonTitle: String, handler: (() -> ()?)?)
    func signInSucceed()
    func startHUD()
    func stopHUD()
    func wrongPassword()
}

protocol AuthViewOutput: class {
    func signIn(email: String?, password: String?)
}
