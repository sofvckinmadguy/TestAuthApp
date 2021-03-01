//
//  AppTextField.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 28.02.2021.
//

import UIKit

final class AppTextField: UITextField {
    
    let insets: UIEdgeInsets
    
    init(placeHolder: String) {
        self.insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        super.init(frame: .zero)
        placeholder = placeHolder
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        self.textColor = .black
        self.backgroundColor = .systemGray5
        layer.cornerRadius = 10
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
}
