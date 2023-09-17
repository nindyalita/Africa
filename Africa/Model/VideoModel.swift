//
//  VideoModel.swift
//  Africa
//
//  Created by Nindya Alita Rosalia on 17/09/23.
//

import SwiftUI

struct Video: Codable, Identifiable{
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumbnail: String{
        "video-\(id)"
    }
}
