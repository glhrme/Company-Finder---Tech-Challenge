//
//  LoginViewController.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let viewModel: LoginViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(_ viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init()
    }

}
