//
//  FriendsViewController+TableViewDelegate.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 24.10.2021.
//

import UIKit

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
        
        cell.configure(friend: arrayByLetter(sourceArray: friendsArray, letter: arrayOfLetter(sourceArray: friendsArray)[indexPath.section])[indexPath.row], completion: { [weak self] friend in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.fromFriendsToGallerySegue, sender: friend)
            
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customTableCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: fromFriendsToGallerySegue, sender: arrayByLetter(sourceArray: friendsArray, letter: arrayOfLetter(sourceArray: friendsArray)[indexPath.section])[indexPath.row])
    }
}
