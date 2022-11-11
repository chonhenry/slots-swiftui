//
//  ContentView.swift
//  Slots
//
//  Created by Henry Chon on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var credits:Int = 1000
    @State private var slot1:String = "apple"
    @State private var slot2:String = "cherry"
    @State private var slot3:String = "star"
    
    func updateSlot(n:Int) -> String {
        if n == 1 {
            return "apple"
        } else if n == 2 {
            return "cherry"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        VStack {
            Text("SwiftUI Slots!")
                .font(.largeTitle)
                .padding()
            Spacer()
            Text("Credits: " + String(credits))
            Spacer()
            HStack {
                Image(slot1).resizable().aspectRatio(contentMode: .fit)
                Image(slot2).resizable().aspectRatio(contentMode: .fit)
                Image(slot3).resizable().aspectRatio(contentMode: .fit)
            }
            Spacer()
            Button(action: {
                let n1 = Int.random(in: 1...3)
                let n2 = Int.random(in: 1...3)
                let n3 = Int.random(in: 1...3)
                
                slot1 = updateSlot(n:n1)
                slot2 = updateSlot(n:n2)
                slot3 = updateSlot(n:n3)
                
                if n1 == n2 && n2 == n3 {
                    credits += 15
                } else {
                    credits -= 5
                }
            }, label: {
                Text("Spin")
                    .padding(.horizontal, 40.0).padding(.vertical, 5.0)
                    .background(Color.pink).foregroundColor(.white)
            }).cornerRadius(50)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
