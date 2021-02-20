//
//  Group.swift
//  lesson1
//
//  Created by Антон Сивцов on 03.02.2021.
//

import Foundation

struct Group {
    let id: Int
    let nickname: String
    var bio: String
    let areaOfInterests: String
    var pic: String
}

extension Group: Equatable {
}
