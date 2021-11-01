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
    let fromAllGroupsToMyGroupsSegue = "fromAllGroupsToMyGroups"
    
    var selectedGroup: Group?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allGroupsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)
        allGroupsTableView.dataSource = self
        allGroupsTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromAllGroupsToMyGroupsSegue,
           let group = sender as? Group {
            selectedGroup = group
        }
    }
}


//MARK: - Extension

extension AllGroupsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allgroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customTableCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath)
                as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.configure(group: allgroupsArray[indexPath.row], completion: { [weak self] group in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.fromAllGroupsToMyGroupsSegue, sender: group)
        })
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: fromAllGroupsToMyGroupsSegue, sender: allgroupsArray[indexPath.row])
    }
}

extension AllGroupsViewController: CustomTableCellProtocol {
    func customTableCellLikeCounterIncrement(counter: Int) {
        print(String(counter))
    }
    
    func customTableCellLikeCounterDecrement(counter: Int) {
        print(String(counter))
    }
}

