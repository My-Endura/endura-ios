//
//  RestClient.swift
//  Endura
//
//  Created by Florian Rohrauer on 15.10.24.
//

import Foundation

class RestClient {
    static let shared = RestClient()
    
    private let host = "192.168.3.104"
    private let port = 8080
   
    func get<T: Codable>(path: String) async throws -> T {
        let request = URLRequest(url: try buildUrl(path: path))
        return try await perform(request: request)
    }
    
    func post<T: Codable>(path: String, body: Encodable?) async throws -> T {
        var request = URLRequest(url: try buildUrl(path: path))
        request.httpMethod = "POST"

        if let body = body {
            let jsonBody = try JSONEncoder().encode(body)
            request.httpBody = jsonBody
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        return try await perform(request: request)
    }
    
    func put<T: Codable>(path: String, body: Encodable?) async throws -> T {
        var request = URLRequest(url: try buildUrl(path: path))
        request.httpMethod = "PUT"
        
        if let body = body {
            let jsonBody = try JSONEncoder().encode(body)
            request.httpBody = jsonBody
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        return try await perform(request: request)
    }
    
    func delete<T: Codable>(path: String) async throws -> T {
        var request = URLRequest(url: try buildUrl(path: path))
        request.httpMethod = "DELETE"
        return try await perform(request: request)
    }
    
    private func perform<T: Codable>(request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
    
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError()
        }
        
        if(200...299).contains(httpResponse.statusCode) {
            let responseData = try JSONDecoder().decode(T.self, from: data)
            return responseData
        } else {
            let errorData = try JSONDecoder().decode(ErrorResponse.self, from: data)
            throw ApiError(errorResponse: errorData)
        }
    }
    
    private func buildUrl(path: String) throws -> URL {
        let urlString = "http://\(host):\(port)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        return url.appending(path: path)
    }
}

