//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Nindya Alita Rosalia on 10/09/23.
//

import SwiftUI

struct AnimalDetailView: View {
    
    //MARK: PROPERTIES
    let animal: Animal
    
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                
                //HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //TITTLE
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                //HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //GALLERY
                Group{
                    HeadingView(headingName: "Wilderness in Pictures", headingImage: "photo.on.rectangle.angled")
                    InsetGalleryView(animal: animal)
                }.padding(.horizontal)
                
                //FACT
                Group{
                    HeadingView(headingName: "Did you know?", headingImage: "questionmark.circle")
                    InsetFactView(animal: animal)
                }.padding(.horizontal)
                
                //DESCRIPTION
                Group{
                    HeadingView(headingName: "All about \(animal.name)", headingImage: "info.circle")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                        
                }.padding(.horizontal)
                
                //MAP
                Group{
                    HeadingView(headingName: "National Park", headingImage: "map")
                    InsetMapView()
                }.padding(.horizontal)
                
                //LINK
                Group{
                    HeadingView(headingName: "Learn More", headingImage: "books.vertical")
                    ExternalWeblinkView(animal: animal)
                }.padding(.horizontal)
                
                
            }//: VSTACK
            .navigationBarTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }//: SCROLLVIEW
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[0])
        }
    }
}
