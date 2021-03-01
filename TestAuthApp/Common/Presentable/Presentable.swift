//
//  Presentable.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 28.02.2021.
//

import UIKit


protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
        return self
    }
}
