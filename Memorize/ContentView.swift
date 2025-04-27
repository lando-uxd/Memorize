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
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(alignment: .center, content: {
            let base = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 4)
                Text("😸").font(.largeTitle)
            } else {
                base.fill() //.fill() is the default, no need to be explicit
            }
        }).onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
