//
//  ViewModel.swift
//  HomeWork
//
//  Created by Chan Jung on 7/12/22.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    private let networkMgr: NetworkRepository = NetworkRepository.shared
    @Published var viewOrder: [ViewType]?
    @Published var userData: [User]?
    @Published var isLoading: Bool = true
    @Published var edgeCaseMessage: String = ""
    @Published var showEndOfListAlert: Bool = false
    
    @MainActor
    init() {
        Task {
            do {
                self.viewOrder = try await networkMgr.getProfileOrder()
                self.userData = try await networkMgr.getUserData()
            } catch(let error) {
                print("error happend: \(error.localizedDescription)")
            }
        }
        
        if viewOrder == nil {
            self.edgeCaseMessage = "view order is unavailable"
        }
        
        if userData?.isEmpty ?? true {
            self.edgeCaseMessage = "cannot fetch userData"
        }
        
        isLoading = false
    }
    
    @MainActor
    func nextUser() {
        let currentUser = self.userData?.first
        let clippedUserList = userData?.filter{ $0 != currentUser }
        
        if let lst = clippedUserList, lst.isEmpty {
            self.showEndOfListAlert = true
        }
        
        // if you clipped to the end of the list, then show alert
        self.userData = (clippedUserList?.isEmpty ?? true) ? userData : clippedUserList
    }
}
