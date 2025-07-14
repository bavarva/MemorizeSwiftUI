//
//  ContentView.swift
//  CS193p_01
//
//  Created by Arnav on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView(isFaceUp: true)
            CardView()
        }
        .foregroundColor(.cyan)
        .padding()
    }
}


struct CardView: View{
    @State var isFaceUp = false
    
    var body: some View{
        ZStack{
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("😎").font(.largeTitle)
            }
            else{
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
//            isFaceUp = !isFaceUp
        }
    }
}


#Preview {
    ContentView()
}
