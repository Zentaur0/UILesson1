//
//  GroupTableViewController.swift
//  lesson1
//
//  Created by Антон Сивцов on 02.02.2021.
//

import UIKit

class GroupTableViewController: UITableViewController, UISearchBarDelegate {
    
    var groups = [Group]()
    @IBOutlet weak var searchBar: UISearchBar!
    private var filteredGroups: [Group] = []
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let allGroupsController = segue.source as? AllGroupsTableViewController else { return }
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                let group = allGroupsController.filteredGroups[indexPath.row]
            
                if !filteredGroups.contains(group) {
                    filteredGroups.append(group)
                    groups.append(group)
                    tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: "groupCell")
        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // searchBar config
        self.searchBar.delegate = self
        self.filteredGroups = self.groups
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupTableViewCell
        
        let group = filteredGroups[indexPath.row].nickname
        cell.groupName.text = group
        cell.groupPic.imageView.image = UIImage(systemName: self.filteredGroups[indexPath.row].pic)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            filteredGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

   // SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredGroups = []
        
        if searchText == "" {
            filteredGroups = groups
        } else {
            for symbol in groups {
                if symbol.nickname.lowercased().contains(searchText.lowercased()) {
                    filteredGroups.append(symbol)
                }
            }
        }
        self.tableView.reloadData()
    }

}
