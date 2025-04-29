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
    
    let halloween: Array<String> = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙🏻‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    let cats: Array<String> = ["🐱", "🐈", "🐈‍⬛", "😹", "😻", "🙀", "😿", "😽", "😸", "😺", "😾", "😼", "🐯", "🦁"]
    let faces: Array<String> = ["😘", "🤣", "😭", "😍", "😊", "🥰", "😁", "🙄", "🥺", "😉", "😅", "🤪", "😡", "🤗", "😜", "😬"]
    
    @State var currentTheme = "halloween"
    
    var emojis: Array<String> {
        switch currentTheme {
        case "halloween":
            return halloween
        case "cats":
            return cats
        default:
            return faces
        }
    }
    
    var shuffledEmojis: Array<String> {
        var pairs = emojis
        pairs.append(contentsOf: emojis)
        pairs.shuffle()
        print(pairs)
        return pairs
    }
    
    var body: some View {
        
//Same as: let emojis = ["👻", "🎃", "🕷️", "😈"]
//Same as: let emojis: [String] = ["👻", "🎃", "🕷️", "😈"]
        VStack{
            Text("Memorize!")
                .font(.title)
            ScrollView{
                cards
            }
//            Spacer()
            themeSelector
        }
        .ignoresSafeArea()
        .padding(15)
    }
    
    var cards: some View{
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) { //implicit return, not needed
            ForEach(emojis.indices, id: \.self) {index in
                CardView(content: shuffledEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var themeSelector: some View{
        HStack(alignment: .bottom, spacing: 15){
            themeButton(themeSelected: "halloween", Logo: Image(systemName: "moon.circle.fill"))
            themeButton(themeSelected: "cats", Logo: Image(systemName: "cat.fill"))
            themeButton(themeSelected: "faces", Logo: Image(systemName: "face.smiling"))
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
    }
    
    func setCurrentTheme(theme: String){
        currentTheme = theme
    }
    
    func themeButton(themeSelected theme: String, Logo image: Image) -> some View {
        Button(action: {
            setCurrentTheme(theme: theme)
        }, label: {
            VStack(spacing: 5){
                Spacer()
                image
                    .font(.largeTitle)
                Text(theme)
                    .font(.footnote)
            }.padding(5)
        })
        .frame(width: 90)
        .font(.title)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
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


