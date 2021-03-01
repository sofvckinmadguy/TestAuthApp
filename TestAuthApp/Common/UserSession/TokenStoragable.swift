//
//  TokenStoragable.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 7/20/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//

import Foundation

public protocol TokensStoragable {
  func obtain() -> SessionInfo?
  func save(data: SessionInfo)
  func clean()
}
