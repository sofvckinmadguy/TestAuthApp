//
//  AuthViewOutput.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 01.03.2021.
//

import Foundation

protocol AuthModuleOutput: Presentable {
    var onSignIn: (() -> Void)? { get set }
}
