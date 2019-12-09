//
//  Song.swift
//  final_ios
//
//  Created by Jonghyun Chung on 2019. 11. 20..
//  Copyright © 2019 Jonghyun Chung. All rights reserved.
//

import UIKit
import Foundation

class Song : Codable {
    
    let songName: String
    let songReason: String
    let songDetails: String
    var likeSong: Bool
    var songUpvote: Int
   
    init(songName: String, songReason: String, songDetails: String, likeSong: Bool, songUpvote: Int) {
        self.songName = songName
        self.songReason = songReason
        self.songDetails = songDetails
        self.likeSong = likeSong
        self.songUpvote = songUpvote
    
}

}
struct SongsSearchResponse: Codable {
    var results: [Song]
}

struct SongSearchResponse: Codable {
    var results: Song
}
