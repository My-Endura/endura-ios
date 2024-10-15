//
//  ApiError.swift
//  Endura
//
//  Created by Florian Rohrauer on 15.10.24.
//

import Foundation

struct ApiError: Error {
    let errorResponse: ErrorResponse
}
