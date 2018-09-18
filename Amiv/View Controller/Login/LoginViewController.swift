//
//  LoginViewController.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class LoginViewController: UIViewController {
    
    // MARK: - Variables
    
    // MARK: - View variables
    
    public private(set) var titleLabel: UILabel!
    
    public private(set) var submitButton: UIButton!
    
    public private(set) var usernameTextField: UITextField!
    
    public private(set) var passwordTextField: UITextField!
    
    // MARK: - Initializers
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        // View Creation
        self.submitButton = self.createSubmitButton()
        self.view.addSubview(self.submitButton)
        
        self.usernameTextField = self.createUsernameTextField()
        self.view.addSubview(self.usernameTextField)
        
        self.passwordTextField = self.createPasswordTextField()
        self.view.addSubview(self.passwordTextField)
        
        // View Constraints
        self.applyTitleLabelConstraints()
        self.applyUsernameTextFieldConstraints()
        self.applyPasswordTextFieldConstraints()
        self.applySubmitButtonConstraints()
        
        // Tap view to hide keyboard
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.view.addGestureRecognizer(recognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Creation
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .amivRed
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func applyTitleLabelConstraints() {
        NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
    }
    
    private func createSubmitButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.backgroundColor = .amivRed
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(self.login), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    private func applySubmitButtonConstraints() {
        NSLayoutConstraint(item: self.submitButton, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: self.passwordTextField, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: self.submitButton, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.submitButton, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.submitButton, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottomMargin, multiplier: 1, constant: -10).isActive = true
    }
    
    private func createUsernameTextField() -> UITextField {
        let field = UITextField()
        field.tintColor = .amivRed
        field.placeholder = "Username"
        field.addTarget(self, action: #selector(self.fillPassword), for: .primaryActionTriggered)
        field.translatesAutoresizingMaskIntoConstraints = true
        
        return field
    }
    
    private func applyUsernameTextFieldConstraints() {
        NSLayoutConstraint(item: self.usernameTextField, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: self.usernameTextField, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.usernameTextField, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
    }
    
    private func createPasswordTextField() -> UITextField {
        let field = UITextField()
        field.tintColor = .amivRed
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.addTarget(self, action: #selector(self.login), for: .primaryActionTriggered)
        field.translatesAutoresizingMaskIntoConstraints = true
        
        return field
    }
    
    private func applyPasswordTextFieldConstraints() {
        NSLayoutConstraint(item: self.passwordTextField, attribute: .top, relatedBy: .equal, toItem: self.usernameTextField, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.passwordTextField, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
    }
    
    // MARK: - View Setup
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    // MARK: - View Interaction
    
    @objc private func login() {
        self.hideKeyboard()
        debugPrint("logging in")
    }
    
    @objc private func fillPassword() {
        self.passwordTextField.becomeFirstResponder()
    }
    
    @objc private func hideKeyboard() {
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
    public func errorLogin(error: String) {
        self.titleLabel.text = error
    }
    
}
