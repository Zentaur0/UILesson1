//
//  InformarionFriendCollectionViewController.swift
//  lesson1
//
//  Created by Антон Сивцов on 09.02.2021.
//

import UIKit

class InformarionFriendCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var selectedIP = Set<IndexPath>()
    var data: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UINib(nibName: "OneFriendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OneFriendCell")
        self.title = "id: \(data.id)"
        
        self.collectionView.layer.backgroundColor = CGColor(gray: .infinity, alpha: 0.95)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let selectedPath = collectionView.indexPathsForSelectedItems else { return }
//        if let target = segue.destination as? FriendsTableViewController {
//            target.selectedUser = selectedPath.row
//        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneFriendCell", for: indexPath) as! OneFriendCollectionViewCell
        
        cell.friendPic.image = UIImage(named: data.avatarName)
        cell.friendName.text = data.name
        cell.friendLastName.text = data.lastName
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    // MARK: UICollectionViewDelegateFlowLayout
    // Cells idents in section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let view = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        return view
    }
    
    // Cells vertical space
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        let view = CGFloat(25)
        return view
    }
}
