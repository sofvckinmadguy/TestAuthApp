//
//  SimpleButton.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 28.02.2021.
//

import UIKit

final class SimpleButton: UIButton {
    
    init(text: String, titleColor: UIColor) {
        super.init(frame: .zero)
        self.setTitleColor(titleColor, for: .normal)
        self.setAttributedTitle(NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .semibold)]), for: .normal)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
    }
    
}
