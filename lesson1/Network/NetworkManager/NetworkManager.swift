//
//  NetworkManager.swift
//  lesson1
//
//  Created by Антон Сивцов on 25.03.2021.
//

import UIKit
import Alamofire

class NetworkManager {
    
    private static let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = false
        let session = URLSession(configuration: configuration)
        
        return session
    }()
    
    static var shared = NetworkManager()
    
    private init() {
        
    }
    
    func loadGroups(token: String) {
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.130"
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            guard let json = response.value else { return }
            print(json)
        }
    }
    
    func loadFriends(token: String) {
        let baseURL = "https://api.vk.com"
        let path = "/method/friends.get"

        let params: Parameters = [
            "access_token": token,
            "order": "name",
            "name_case": "nom",
            "fields": "nickname",
            "v": "5.130"
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON {
            (response) in
            guard let json = response.value else { return }
            print(json)
        }
    }
    
    func loadPhotos(token: String) {
        let baseURL = "https://api.vk.com"
        let path = "/method/photos.get"
        
        let params: Parameters = [
            "access_token": token,
            "album_id": "profile",
            "v": "5.130"
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON {
            (response) in
            guard let json = response.value else { return }
            print(json)
        }
    }
}
