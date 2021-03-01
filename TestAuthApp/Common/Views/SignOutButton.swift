//
//  SignOutButton.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 01.03.2021.
//

import UIKit

class LogoutButton: UIButton {
    
    init(text: String) {
        super.init(frame: .zero)
        self.setAttributedTitle(NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: .bold)]), for: .normal)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        setTitleColor(.red, for: .normal)
    }
    
}
