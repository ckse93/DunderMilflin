//
//  ContentView.swift
//  HomeWork
//
//  Created by Chan Jung on 7/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ProfileViewModel
    @State private var btnSize: CGSize = .zero
    
    init(viewModel: ProfileViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    if let currentUser = viewModel.userData?.first, let order = viewModel.viewOrder {
                        ProfileView(order: order, userData: currentUser)
                    } else {
                        Spacer()
                        
                        Text(Image(systemName: "exclamationmark.triangle"))
                            .fontWeight(.semibold)
                        
                        Text("error while gathering data")
                        
                        Spacer()
                    }
                }
            }
            
            CircularButton(title: "Next") {
                viewModel.nextUser()
            }
            .padding(Dimensions.spacelarge)

        }
        .alert("End of user list", isPresented: $viewModel.showEndOfListAlert, actions: {}, message: {
            Text("end of the list")
        })

    }
}
