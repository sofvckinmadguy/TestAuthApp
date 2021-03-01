//
//  BigButton.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 28.02.2021.
//

import UIKit

final class BigButton: UIButton {
    
    var cornerRadius: CGFloat!
    
    init(text: String, titleColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat) {
        super.init(frame: .zero)        
        self.cornerRadius = cornerRadius
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.setAttributedTitle(NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .semibold)]), for: .normal)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        addButtonShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func addButtonShadow() {
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = UIColor.gray.cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = CGSize(width: 1, height: 2)
        shadowLayer.layer.shadowOpacity = 0.8
        shadowLayer.layer.shadowRadius = cornerRadius
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        self.superview?.addSubview(shadowLayer)
        self.superview?.bringSubviewToFront(self)
    }
}

