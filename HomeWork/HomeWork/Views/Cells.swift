//
//  Cells.swift
//  HomeWork
//
//  Created by Chan Jung on 7/12/22.
//
//  Cells? Cells, within cells interlinked
//  interlinked
//  within cells interlinked
//  within cells interlinked

import Foundation
import SwiftUI

// i could make one generic cell view but what if business require one view to be specific

struct NameCell: View {
    let name: String
    
    var body: some View {
        HStack {
            Text(getName())
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private func getName() -> String {
        var nameFormatted: String = self.name
        
        nameFormatted = nameFormatted == "Michael" ? "World's Best Boss" : name
        nameFormatted = nameFormatted == "Jim" ? "Jimothy" : name
        return nameFormatted
    }
}

struct AboutCell: View {
    let about: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("About")
                .font(.title)
                .padding(.bottom, Dimensions.spaceSmol)
            Text(about)
        }
        .padding(.horizontal)
        .padding(.bottom, Dimensions.spaceSmol)
    }
}

struct SchoolCell: View {
    let school: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("School")
                .font(.title)
                .padding(.bottom, Dimensions.spaceSmol)
            Text(school)
        }
        .padding(.horizontal)
        .padding(.bottom, Dimensions.spaceSmol)
    }
}

struct GenderCell: View {
    let gender: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gender")
                .font(.title)
                .padding(.bottom, Dimensions.spaceSmol)
            Text(getGenderInfo())
        }
        .padding(.horizontal)
        .padding(.bottom, Dimensions.spaceSmol)
    }
    
    private func getGenderInfo() -> String {
        if gender.lowercased() == "m" {
            return "Male"
        } else if gender.lowercased() == "f" {
            return "Female"
        } else {
            return "Nonbinary"
        }
    }
}

struct HobbyCell: View {
    let hobbies: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hobbies")
                .font(.title)
                .padding(.bottom, Dimensions.spaceSmol)
            Text(hobbies.reduce("") { $0 + "," + $1 })
        }
        .padding(.horizontal)
        .padding(.bottom, Dimensions.spaceSmol)
    }
}
