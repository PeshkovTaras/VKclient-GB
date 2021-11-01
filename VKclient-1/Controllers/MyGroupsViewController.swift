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
    let fromAllGroupsToMyGroupsSegue = "fromAllGroupsToMyGroups"
    
    var myGroupsArray = [Group]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myGroupsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myGroupsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)
        myGroupsTableView.dataSource = self
        myGroupsTableView.delegate = self
    }
    
    @IBAction func unwindSegueToMyGroups(segue: UIStoryboardSegue) {
        if segue.identifier == fromAllGroupsToMyGroupsSegue,
           let sourceVC = segue.source as? AllGroupsViewController,
            let selectedGroup = sourceVC.selectedGroup {
            if isItemAlreadyInArray(group: selectedGroup) { return }
            self.myGroupsArray.append(selectedGroup)
            myGroupsTableView.reloadData()
        }
    }
    
    func isItemAlreadyInArray(group: Group) -> Bool {
        return myGroupsArray.contains(where: { sourceGroup in
            sourceGroup.title == group.title
        })
    }
}

//MARK: - Extension

extension MyGroupsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customTableCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath)
                as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.configure(group: myGroupsArray[indexPath.row], completion: nil)
        
        return cell
    }
}
