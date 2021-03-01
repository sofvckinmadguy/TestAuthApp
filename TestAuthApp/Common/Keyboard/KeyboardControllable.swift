//
//  KeyboardControllable.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 01.03.2021.
//

import UIKit

@objc protocol KeyboardControllable: class {
    @objc optional func handleKeyboardWillShow(_ notification: Notification)
    @objc optional func handleKeyboardDidShow(_ notification: Notification)
    @objc optional func handleKeyboardWillHide(_ notification: Notification)
    @objc optional func handleKeyboardDidHide(_ notification: Notification)
    @objc optional func handleKeyboardWillChangeFrame(_ notification: Notification)
    @objc optional func handleKeyboardDidChangeFrame(_ notification: Notification)
}

extension KeyboardControllable where Self: UIView {
  func handleKeyboardWillShow(_ notification: Notification) { }
  func handleKeyboardDidShow(_ notification: Notification) { }
  func handleKeyboardWillHide(_ notification: Notification) { }
  func handleKeyboardDidHide(_ notification: Notification) { }
  func handleKeyboardWillChangeFrame(_ notification: Notification) { }
  func handleKeyboardDidChangeFrame(_ notification: Notification) { }
}

