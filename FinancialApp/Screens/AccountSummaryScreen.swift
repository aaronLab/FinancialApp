//
//  AccountSummaryScreen.swift
//  FinancialApp
//
//  Created by Aaron Lee on 2020-11-30.
//

import SwiftUI

struct AccountSummaryScreen: View {
    
    @ObservedObject private var viewModel = AccountSummaryViewModel()
    
    var body: some View {
        VStack {
            AccountListView(accounts: viewModel.accounts)
            
            HStack {
                Text("Total: ")
                Spacer()
                Text("\(viewModel.total.formatAsCurrency())")
                    .foregroundColor(.green)
            }
            .padding()
            
        } //: VSTACK
        .onAppear {
            self.viewModel.getAllAccounts()
        } //: ONAPPEAR
    }
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
