//
//  ViewModifierBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Санжар Асанов on 28/5/23.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .font(.subheadline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            
    }
}

extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: .blue))
    }
}

struct ViewModifierBootcamp: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, world")
                .font(.headline)
                .withDefaultButtonFormatting(backgroundColor: .blue)
            
            Text("Hello, everyone")
                .font(.subheadline)
                .modifier(DefaultButtonViewModifier(backgroundColor: .orange))
            
            Text("Hello!!!")
                .font(.title)
                .modifier(DefaultButtonViewModifier(backgroundColor: .pink))
        }
        .padding()
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
