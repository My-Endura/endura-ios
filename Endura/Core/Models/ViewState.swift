//
//  ViewState.swift
//  Endura
//
//  Created by Florian Rohrauer on 15.10.24.
//

import Foundation

enum ViewState<T> {
    case idle
    case loading
    case success(T)
    case error(String)
}
