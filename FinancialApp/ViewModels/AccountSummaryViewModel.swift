//
//  AccountSummaryViewModel.swift
//  FinancialApp
//
//  Created by Aaron Lee on 2020-11-30.
//

import Foundation

final class AccountSummaryViewModel: ObservableObject {
    
    private var _accountModels = [Account]()
    
    @Published var accounts: [AccountViewModel] = [AccountViewModel]()
    
    var total: Double {
        _accountModels.map { $0.balance }.reduce(0, +)
    }
    
    func getAllAccounts() {
        
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    self._accountModels = accounts
                    DispatchQueue.main.async {
                        self.accounts = accounts.map(AccountViewModel.init)
                    }
                }
            case .failure(let error):
                print("Handle the error: \(error)")
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
        account.id
    }
    
    var accountType: String {
        account.accountType.title
    }
    
    var balance: Double {
        account.balance
    }
}
