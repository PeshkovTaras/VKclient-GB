//
//  Session.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 17.11.2021.
//

import Foundation

class Session {
    private init() {}
    
    static let instance = Session()
    
    var token: String = ""
    var userId: Int = 1
    var userName: String = "Admin"
}
