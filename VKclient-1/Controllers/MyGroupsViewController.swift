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
    
    func addMyGroup() {
    //
      //
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myGroupsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMyGroup()
        
        myGroupsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)
        myGroupsTableView.dataSource = self
        myGroupsTableView.delegate = self
    }
}

//MARK: - Extension

extension MyGroupsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath)
                as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.configure(group: myGroupsArray[indexPath.row])
        
        return cell
    }
}
