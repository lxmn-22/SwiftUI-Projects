//
//  NetworkManager.swift
//  DietSnap
//
//  Created by Laxman Singh Koranga on 18/07/2024.
//

// Network Manager to handle the API request and fetch the JSON data.
import Foundation

// I don't want any class can to inherit the file.
final class NetworkManager {
    func request<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // URL response doesn't have status code, so will use HTTPURLResponse.
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
}
