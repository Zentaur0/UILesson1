//
//  FriendsTableViewController.swift
//  lesson1
//
//  Created by Антон Сивцов on 02.02.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    @IBOutlet var friendsPage: UITableView!
    
//    let friendsList: Array = ["Anastasia Gulert", "Victor Miheev", "Tom Vekerfield", "Alisha Tompson", "Federico Bruno"]
    
    let friendsList = [
        User(id: 1, name: "Anastasia Gulert", age: 23, avatarName: "GulertAnastasia_Avatar"),
        User(id: 2, name: "Victor Miheev", age: 40, avatarName: "VictorMiheev_Avatar"),
        User(id: 3, name: "Tom Vekerfield", age: 35, avatarName: "TomVekerfield_Avatar"),
        User(id: 4, name: "Alisha Tompson", age: 33, avatarName: "TompsonAlisha_Avatar"),
        User(id: 5, name: "Federico Bruno", age: 25, avatarName: "FedericoBruno_Avatar")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsPage.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "friendCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        
        cell.friendName.text = self.friendsList[indexPath.row].name
//        cell.friendPic.imageView.image = UIImage(named: friendsList[indexPath.row].avatarName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToFriendPage", sender: nil)
        
        // MARK: Data? not working
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "FriendPage") as! InformarionFriendCollectionViewController
//        vc.data = self.friendsList[indexPath.row]
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: maybe
//    @IBAction func showFriendPage(segue: UIStoryboardSegue) {
//        if segue.identifier == "goToFriendPage" {
//            guard let allFriendsPage = segue.source as? FriendsTableViewController else { return }
//            if let indexPath = allFriendsPage.tableView.indexPathForSelectedRow {
//                let friend = allFriendsPage.friendsList[indexPath.row]
//                let cell = FriendTableViewCell()
//                if allFriendsPage.friendsList.contains(friend) {
//                    cell.friendName.text = allFriendsPage.friendsList[indexPath.row]
//                }
//            }
//        }
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
