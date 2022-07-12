//
//  CircularButton.swift
//  HomeWork
//
//  Created by Chan Jung on 7/12/22.
//

import SwiftUI


/// self-resizing button that has S H A D O VV
struct CircularButton: View {
    let action: (()->Void)?
    let title: String
    
    init(title: String, action: (() -> Void)?) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            ZStack {
                // 'tis a hacky solution, but it works lol
                Text(title)
                    .padding()
                    .foregroundColor(.clear)  // make it transparent
                    .background(
                        GeometryReader { geo in
                            ZStack {
                                Circle()
                                    .frame(width: geo.size.width,
                                           height: geo.size.width)
                                    .shadow(radius: 5)
                                Circle()
                                    .foregroundColor(.white)
                                Text(title)
                                    .foregroundColor(.black)
                            }
                        }
                        
                    )
            }
        }
    }
}

struct CircularButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularButton(title: "test button", action: {})
            .previewLayout(.sizeThatFits)
    }
}
