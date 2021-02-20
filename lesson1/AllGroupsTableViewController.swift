//
//  AllGroupsTableViewController.swift
//  lesson1
//
//  Created by Антон Сивцов on 07.02.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupCell", for: indexPath) as! AllGroupsTableViewCell
        
//        let group = groups[indexPath.row]
        cell.allGroupName.text = self.groups[indexPath.row].nickname
        cell.allGroupPic.imageView.image = UIImage(systemName: self.groups[indexPath.row].pic)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "addGroup", sender: nil)
    }

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
