//
//  GalleryView.swift
//  Africa
//
//  Created by Nindya Alita Rosalia on 09/09/23.
//

import SwiftUI

struct GalleryView: View {
    
    //MARK: PROPERTIES
    
    @State private var selectedAnimal: String = "lion"
    
    let animal: [Animal] = Bundle.main.decode("animals.json")
    
    //SIMPLE GRID DEFINITION (there are 3 column grid layout)
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    //EFFICIENT GRID DEFINITION
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack (alignment:.center, spacing: 30){
                //MARK: IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                
                //MARK: GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(animal) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    }
                }//: GRID
            }//: VSTACK)
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
