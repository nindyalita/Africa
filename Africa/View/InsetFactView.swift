//
//  InsetFactView.swift
//  Africa
//
//  Created by Nindya Alita Rosalia on 10/09/23.
//

import SwiftUI

struct InsetFactView: View {
    
    //MARK: PROPERTIES
    let animal: Animal
    
    var body: some View {
        GroupBox{
            TabView{
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//: TABVIEW
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//:GROUPBOX
    }
}

struct InsetFactView_Previews: PreviewProvider {
    
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
