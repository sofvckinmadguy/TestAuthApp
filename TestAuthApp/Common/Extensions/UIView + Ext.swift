//
//  UIView + Ext.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 01.03.2021.
//

import UIKit

extension UIView {
    
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
        if let _ = viewWithTag(475647){
            return
        }
        let backgroundView = UIView()
        backgroundView.layer.zPosition = 1
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 80, height: 80))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator.style = .gray
        }
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating(withDelay: Double = 0) {
        if withDelay > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + withDelay) {
                self.removeActivityIndicator()
            }
        }
        removeActivityIndicator()
    }
    
    fileprivate func removeActivityIndicator() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}
