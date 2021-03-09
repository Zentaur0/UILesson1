//
//  AllGroupsTableViewController.swift
//  lesson1
//
//  Created by Антон Сивцов on 07.02.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController, UISearchBarDelegate {
    
    var filteredGroups: [Group] = []
    @IBOutlet weak var searchBar: UISearchBar!
    
    let groups = [
        Group(id: 1, nickname: "Cars", bio: "everythin about cars", areaOfInterests: "#cars, #speed", pic: "carsAvatar"),
        Group(id: 2, nickname: "Travels", bio: "just buy a ticket and be free", areaOfInterests: "#countries, #vaterfalls, #nature", pic: "travelAvatar"),
        Group(id: 3, nickname: "Mems", bio: "ahahahah", areaOfInterests: "#fun, #jokes, #hillariousthings", pic: "memsAvatar"),
        Group(id: 4, nickname: "Accecories", bio: "rings, bracelets and etc.", areaOfInterests: "#beauty, #lifestyle", pic: "accecoriesAvatar"),
        Group(id: 5, nickname: "Psychology", bio: "find your inner self", areaOfInterests: "#lifeasitis, #health", pic: "psychologyAvatar")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "AllGroupsTableViewCell", bundle: nil), forCellReuseIdentifier: "allGroupCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // search bar config
        self.searchBar.delegate = self
        self.filteredGroups = self.groups
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupCell", for: indexPath) as! AllGroupsTableViewCell
        
        cell.allGroupName.text = self.filteredGroups[indexPath.row].nickname
        cell.allGroupPic.imageView.image = UIImage(systemName: self.filteredGroups[indexPath.row].pic)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "addGroup", sender: nil)
    }

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
