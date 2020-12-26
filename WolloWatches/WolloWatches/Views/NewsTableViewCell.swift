//
//  NewsTableViewCell.swift
//  WolloWatches
//
//  Created by Teslenko Anastasiya on 30.09.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    //MARK:Сonnect nib file
    static let identifier = "NewsTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "NewsTableViewCell", bundle: nil)
    }
    
    //MARK:Properties
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var setNews : NewsList!{
        didSet{
                headlineLabel.text = setNews.headline
                summaryLabel.text = setNews.summary
                dateLabel.text = setNews.date
                let imageurl = URL(string: "https://image.tmdb.org/t/p/w500" + setNews.image)
                newsImage.kf.setImage(with:imageurl)
                contentLabel.text = "Films"
        }
    }
}
