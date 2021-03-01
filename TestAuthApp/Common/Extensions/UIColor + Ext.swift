//
//  UIColor + Ext.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 02.03.2021.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1) {
      var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
      
      if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
      }
      
      if ((cString.count) != 6) {
        self.init(red: 50, green: 50, blue: 50, alpha: alpha)
        return
      }
      
      var rgbValue:UInt64 = 0
      Scanner(string: cString).scanHexInt64(&rgbValue)
      
      self.init(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(alpha)
      )
    }
}
