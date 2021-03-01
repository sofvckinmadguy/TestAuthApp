//
//  Routable.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 28.02.2021.
//

import UIKit

protocol Routable: Presentable {
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
}

