//
//  Account.swift
//  FinancialApp
//
//  Created by Aaron Lee on 2020-11-30.
//

import Foundation

enum AccountType: String, Codable, CaseIterable {
    case checking
    case saving
}

extension AccountType {
    
    var title: String {
        switch self {
        case .checking:
            return "Checking"
        case .saving:
            return "Saving"
        }
    }
    
}

struct Account: Codable {
    
    var id: String
    var name: String
    let accountType: AccountType
    var balance: Double
    
}
