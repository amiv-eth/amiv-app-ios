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
    
    public var delegate: LoginViewControllerDelegate?
    
    private let infoLabelText: String = "Login in using your ETHZ username (email address) and your ETHZ password."
    
    // MARK: - View variables
    
    public private(set) var titleLabel: UILabel!
    
    public private(set) var infoLabel: UILabel!
    
    public private(set) var submitButton: UIButton!
    
    public private(set) var cancelButton: UIButton!
    
    public private(set) var usernameTextField: UITextField!
    
    public private(set) var passwordTextField: UITextField!
    
    // MARK: - Initializers
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        // View Creation
        self.titleLabel = self.createTitleLabel()
        self.view.addSubview(self.titleLabel)
        
        self.infoLabel = self.createInfoTextLabel()
        self.view.addSubview(self.infoLabel)
        
        self.submitButton = self.createSubmitButton()
        self.view.addSubview(self.submitButton)
        
        self.cancelButton = self.createCancelButton()
        self.view.addSubview(self.cancelButton)
        
        self.usernameTextField = self.createUsernameTextField()
        self.view.addSubview(self.usernameTextField)
        
        self.passwordTextField = self.createPasswordTextField()
        self.view.addSubview(self.passwordTextField)
        
        // View Constraints
        self.applyTitleLabelConstraints()
        self.applyInfoLabelConstraints()
        self.applyUsernameTextFieldConstraints()
        self.applyPasswordTextFieldConstraints()
        self.applySubmitButtonConstraints()
        self.applyCancelButtonConstraints()
        
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
    
    private func createInfoTextLabel() -> UILabel {
        let label = UILabel()
        label.text = self.infoLabelText
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func applyInfoLabelConstraints() {
        NSLayoutConstraint(item: self.infoLabel, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: self.infoLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.infoLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
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
        NSLayoutConstraint(item: self.submitButton, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.submitButton, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.submitButton, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottomMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.submitButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
    }
    
    private func createCancelButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.amivRed, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.addTarget(self, action: #selector(self.cancel), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    private func applyCancelButtonConstraints() {
        NSLayoutConstraint(item: self.cancelButton, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: self.passwordTextField, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: self.cancelButton, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.cancelButton, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.cancelButton, attribute: .bottom, relatedBy: .equal, toItem: self.submitButton, attribute: .top, multiplier: 1, constant: -15).isActive = true
    }
    
    private func createUsernameTextField() -> UITextField {
        let field = UITextField()
        field.tintColor = .amivRed
        field.placeholder = "Username"
        field.returnKeyType = .continue
        field.borderStyle = .roundedRect
        field.addTarget(self, action: #selector(self.fillPassword), for: .primaryActionTriggered)
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }
    
    private func applyUsernameTextFieldConstraints() {
        NSLayoutConstraint(item: self.usernameTextField, attribute: .top, relatedBy: .equal, toItem: self.infoLabel, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: self.usernameTextField, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.usernameTextField, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
    }
    
    private func createPasswordTextField() -> UITextField {
        let field = UITextField()
        field.tintColor = .amivRed
        field.placeholder = "Password"
        field.returnKeyType = .go
        field.isSecureTextEntry = true
        field.borderStyle = .roundedRect
        field.addTarget(self, action: #selector(self.login), for: .primaryActionTriggered)
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }
    
    private func applyPasswordTextFieldConstraints() {
        NSLayoutConstraint(item: self.passwordTextField, attribute: .top, relatedBy: .equal, toItem: self.usernameTextField, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
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
        
        if let username = self.usernameTextField.text, let password = self.passwordTextField.text {
            self.delegate?.login(username: username, password: password)
        } else {
            self.infoLabel.text = "Oops... This should not happen."
            self.infoLabel.textColor = .red
        }
    }
    
    @objc private func cancel() {
        self.delegate?.cancelLogin()
    }
    
    @objc private func fillPassword() {
        self.passwordTextField.becomeFirstResponder()
    }
    
    @objc private func hideKeyboard() {
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
    public func loginFailed(with error: String) {
        self.infoLabel.text = error
        self.infoLabel.textColor = .red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.infoLabel.textColor = .black
            self.infoLabel.text = self.infoLabelText
        }
    }
    
}
