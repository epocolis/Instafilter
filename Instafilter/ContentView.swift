//
//  ContentView.swift
//  Instafilter
//
//  Created by Leotis buchanan on 2021-05-02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var blurAmount:CGFloat = 0
    
    var body: some View {
        VStack {
            Text("Hello, World")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
