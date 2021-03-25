//
//  Session.swift
//  lesson1
//
//  Created by Антон Сивцов on 18.03.2021.
//

import UIKit

class Session {
    static let shared = Session()
    
    var token: String = ""
    var id = Int()
    
    private init() {
    }
}
