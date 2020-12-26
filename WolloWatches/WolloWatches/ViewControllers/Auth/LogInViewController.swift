//
//  LogInViewController.swift
//  WolloWatches
//
//  Created by Teslenko Anastasiya on 06.09.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func logInAction(_ sender: Any) {
        let mainAppScreen = UIStoryboard.Main.tabBar
        mainAppScreen.modalPresentationStyle = .fullScreen
        present(mainAppScreen, animated: true, completion: nil)
    }

    @IBAction func registerAction(_ sender: Any) {
        let signUpVC = UIStoryboard.Auth.signUp
        //signUpVC.data
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
