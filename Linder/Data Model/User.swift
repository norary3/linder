//
//  User.swift
//  Lindar
//
//  Created by 박종훈 on 2017. 1. 31..
//  Copyright © 2017년 Hidden Track. All rights reserved.
//

import UIKit

typealias UserID = Int64
typealias Hashtag = String

enum Age: Int {
        case a10s = 10
        case a20s = 20
        case a30s = 30
        case a40s = 40
        case a50s = 50
        case a60s = 60
        static var count: Int { return self.a60s.hashValue + 1 }
    }

enum Gender: Int {
    case man = 1
    case woman = 2
    case unknown = 3
    static var count: Int { return self.unknown.hashValue + 1 }
    func toString() -> String {
        return String(gender: self)
    }
}

class User {
    var id: UserID
    var accessToken: String?
    var refreshToken: String?
    var expireDate: Date?
    
    var thumbnail: UIImage = #imageLiteral(resourceName: "profile_not") // TODO : Set basic human image
    var name: String = "박종훈"
    var nickName: String = "norary"
    var gender: Gender = .man
    var age: Age = .a20s
    var hashtags: [Hashtag] = []
    var channelIDs: [ChannelID] = []
    var region: String = "서울"
    
    init() { // Guest User Creation
        self.id = -1
        //self.hashtags = ["야구","뮤지컬","테크"]
        //self.channelIDs = [1,2,3]
    }
    
    init(id: Int64) {
        self.id = id
    }
    
    init(id: Int64, accessToken: String, refreshToken: String, expiresIn: Int) {
        self.id = id
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expireDate = getExpireDate(expiresIn: expiresIn)
    }
    
    func setToken(accessToken: String, refreshToken: String, expiresIn: Int) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expireDate = getExpireDate(expiresIn: expiresIn)
    }
    
    private func getExpireDate(expiresIn: Int) -> Date {
        let expireDate = Date(timeIntervalSinceNow: TimeInterval(expiresIn))
        return expireDate
    }
}
