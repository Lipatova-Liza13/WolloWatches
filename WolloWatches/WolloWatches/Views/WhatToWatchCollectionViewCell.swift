//
//  WhatToWatchCollectionViewCell.swift
//  WolloWatches
//
//  Created by Teslenko Anastasiya on 18.10.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit
import Kingfisher

class WhatToWatchCollectionViewCell: UICollectionViewCell {
    
    //MARK:Properties
    @IBOutlet weak var recomendationImage: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionViewCell()
    }
    
    var setRecomendations : PopularList! {
        didSet{
            NameLabel.text = setRecomendations.name
            let url = URL(string: "https://image.tmdb.org/t/p/w500" + setRecomendations.image)
            recomendationImage.kf.setImage(with: url)
            ratingLabel.text = String(setRecomendations.rating)
        }
    }
    
    //MARK:Design of the CollectionViewCell
    func configureCollectionViewCell() -> Void {
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 0.1
        self.layer.masksToBounds = false
    }
}
