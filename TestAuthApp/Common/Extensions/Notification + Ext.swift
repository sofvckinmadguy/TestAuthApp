//
//  Notification + Ext.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 01.03.2021.
//

import UIKit

extension Notification {
    var keyboardSize: CGSize? {
      return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
    }
}
