//
//  TabBarModuleOutput.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 28.02.2021.
//

import Foundation


protocol TabBarModuleOutput: Presentable {
    var onSignOut: (() -> Void)? { get set }
}
