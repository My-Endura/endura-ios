//
//  ErrorResponse.swift
//  Endura
//
//  Created by Florian Rohrauer on 15.10.24.
//

import Foundation

struct ErrorResponse: Codable {
    let status: String
    let message: String
}
