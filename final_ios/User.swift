//
//  User.swift
//  final_ios
//
//  Created by Jonghyun Chung on 12/8/19.
//  Copyright © 2019 Jonghyun Chung. All rights reserved.
//
import UIKit
import Foundation

class User : Codable {
    let id: Int
    let name: String
    var songs: [Song]
    

}

struct UserSearchResponse: Codable {
    var results: User
}

struct UsersSearchResponse: Codable {
    var results: [User]
}

struct UserResponse: Codable {
    var success: Bool
    var data: User
}
