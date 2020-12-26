//
//  NewsTableViewController.swift
//  WolloWatches
//
//  Created by Teslenko Anastasiya on 30.09.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    //MARK:Properties
    @IBOutlet var newsTableView: UITableView!
    var news = [NewsList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.register(NewsTableViewCell.nib(), forCellReuseIdentifier: NewsTableViewCell.identifier)
        self.newsTableView.separatorStyle = .none
        self.newsTableView.delegate = self
        loadFiles()
    }
    
    private func loadFiles() -> Void {
        Provider().fetchNewsJSON { (res) in
            switch res {
            case .success(let event):
                self.news.append(contentsOf: event)
                DispatchQueue.main.async {
                    self.newsTableView.reloadData()
                }
            case .failure(let error):
                print("The error is: \(error)")
            }
        }
    }
}


// MARK: Table view data source
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 158
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
            cell.setNews = news[indexPath.item]
        return cell
    }
}


