//
//  Friend.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 16.10.2021.
//

import UIKit

struct Friend {
    var name = String()
    var age = Int()
    var avatar = UIImage()
    var photos = [UIImage]()
}

let anonim = Friend(name: "Anonim",
                     age: 23,
                     avatar: UIImage(named: "avatar1")!,
                     photos: [UIImage(named: "1-1")!,
                              UIImage(named: "1-2")!,
                              UIImage(named: "1-3")!,
                              UIImage(named: "1-4")!])

let bullDog = Friend(name: "BullDog",
                     age: 27,
                     avatar: UIImage(named: "avatar2")!,
                     photos: [UIImage(named: "2-1")!,
                              UIImage(named: "2-2")!,
                              UIImage(named: "2-3")!,
                              UIImage(named: "2-4")!,
                              UIImage(named: "2-5")!,
                              UIImage(named: "2-6")!])

let fox = Friend(name: "Fox",
                     age: 21,
                     avatar: UIImage(named: "avatar3")!,
                     photos: [UIImage(named: "3-1")!,
                              UIImage(named: "3-2")!,
                              UIImage(named: "3-3")!,
                              UIImage(named: "3-4")!,
                              UIImage(named: "3-5")!
                             ])

let stalker = Friend(name: "Stalker",
                     age: 35,
                     avatar: UIImage(named: "avatar4")!,
                     photos: [UIImage(named: "4-1")!,
                              UIImage(named: "4-2")!,
                              UIImage(named: "4-3")!,
                              UIImage(named: "4-4")!,
                              UIImage(named: "4-5")!
                             ])

let hipster = Friend(name: "Hipster",
                     age: 28,
                     avatar: UIImage(named: "avatar5")!,
                     photos: [UIImage(named: "5-1")!,
                              UIImage(named: "5-2")!,
                              UIImage(named: "5-3")!,
                              UIImage(named: "5-4")!,
                              UIImage(named: "5-5")!
                             ])

let arnie = Friend(name: "Arnie",
                     age: 53,
                     avatar: UIImage(named: "avatar6")!,
                     photos: [UIImage(named: "6-1")!,
                              UIImage(named: "6-2")!,
                              UIImage(named: "6-3")!,
                              UIImage(named: "6-4")!
                             ])

var friendsArray = [anonim, bullDog, fox, stalker, hipster, arnie]
