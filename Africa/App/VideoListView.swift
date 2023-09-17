//
//  VideoListView.swift
//  Africa
//
//  Created by Nindya Alita Rosalia on 09/09/23.
//

import SwiftUI

struct VideoListView: View {
    
    //MARK: PROPERTIES
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView{
            List{
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItem(video: item)
                            .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button(action:{
                    //suffle video
                    videos.shuffle()
                    hapticImpact.impactOccurred()
                }){
                    Image(systemName: "arrow.2.squarepath")
                }
            }
        }//NavigationView
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
