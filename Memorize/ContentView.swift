//
//  ContentView.swift
//  Memorize
//
//  Created by Lando Ando on 4/26/25.
//

import SwiftUI

struct ContentView: View {
//Reality behing Views:
//    var body: TupleView<(Text, Text)> {
//        Text("text")
//        Text("again")
//    }
    
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙🏻‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    @State var cardCount: Int = 4
    
    var body: some View {
        
//Same as: let emojis = ["👻", "🎃", "🕷️", "😈"]
//Same as: let emojis: [String] = ["👻", "🎃", "🕷️", "😈"]
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardAdjustors
        }
        .padding()
    }
    
    var cards: some View{
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) { //implicit return, not needed
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardAdjustors: some View{
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
                
        }, label: {
            Image(systemName: symbol)
        }) //Disable button to avoid array out of bounds
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }

    var cardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 20)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1) //.fill() is the default, no need to be explicit
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
