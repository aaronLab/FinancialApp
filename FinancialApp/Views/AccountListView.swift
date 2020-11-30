//
//  AccountListView.swift
//  FinancialApp
//
//  Created by Aaron Lee on 2020-11-30.
//

import SwiftUI

struct AccountListView: View {
    let accounts: [AccountViewModel]
    
    var body: some View {
        List(accounts, id: \.accountId) { account in
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(account.name)
                        .font(.headline)
                    
                    Text(account.accountType)
                        .opacity(0.5)
                } //: VSTACK
                Spacer()
                Text("\(account.balance.formatAsCurrency())")
                    .foregroundColor(.green)
            } //: HSTACK
        } //: LIST
    }
}
