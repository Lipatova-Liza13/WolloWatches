//
//  ProfileViewController.swift
//  WolloWatches
//
//  Created by Bogdan Deshko on 9/29/20.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // TODO: Delete button action and implement this flow using UITableView
    @IBAction func About(_ sender: Any) {
        let aboutVC = UIStoryboard.Profile.about
        self.navigationController?.pushViewController(aboutVC, animated: true)
    }
    
}
