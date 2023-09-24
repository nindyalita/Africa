//
//  MapView.swift
//  Africa
//
//  Created by Nindya Alita Rosalia on 09/09/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //MARK: PROPERTY
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.437759)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        // MARK: BASIC MAP
        //Map(coordinateRegion: $region)
        
        //MARK: ADVANCE MAP (MAP WITH ANNOTATIONS)
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            //MARK: old style (always static)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            //MARK: new style (always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //MARK: custom basic annotation (could be interactive)
            //MapAnnotation(coordinate: item.location){
            //    Image("logo")
            //        .resizable()
            //        .scaledToFit()
            //        .frame(width: 32, height: 32, alignment: .center)
            // }//: ANNOTATION
            
            //MARK: custom advance annotatios (could be interactive)
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }//: MAP
        })
        .overlay(
            HStack(alignment: .center, spacing: 12){
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment:.leading, spacing: 3){
                    HStack{
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: HSTACK
                    Divider()
                    HStack{
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: HSTACK
                }//: VSTACK
            } //: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                ).padding(), alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
