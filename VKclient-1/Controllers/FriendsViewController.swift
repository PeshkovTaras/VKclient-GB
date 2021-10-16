//
//  FriendsViewController.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 16.10.2021.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifierCustom = "reuseIdentifierCustom"
    
    var friendsArray = [Friend]()
    
    
    func addFriends() {
        
        let friend1 = Friend(name: "Anonim", age: 23, avatar: UIImage(named: "avatar1")!, photos: [UIImage(named: "avatar1")!])
        let friend2 = Friend(name: "BullDog", age: 27, avatar: UIImage(named: "avatar2")!, photos: [UIImage(named: "avatar2")!])
        let friend3 = Friend(name: "Fox", age: 21, avatar: UIImage(named: "avatar3")!, photos: [UIImage(named: "avatar3")!])
        let friend4 = Friend(name: "Stalker", age: 35, avatar: UIImage(named: "avatar4")!, photos: [UIImage(named: "avatar4")!])
        let friend5 = Friend(name: "Hipster", age: 28, avatar: UIImage(named: "avatar5")!, photos: [UIImage(named: "avatar5")!])

        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        friendsArray.append(friend4)
        friendsArray.append(friend5)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFriends()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(friend: friendsArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(100)
    }
    

}


