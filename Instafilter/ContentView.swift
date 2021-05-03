//
//  ContentView.swift
//  Instafilter
//
//  Created by Leotis buchanan on 2021-05-02.
//

/**
 Just like Core Data is Apple’s built-in framework for manipulating data, Core Image is their framework for manipulating images.
 This isn’t drawing, or at least for the most part it isn’t drawing, but instead it’s about changing existing images: applying sharpening,
 blurs, vignettes, pixellation, and more. If you ever used all the various photo effects available in Apple’s Photo Booth app,
 that should give you a good idea of what Core Image is good for!
 
 */
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI



struct ContentView: View {
    
    @State private var image: Image?
    
    
      
    
    func loadImage(){
        guard let inputImage = UIImage(named: "Example")
        else {return}
        
        let beginImage = CIImage(image: inputImage)
        
        // more code to come
        let context = CIContext()
        let currentFilter = CIFilter.crystallize()
        
        currentFilter.inputImage = beginImage
        currentFilter.radius = 200
        
        guard let outputImage = currentFilter.outputImage else {return}
        
        if let cgimg = context.createCGImage(outputImage,
                                             from: outputImage.extent){
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
        
    }
    
    
    var body: some View {
        
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform:
            loadImage
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
