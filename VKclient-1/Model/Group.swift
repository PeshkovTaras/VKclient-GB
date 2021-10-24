//
//  Group.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 16.10.2021.
//

import UIKit

struct Group {
    var title = String()
    var avatar = UIImage()
}

let group1 = Group(title: "Group 1", avatar: UIImage(named: "group1")!)
let group2 = Group(title: "Group 2", avatar: UIImage(named: "group2")!)
let group3 = Group(title: "Group 3", avatar: UIImage(named: "group3")!)
let group4 = Group(title: "Group 4", avatar: UIImage(named: "group4")!)
let group5 = Group(title: "Group 5", avatar: UIImage(named: "group5")!)

var allgroupsArray = [group1, group2, group3, group4, group5]
