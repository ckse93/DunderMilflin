//
//  HomeWorkApp.swift
//  HomeWork
//
//  Created by Chan Jung on 7/12/22.
//

import SwiftUI

@main
struct HomeWorkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ProfileViewModel())
        }
    }
}
