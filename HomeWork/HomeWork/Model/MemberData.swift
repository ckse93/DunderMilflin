//
//  Members.swift
//  HomeWork
//
//  Created by Chan Jung on 7/12/22.
//

import Foundation

// MARK: - MemberData
struct MemberData: Codable {
    let users: [User]
}

// MARK: - User
struct User: Codable, Equatable {
    let id: Int
    let name: String
    let gender: String
    let about: String?
    let photo: String?
    let school: String?
    let hobbies: [String]?
}

//["name", "photo", "gender", "about", "school", "hobbies"]
enum ViewType: String, Codable {
    case name = "name"
    case photo = "photo"
    case gender = "gender"
    case about = "about"
    case school = "school"
    case hobbies = "hobbies"
}

struct ProfileOrder: Codable {
    let profile: [ViewType]
}
