//
//  BigLabel.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 28.02.2021.
//

import UIKit

final class BigLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        self.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.textColor = .black
    }
}
