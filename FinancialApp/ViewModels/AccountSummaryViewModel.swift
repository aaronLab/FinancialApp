//
//  AccountSummaryViewModel.swift
//  FinancialApp
//
//  Created by Aaron Lee on 2020-11-30.
//

import Foundation

final class AccountSummaryViewModel: ObservableObject {
    
    private var _accounts = [Account]()
    
    var accounts: [AccountViewModel] = [AccountViewModel]()
    
    var total: Double {
        _accounts.map { $0.balance }.reduce(0, +)
    }
    
    func getAllAccounts() {
        
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    self._accounts = accounts
                    self.accounts = accounts.map(AccountViewModel.init)
                }
            case .failure(let error):
                print("Handle the error: \(error.localizedDescription)")
            }
        }
        
    }
    
}

final class AccountViewModel {
    var account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    var name: String {
        account.name
    }
    
    var accountId: String {
        account.id.uuidString
    }
    
    var accountType: String {
        account.accountType.title
    }
    
    var balance: Double {
        account.balance
    }
}
