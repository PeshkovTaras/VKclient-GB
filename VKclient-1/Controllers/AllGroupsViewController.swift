//
//  AllGroupsViewController.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 17.10.2021.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
    @IBOutlet weak var allGroupsTableView: UITableView!
    
    let reuseIdentifierCustom = "reuseIdentifierCustom"
    
    var allgroupsArray = [Group]()
    
    func fillAllGroups() {
        
        let group1 = Group(title: "Group 1", avatar: UIImage(named: "group1")!)
        let group2 = Group(title: "Group 2", avatar: UIImage(named: "group2")!)
        let group3 = Group(title: "Group 3", avatar: UIImage(named: "group3")!)
        let group4 = Group(title: "Group 4", avatar: UIImage(named: "group4")!)
        let group5 = Group(title: "Group 5", avatar: UIImage(named: "group5")!)
        
        allgroupsArray.append(group1)
        allgroupsArray.append(group2)
        allgroupsArray.append(group3)
        allgroupsArray.append(group4)
        allgroupsArray.append(group5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillAllGroups()
        
        allGroupsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)
        
        allGroupsTableView.dataSource = self
        allGroupsTableView.delegate = self
    }
}

//MARK: -Extension

extension AllGroupsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allgroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath)
                as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.configure(group: allgroupsArray[indexPath.row])
        return cell
    }
    
}
