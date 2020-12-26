//
//  FavoriteVideoTableViewCell.swift
//  WolloWatches
//
//  Created by Macbook on 29.10.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit

protocol FavoriteVideoViewControlleDelegate {
    func passData(name: String, key: String)
}

class FavoriteVideoTableViewCell: UITableViewCell {
    
    //MARK:Сonnect nib file
    static let identifier = "FavoriteVideoCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FavoriteVideoCollectionViewCell", bundle: nil)
    }
    
    //MARK:Properties
    @IBOutlet weak var collectionView: UICollectionView!
    var favoriteVideos = [VideoList]()
    var passDelegate: FavoriteVideoViewControlleDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        configureFlowLayout()
        configureCollectionView()
        assignDelegate()
    }
    private func assignDelegate() {
        let dataController = WhatToWatchViewController()
        dataController.videoDelegate = self
        dataController.loadFilesForFavoriteVideoSection()
    }
    private func configureCollectionView() {
        collectionView.register(FavoriteVideoTableViewCell.nib(), forCellWithReuseIdentifier: FavoriteVideoTableViewCell.identifier)
    }
    private func configureFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let padding : CGFloat = 5
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: 300, height: 173)
        collectionView.collectionViewLayout = flowLayout
    }
}

extension FavoriteVideoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteVideos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteVideoTableViewCell.identifier, for: indexPath as IndexPath) as! FavoriteVideoCollectionViewCell
        cell.setFavorite = favoriteVideos[indexPath.item]
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.passDelegate?.passData(name: favoriteVideos[indexPath.row].videoName, key: favoriteVideos[indexPath.row].videoKey)
   }
}

extension FavoriteVideoTableViewCell: WhatToWatchViewControllerVideoDelegate {
    func passFavoriteVideo(data: [VideoList]) {
        self.favoriteVideos = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
