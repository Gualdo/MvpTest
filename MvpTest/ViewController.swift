//
//  ViewController.swift
//  MvpTest
//
//  Created by De La Cruz, Eduardo on 25/10/2018.
//  Copyright © 2018 De La Cruz, Eduardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, VCDelegate {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblErrorMessage: UILabel!
    var presenter: VCPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblErrorMessage.isHidden = true
        self.presenter = VCPresenter()
        presenter.delegate = self
    }
    
    // MARK: - Subit Data
    
    @IBAction func submitData(_ sender: Any) {
        self.lblErrorMessage.isHidden = true
        self.presenter.validateData(userName: txtUserName.text!, password: txtPassword.text!)
    }
    
    // MARK: - Presenter Delegate
    
    func showMessage(message: String) {
        self.lblErrorMessage.isHidden = false
        self.lblErrorMessage.textColor = UIColor.red
        self.lblErrorMessage.text = message
    }
    
    func userSuccessfullyLoggedIn() {
        print("User data: Nombre: \(self.presenter.name), Email: \(self.presenter.email), Gender: \(self.presenter.gender)")
        self.lblErrorMessage.isHidden = false
        self.lblErrorMessage.text = "User loggedin"
        self.lblErrorMessage.textColor = UIColor.green
    }
}
