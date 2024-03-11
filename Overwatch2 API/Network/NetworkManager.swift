//
//  NetworkManager.swift
//  Overwatch2 API
//
//  Created by Erislam Nurluyol on 11.03.2024.
//

import Foundation
import Combine

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "overfast-api.tekrop.fr"
        components.path = endpoint.stringValue
        let (data, _) = try await URLSession.shared.data(from: components.url!)
        return try JSONDecoder().decode(T.self, from: data)
    }
}


enum Endpoint {
    case heroes
    case hero(String)
    
    var stringValue: String {
        switch self {
        case .heroes: "/heroes"
        case .hero(let heroKey): "/heroes/\(heroKey)"
        }
    }
}
