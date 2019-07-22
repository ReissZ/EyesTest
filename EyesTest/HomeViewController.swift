//
//  HomeViewController.swift
//  EyesTest
//
//  Created by Reiss Zurbyk on 2019-07-20.
//  Copyright © 2019 Reiss Zurbyk. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.layer.cornerRadius = 0.5
        
        let nib = UINib(nibName: "UserCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "UserCollectionViewCell")
        
        NetworkingService.shared.getUsers { [weak self] (response) in
            self?.users = response.users
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    //Number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "UserDetailVC", sender: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as? UserCollectionViewCell {
            
            userCell.updateCell(with: users[indexPath.row])
            return userCell
        } else {
            return UICollectionViewCell()
        }
    }
}
extension UICollectionView {

    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
