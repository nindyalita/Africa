//
//  HeadingView.swift
//  Africa
//
//  Created by Nindya Alita Rosalia on 10/09/23.
//

import SwiftUI

struct HeadingView: View {
    
    //MARK: PROPERTIES
    var headingName: String
    var headingImage: String
    
    var body: some View {
        HStack{
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingName)
                .font(.title3)
                .fontWeight(.bold)
            
        }//: HSTACK
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingName: "Wilderness in Pictures", headingImage: "photo.on.rectangle.angled")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
