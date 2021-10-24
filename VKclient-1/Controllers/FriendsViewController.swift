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
    
    let fromFriendsToGallerySegue = "fromFriendsToGallery"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)
        
        tableView.delegate = self
        tableView.dataSource = self
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
        return resultArray
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


//MARK: - Extension

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfLetter(sourceArray: friendsArray).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?  {
        
        return arrayOfLetter(sourceArray: friendsArray)[section].uppercased()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayByLetter(sourceArray: friendsArray, letter: arrayOfLetter(sourceArray: friendsArray)[section]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(friend: arrayByLetter(sourceArray: friendsArray, letter: arrayOfLetter(sourceArray: friendsArray)[indexPath.section])[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: fromFriendsToGallerySegue, sender: arrayByLetter(sourceArray: friendsArray, letter: arrayOfLetter(sourceArray: friendsArray)[indexPath.section])[indexPath.row])
    }
}

