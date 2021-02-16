//
//  Group.swift
//  lesson1
//
//  Created by Антон Сивцов on 03.02.2021.
//

import Foundation

class Group {
    let nickname: String
    var bio: String
    let areaOfInterests: String
    
    init(nickname: String, bio: String, areaOfInterests: String) {
        self.nickname = nickname
        self.bio = bio
        self.areaOfInterests = areaOfInterests
    }
}
