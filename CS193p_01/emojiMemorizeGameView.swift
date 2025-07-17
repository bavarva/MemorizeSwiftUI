//
//  ContentView.swift
//  CS193p_01
//
//  Created by Arnav on 14/07/25.
//

import SwiftUI

struct emojiMemorizeGameView: View {
    let emojis: [String] = ["😎","😀","😄","😁","😆","😅","😂","🤣","🥲","😇","🙂","🙃"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            cardAdjusters
        }
        
        .padding()
    }
    
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]){
            
            ForEach(0..<cardCount, id:\.self){ index in
                CardView(content:emojis[index]).aspectRatio(2/3, contentMode: .fit)
            }
            .foregroundColor(.cyan)
        }
    }
    
    
    func cardCountAdjuster(by offset:Int, symbol: String, color: Color?) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName:  symbol)
        } ).foregroundColor(color)
            .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
        
        
    }
    var cardAdjusters: some View{
        
        //one line code therefore no return (implicit return)
        //whats inside below HStack is ViewBuilder, but the function or computed property of cardAdjusters in no a ViewBuilder
        HStack{
            removeCard
            Spacer()
            addCard
        }.imageScale(.large).font(.largeTitle)
        
    }
    
    var removeCard: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill", color: .red)
    }
    var addCard: some View{
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill", color: .green)
    }
}
    
    
    struct CardView: View{
        let content: String
        @State var isFaceUp = false
        
        var body: some View{
            ZStack{
                let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }.opacity(isFaceUp ? 1 : 0)
                
                base.fill().opacity(isFaceUp ? 0 : 1)
            }
            .onTapGesture {
                isFaceUp.toggle()
                //            isFaceUp = !isFaceUp
            }
        }
    }
    
    
    #Preview {
        emojiMemorizeGameView()
    }
