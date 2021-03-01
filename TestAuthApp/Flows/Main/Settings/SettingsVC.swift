//
//  ThirdVC.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 26.02.2021.
//

import UIKit


final class SettingsViewController: UIViewController {
    
    var onSignOut: (() -> Void)?
    var userSession: UserSessionController!
    
    fileprivate let signOutButton: LogoutButton = {
        let btn = LogoutButton(text: "Log out")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        self.navigationItem.title = "Settings"
        view.addSubview(signOutButton)
        signOutButton.addTarget(self, action: #selector(signOutTapped), for: .touchUpInside)
    }
    
    @objc fileprivate func signOutTapped() {
        userSession.closeSession()
        onSignOut?()
    }
}


// MARK: -make constraints
fileprivate extension SettingsViewController {
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
