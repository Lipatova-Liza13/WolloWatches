//
//  WhatToWatchTableViewCell.swift
//  WolloWatches
//
//  Created by Teslenko Anastasiya on 19.10.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit
import Foundation

class WhatToWatchTableViewCell: UITableViewCell {

    //MARK:Сonnect nib file
    static let identifier = "WhatToWatchCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "WhatToWatchCollectionViewCell", bundle: nil)
    }
    
    //MARK:Properties
    @IBOutlet weak var collectionView: UICollectionView!
    var recomendations = [PopularList]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        configureFlowLayout()
        configureCollectionView()
        assignDelegate()
        }
    
    private func assignDelegate() -> Void {
        let dataController = WhatToWatchViewController()
        dataController.movieDelegate = self
        dataController.loadFilesForWhatToWatchSection()
    }
    private func configureCollectionView() {
        collectionView.register(WhatToWatchTableViewCell.nib(), forCellWithReuseIdentifier: WhatToWatchTableViewCell.identifier)
    }
    private func configureFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let padding : CGFloat = 5
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: 150, height: 259)
        collectionView.collectionViewLayout = flowLayout
    }
}

extension WhatToWatchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recomendations.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WhatToWatchTableViewCell.identifier, for: indexPath as IndexPath) as! WhatToWatchCollectionViewCell
        cell.setRecomendations = recomendations[indexPath.item]
        return cell
    }
}

extension WhatToWatchTableViewCell: WhatToWatchViewControllerMovieDelegate{
    func passRecomendations(data: [PopularList]) {
        self.recomendations = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
