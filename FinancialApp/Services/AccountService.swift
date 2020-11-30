//
//  AccountService.swift
//  FinancialApp
//
//  Created by Aaron Lee on 2020-11-30.
//

import Foundation

enum NetworkError: Error {
    case baseURL
    case decodingError
    case noData
}

final class AccountService {
    
    private init() { }
    
    static let shared = AccountService()
    
    func getAllAccounts(completion: @escaping (Result<[Account]?, NetworkError>) -> Void) {
        
        guard let url = URL.urlForAccounts() else {
            return completion(.failure(.baseURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let accounts = try? JSONDecoder().decode([Account].self, from: data)
            
            if accounts == nil {
                completion(.failure(.decodingError))
            } else {
                completion(.success(accounts))
            }
            
        }.resume()
        
    }
    
}
