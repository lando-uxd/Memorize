//
//  ContentView.swift
//  Memorize
//
//  Created by Lando Ando on 4/26/25.
//

import SwiftUI

struct ContentView: View {
    
//    var body: TupleView<(Text, Text)> {
//        Text("text")
//        Text("again")
//    }
    
    var body: some View {
        
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp:false)
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack( content: {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 4)
                Text("😸").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
            }
        })
    }
}

#Preview {
    ContentView()
}
