//
//  LogUpViewController.swift
//  WolloWatches
//
//  Created by Teslenko Anastasiya on 06.09.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit

class LogUpViewController: UIViewController {
    
    //MARK:Properties
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:Actions
    @IBAction func signUpAction(_ sender: Any) {
        let errorColour = UIColor(named: "Accent")!
        let validator: Validator = Validator()
        do {
            let username = try validator.userNameValidator(userNameTextField.self.text!)
            changeColourOf(textField: userNameTextField, label: userNameLabel, colourTF: UIColor(named: "Font")!, colourL: UIColor(named: "MinorFont")!)
        } catch(let error) {
            changeColourOf(textField: userNameTextField, label: userNameLabel, colourTF: errorColour, colourL: errorColour)
            showAlert(for: (error as! ValidationError).message)
        }
        
        do {
            let email = try validator.emailValidator(emailTextField.self.text!)
            changeColourOf(textField: emailTextField, label: emailLabel, colourTF: UIColor(named: "Font")!, colourL: UIColor(named: "MinorFont")!)
        } catch(let error) {
            changeColourOf(textField: emailTextField, label: emailLabel, colourTF: errorColour, colourL: errorColour)
            showAlert(for: (error as! ValidationError).message)
        }
        
        do {
            let password = try validator.passwordValidator(passwordTextField.self.text!)
            changeColourOf(textField: passwordTextField, label: passwordLabel, colourTF: UIColor(named: "Font")!, colourL: UIColor(named: "MinorFont")!)
        } catch(let error) {
            changeColourOf(textField: passwordTextField, label: passwordLabel, colourTF: errorColour, colourL: errorColour)
            showAlert(for: (error as! ValidationError).message)
        }
    }
    
    //MARK:DesignChange
    func changeColourOf(textField:UITextField!, label: UILabel!, colourTF: UIColor, colourL: UIColor){
        textField.layer.borderColor = colourTF.cgColor
        textField.layer.borderWidth = 0.5
        label.textColor = colourL
        textField.layer.cornerRadius = 9
    }
    
    //MARK:Alert
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
