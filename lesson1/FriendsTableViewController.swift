//
//  FriendsTableViewController.swift
//  lesson1
//
//  Created by Антон Сивцов on 02.02.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
    
    var data: User!
    var selectedIndexPaths = Set<IndexPath>()
    
    @IBOutlet weak var searchBar: UISearchBar!
    var filteredCells: [User] = []
    
    private var friendsList = [
        User(id: 1, name: "Anastasia", lastName: "Gulert", age: 23, avatarName: "GulertAnastasia_Avatar"),
        User(id: 2, name: "Victor", lastName: "Miheev", age: 40, avatarName: "VictorMiheev_Avatar"),
        User(id: 3, name: "Tom", lastName: "Vekerfield", age: 35, avatarName: "TomVekerfield_Avatar"),
        User(id: 4, name: "Alisha", lastName: "Tompson", age: 33, avatarName: "TompsonAlisha_Avatar"),
        User(id: 5, name: "Federico", lastName: "Bruno", age: 25, avatarName: "FedericoBruno_Avatar")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "friendCell")
        self.tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerTableViewCell")
        
        // searchBar config
        self.searchBar.delegate = self
        self.filteredCells = self.friendsList
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        
        cell.friendName.text = self.filteredCells[indexPath.row].name
        cell.friendLastName.text = self.filteredCells[indexPath.row].lastName
        cell.friendPic.imageView.image = UIImage(named: self.filteredCells[indexPath.row].avatarName)
        cell.friendAge.text = "\(self.filteredCells[indexPath.row].age) years"
        
        return cell
    }
    
    var showingIndex: IndexPath?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showingIndex = indexPath
        performSegue(withIdentifier: "goToFriendPage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let indexPath = self.showingIndex, segue.identifier == "goToFriendPage" else { return }
        let vc = segue.destination as! InformarionFriendCollectionViewController
        vc.data = self.filteredCells[indexPath.row]
        
    }
    
    var shoingIndex: IndexPath?
    //MARK: maybe
    @IBAction func showFriendPage(segue: UIStoryboardSegue) {
        if segue.identifier == "goToFriendPage" {
            guard let allFriendsPage = segue.source as? FriendsTableViewController else { return }
            if let indexPath = allFriendsPage.tableView.indexPathForSelectedRow {
                let friend = allFriendsPage.filteredCells[indexPath.row].name
                let cell = OneFriendCollectionViewCell()
                if allFriendsPage.tableView.contains(friend as! UIFocusEnvironment) {
                    cell.friendPic.image = UIImage(named: allFriendsPage.data.avatarName)
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerTableViewCell") as! HeaderTableViewCell
        view.symbol.text = "A"
        return view
    }
    
    // SearchBar settings
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCells = []
        
        if searchText == "" {
            filteredCells = friendsList
        } else {
            for symbol in friendsList {
                if symbol.name.lowercased().contains(searchText.lowercased()) || symbol.lastName.lowercased().contains(searchText.lowercased()) {
                    filteredCells.append(symbol)
                }
            }
        }
        self.tableView.reloadData()
    }
}
