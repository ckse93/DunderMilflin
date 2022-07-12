//
//  ProfileView.swift
//  HomeWork
//
//  Created by Chan Jung on 7/12/22.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    let order: [ViewType]
    let userData: User
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(order, id: \.self) { order in
                switch order {
                case .name:
                    NameCell(name: userData.name)
                    
                case .gender:
                    GenderCell(gender: userData.gender)
                    
                case .photo:
                    if let photoURL = userData.photo {
                        AsyncImage(url: URL(string: photoURL)) { img in
                            img
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Image(systemName: "person")
                        }
                        .frame(width: Dimensions.screenWidth, height: Dimensions.screenWidth)
                        .clipped()
                    } else {
                        EmptyView()
                    }
                    
                case .about:
                    if let about = userData.about {
                        AboutCell(about: about)
                    } else {
                        EmptyView()
                    }
                    
                case .school:
                    if let school = userData.school {
                        SchoolCell(school: school)
                    } else {
                        EmptyView()
                    }
                case .hobbies:
                    if let hobbies = userData.hobbies {
                        HobbyCell(hobbies: hobbies)
                    } else {
                        EmptyView()
                    }
                }
            }
        }
    }
}
