//
//  FavoriteVideoCollectionViewCell.swift
//  WolloWatches
//
//  Created by Macbook on 29.10.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit
import Kingfisher

class FavoriteVideoCollectionViewCell: UICollectionViewCell {
    
    //MARK:Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionViewCell()
    }
    
    var setFavorite : VideoList! {
        didSet{
            nameLabel.text = setFavorite.videoName
            let url = URL(string: "https://img.youtube.com/vi/" + setFavorite.videoKey + "/maxresdefault.jpg")
            videoImage.kf.setImage(with: url)
        }
    }
    
    //MARK:Design of the CollectionViewCell
    func configureCollectionViewCell() -> Void {
        self.videoImage.layer.cornerRadius = 5
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
    }
}
