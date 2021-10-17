//
//  GroupsViewController.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 17.10.2021.
//

import UIKit

class MyGroupsViewController: UIViewController {

    @IBOutlet weak var myGroupsTableView: UITableView!
    
    let reuseIdentifierCustom = "reuseIdentifierCustom"
    
    var myGroupsArray = [Group]()
    
    func addGroup() {
        
        let group1 = Group(title: "Group 1", avatar: UIImage(named: "group1")!)
        let group2 = Group(title: "Group 2", avatar: UIImage(named: "group2")!)
        let group3 = Group(title: "Group 3", avatar: UIImage(named: "group3")!)
        let group4 = Group(title: "Group 4", avatar: UIImage(named: "group4")!)
        let group5 = Group(title: "Group 5", avatar: UIImage(named: "group5")!)
        
        myGroupsArray.append(group1)
        myGroupsArray.append(group2)
        myGroupsArray.append(group3)
        myGroupsArray.append(group4)
        myGroupsArray.append(group5)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myGroupsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGroup()
        
        myGroupsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)
        myGroupsTableView.dataSource = self
        myGroupsTableView.delegate = self
        
    }
}

//MARK: Extension
extension MyGroupsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.configure(group: myGroupsArray[indexPath.row])
        
        return cell
    }
}
