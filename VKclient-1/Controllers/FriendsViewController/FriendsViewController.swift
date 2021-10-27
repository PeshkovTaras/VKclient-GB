//
//  FriendsViewController.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 16.10.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let reuseIdentifierCustom = "reuseIdentifierCustom"
    let fromFriendsToGallerySegue = "fromFriendsToGallery"
    var savedFriendsArray = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedFriendsArray = friendsArray
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromFriendsToGallerySegue,
           let destinationVC = segue.destination as? GalleryViewController,
           let friend = sender as? Friend {
            destinationVC.photos = friend.photos
        }
    }
    
    //Массив первых букв имени
    func arrayOfLetter(sourceArray: [Friend]) -> [String] {
        var resultArray = [String]()
        for item in sourceArray {
            let nameFirstLetter = String(item.name.prefix(1))
            if !resultArray.contains(nameFirstLetter.lowercased()) {
                resultArray.append(nameFirstLetter.lowercased())
            }
        }
        return resultArray.sorted { firstItem, secondItem in
            return firstItem < secondItem
        }
    }
}

//Делим массивы по первым буквам имени
func arrayByLetter(sourceArray: [Friend], letter: String) -> [Friend] {
    var resultArray = [Friend]()
    for item in sourceArray {
        let nameFirstLetter = String(item.name.prefix(1).lowercased())
        if nameFirstLetter == letter.lowercased() {
            resultArray.append(item)
        }
    }
    return resultArray
}

extension FriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        friendsArray = savedFriendsArray
        
        if searchText.isEmpty {
            friendsArray = savedFriendsArray
        } else {
           friendsArray = friendsArray.filter { itemFriend in
               itemFriend.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
}
