//
//  NetworkManager.swift
//  final_ios
//
//  Created by Jonghyun Chung on 12/1/19.
//  Copyright © 2019 Jonghyun Chung. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum SearchType {
    case songName
}

class NetworkManager {
    
    var userName: String!
    private static let songJsonURL = "http://35.190.159.80/users/"
    private static let URL2 = "http://35.190.159.80/user/"
    private static let postEndpoint = ""

    static func createUser(fromUserName userName: String, _ didPostUser: @escaping (User) -> Void) {
        let parameters: [String: Any] = ["name": userName]
        Alamofire.request(songJsonURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
        switch response.result {
        case .success(let data):
            let jsonDecoder = JSONDecoder()
            
            if let userData = try? jsonDecoder.decode(UserSearchResponse.self, from: data) {
                let user = userData.results
                didPostUser(user)
            }
            case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    static func createSong(fromUserName userName: String, fromSongName songName: String, fromSongReason songReason: String, fromSongDetail songDetail: String, _ didPostSong: @escaping (Song) -> Void) {
        let parameters: [String: Any] = ["title": songName, "reason": songReason, "detail": songDetail]
        let url = URL2 + userName + "/song/"
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
        switch response.result {
        case .success(let data):
            let jsonDecoder = JSONDecoder()
            
            if let songData = try? jsonDecoder.decode(SongSearchResponse.self, from: data) {
                let song = songData.results
                didPostSong(song)
            }
            case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }

    static func getAllUsers(fromUserName userName: String, _ didGetUsers: @escaping ([User]) -> Void) {
        Alamofire.request(songJsonURL, method: .get, encoding: URLEncoding(destination: .queryString)).validate().responseData { response in
        switch response.result {
        case .success(let data):
            let jsonDecoder = JSONDecoder()
            
            if let userData = try? jsonDecoder.decode(UsersSearchResponse.self, from: data) {
                let user = userData.results
                didGetUsers(user)
            }
            case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    
    static func getSong(fromSongName songName: String, _ didGetSongs: @escaping (Song) -> Void) {
        let parameters: [String: Any] = ["songName": songName]
        Alamofire.request(songJsonURL, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString)).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let songsData = try? jsonDecoder.decode(SongSearchResponse.self, from: data) {
                    let songs = songsData.results
                    didGetSongs(songs)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
}
}
