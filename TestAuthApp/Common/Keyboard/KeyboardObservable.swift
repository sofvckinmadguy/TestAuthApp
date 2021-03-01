//
//  KeyboardObservable.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 01.03.2021.
//

import UIKit

protocol KeyboardObservable: class {

  func keyboardWillShow(_ notification: Notification)
  func keyboardWillHide(_ notification: Notification)

}

extension KeyboardObservable where Self: UIViewController {
    
    func keyboardWillShow(_ notification: Notification) {}
    func keyboardWillHide(_ notification: Notification) {}
    
    func registerForKeyboardEvents() {
      _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { notification in
        self.keyboardWillShow(notification)
      }
        
      _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { notification in
        self.keyboardWillHide(notification)
      }
    }
    
    func unregisterFromKeyboardEvents() {
      NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
      NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
