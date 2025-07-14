//
//  ContentView.swift
//  CS193p_01
//
//  Created by Arnav on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["😎","😀","😄","😁"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id:\.self){ index in
                CardView(content:emojis[index],isFaceUp: true)
            }
            
        }
        .foregroundColor(.cyan)
        .padding()
    }
}


struct CardView: View{
    let content: String
    @State var isFaceUp = false
    
    var body: some View{
        ZStack{
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
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
