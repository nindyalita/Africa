//
//  ContentView.swift
//  Africa
//
//  Created by Nindya Alita Rosalia on 09/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }//:LIST
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        }//: NAVIGATIONVIEW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
