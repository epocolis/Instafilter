//
//  ContentView.swift
//  Instafilter
//
//  Created by Leotis buchanan on 2021-05-02.
//

import SwiftUI

struct ContentView: View {
    
    
    /**
     This will not print a the new value of blurAmount, because neither blurAmoun or the Struct struct wrapping it changes
     whenever the users move the slider. The binding is directly changing the internally stored value. This means the property
     observer is never being triggered.
     
     This can be   solved by creating a custom binding
     
     This also allow us to  do whatever you want inside these closures: you can call methods, run an algorithm to figure out the
     correct value to use, or even just use random values – it doesn’t matter, as long as you return a value from get. So, if you
     want to make sure you update UserDefaults every time a value is changed, the set closure of a Binding is perfect.
     
     
     */
    @State private var blurAmount: CGFloat = 0
    
    var body: some View {
        
        let blur = Binding<CGFloat>(
            get: {
                self.blurAmount
            },
            set: {
                self.blurAmount = $0
                print("New value is \(self.blurAmount)")
            }
        )
        
        VStack {
            Text("Hello, World")
                .blur(radius: blurAmount)
            
            Slider(value: blur, in: 0...20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
