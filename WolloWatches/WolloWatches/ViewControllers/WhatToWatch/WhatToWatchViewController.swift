//
//  WhatToWatchTableViewController.swift
//  WolloWatches
//
//  Created by Teslenko Anastasiya on 19.10.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit
import Foundation

protocol WhatToWatchViewControllerMovieDelegate {
    func passRecomendations(data: [PopularList])
}

protocol WhatToWatchViewControllerVideoDelegate {
    func passFavoriteVideo(data: [VideoList])
}

class WhatToWatchViewController: UIViewController {

    //MARK:Сonnect nib file
    static let whatToWatchIdentifier = "WhatToWatchTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "WhatToWatchTableViewCell", bundle: nil)
    }
    static let favoriteVideoIdentifier = "FavoriteVideoTableViewCell"
    static func nib2() -> UINib {
        return UINib(nibName: "FavoriteVideoTableViewCell", bundle: nil)
    }
    
    enum CellType: Int {
        case WhatToWatch = 0, FavoriteVideo
    }
    
    enum SectionType: Int {
        case WhatToWatch = 0, FavoriteVideo, section_count
    }
    
    //MARK:Properties
    @IBOutlet var recomendationTableView: UITableView!
    var recomendations = [PopularList]()
    var favoriteVideos = [VideoList]()
    var movieDelegate: WhatToWatchViewControllerMovieDelegate?
    var videoDelegate: WhatToWatchViewControllerVideoDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.recomendationTableView.dataSource = self
        self.recomendationTableView.delegate = self
        self.recomendationTableView.separatorStyle = .none
        configureWhatToWatchTableView()
        configureFavoriteVideoTableView()
    }
    
    private func configureWhatToWatchTableView() {
        recomendationTableView.register(WhatToWatchViewController.nib(), forCellReuseIdentifier: WhatToWatchViewController.whatToWatchIdentifier)
    }
    private func configureFavoriteVideoTableView() {
        recomendationTableView.register(WhatToWatchViewController.nib2(), forCellReuseIdentifier: WhatToWatchViewController.favoriteVideoIdentifier)
    }
    public func loadFilesForWhatToWatchSection() -> Void {
        Provider().fetchWhatToWatchJSON{ (res) in
            switch res {
            case .success(let event):
                self.recomendations.append(contentsOf: event)
                self.movieDelegate?.passRecomendations(data: self.recomendations)
            case .failure(let error):
                print("The error is: \(error)")
            }
        }
    }
    public func loadFilesForFavoriteVideoSection() -> Void {
        Provider().fetchFavoritesJSON { (res) in
            switch res {
            case .success(let event):
                self.favoriteVideos.append(contentsOf: event)
                self.videoDelegate?.passFavoriteVideo(data: self.favoriteVideos)
            case .failure(let error):
                print("The error is: \(error)")
            }
        }
    }
}

extension WhatToWatchViewController: UITableViewDelegate, UITableViewDataSource, FavoriteVideoViewControlleDelegate {
    func passData(name: String, key: String) {
        let videoVC = UIStoryboard.WhatToWatch.video
        videoVC.currentVideo.key = key
        videoVC.currentVideo.name = name
        self.navigationController?.pushViewController(videoVC, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.section_count.rawValue
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == SectionType.WhatToWatch.rawValue {
            return 276
        } else {
            return 210
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 0, width: 270, height: 44))
        headerView.addSubview(titleLabel)
        titleLabel.textColor = UIColor(named: "Accent")
        titleLabel.font = UIFont(name:"Roboto", size:24)
        if let tableSection = CellType(rawValue: section) {
              switch tableSection {
              case .WhatToWatch:
                titleLabel.text = "What to watch?"
              case .FavoriteVideo:
                titleLabel.text = "Favorites of the week"
              }
            }
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == CellType.WhatToWatch.rawValue {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WhatToWatchViewController.whatToWatchIdentifier) as? WhatToWatchTableViewCell else { return UITableViewCell()}
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WhatToWatchViewController.favoriteVideoIdentifier) as? FavoriteVideoTableViewCell else { return UITableViewCell()}
            cell.passDelegate = self
            return cell
        }
    }
}
