//
//  UserCollectionViewCell.swift
//  EyesTest
//
//  Created by Reiss Zurbyk on 2019-07-20.
//  Copyright © 2019 Reiss Zurbyk. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var createdDateLabel: UILabel!
    
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(with user: User) {
       // idLabel.text = "\(user.id)"
        nameLabel.text = user.name
       // userNameLabel.text = user.userName
        //createdDateLabel.text = "\(user.createdDate)"
        DispatchQueue.main.async {
            self.profileImage.loadImage(from: user.profileImage)
        }
        profileImage.loadImage(from: user.profileImage)
        //profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
       // profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        
        shadowView.layer.shadowColor = UIColor.lightGray.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowRadius = 10.0
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.cornerRadius = shadowView.frame.width / 2
        
    }
}

extension UIImageView {
    
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self?.image = image
            }
            }.resume()
    }
}
