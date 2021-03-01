//
//  AuthViewController.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 26.02.2021.
//

import UIKit

final class AuthViewController: UIViewController, AuthModuleOutput {
    
    // MARK: AuthModuleOutput
    /// first: userId, second: token
    var onSignIn: (() -> Void)?
    
    // MARK: Properties:
    var presenter: AuthViewOutput!
    
    // MARK: Outlets:
     fileprivate let signInLabel: UILabel = {
        let label = BigLabel(text: "Sign In")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    fileprivate let emailLabel: UILabel = {
        let label = SimpleLabel(text: "Email")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    fileprivate let passwordLabel: UILabel = {
        let label = SimpleLabel(text: "Password")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    fileprivate let emailTextField: UITextField = {
        let textField = AppTextField(placeHolder: "Your email")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    fileprivate let passwordTextField: AppTextField = {
        let textField = AppTextField(placeHolder: "Your password")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    fileprivate let signInButton: BigButton = {
        let btn = BigButton(text: "Sign In", titleColor: .white, backgroundColor: .blue, cornerRadius: 10)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    fileprivate let signUpButton: SimpleButton = {
        let btn = SimpleButton(text: "Sign Up", titleColor: .blue)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    fileprivate let forgorPasswordButton: SimpleButton = {
        let btn = SimpleButton(text: "Forgot a password?", titleColor: .blue)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    fileprivate let formStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerForKeyboardEvents()
        makeConstraints()
    }
    
    deinit {
        unregisterFromKeyboardEvents()
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(signInLabel)
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        emailStackView.axis = .vertical
        emailStackView.alignment = .fill
        emailStackView.spacing = 5
        
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
        passwordStackView.axis = .vertical
        passwordStackView.alignment = .fill
        passwordStackView.spacing = 5
        
        formStackView.addArrangedSubview(emailStackView)
        formStackView.addArrangedSubview(passwordStackView)
        formStackView.axis = .vertical
        formStackView.spacing = 10
        
        view.addSubview(formStackView)
        
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        view.addSubview(signUpButton)
        view.addSubview(forgorPasswordButton)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
                    target: self,
                    action: #selector(endEditing))
                
                //Add this tap gesture recognizer to the parent view
                view.addGestureRecognizer(tap)
    }
    
    @objc fileprivate func signInTapped() {
        endEditing()
        presenter.signIn(email: emailTextField.text, password: passwordTextField.text)
    }
    
    @objc fileprivate func endEditing() {
        view.endEditing(true)
    }
    
}

// MARK: -KeyboardControllable

extension AuthViewController: KeyboardControllable {
    
    func handleKeyboardWillHide(_ notification: Notification) {
      guard let _ = notification.keyboardSize else { return }
      view.frame.origin = .zero
    }
    
    func handleKeyboardWillShow(_ notification: Notification) {
      guard let _ = notification.keyboardSize else { return }
      let offset = signInLabel.frame.maxY
      view.frame.origin.y = -offset
    }
    
}

// MARK: -keyboardHandling

extension AuthViewController: KeyboardObservable {

    func keyboardWillShow(_ notification: Notification) {
      handleKeyboardWillShow(notification)
    }

    func keyboardWillHide(_ notification: Notification) {
      handleKeyboardWillHide(notification)
    }
}

// MARK: -textField:

extension AuthViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: -AuthViewInput:
extension AuthViewController: AuthViewInput {
    
    func wrongPassword() {
        passwordTextField.text = nil
        passwordTextField.highlight(with: "Wrong password! Try again.")
    }
    
    func startHUD() {
        view.activityStartAnimating(activityColor: .gray, backgroundColor: .lightGray)
    }
    
    func stopHUD() {
        view.activityStopAnimating(withDelay: 0.2)
    }
    
    
    func signInSucceed() {
        onSignIn?()
    }
    
    func showAlert(title: String, message: String, buttonTitle: String, handler: (() -> ()?)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

// MARK: -makeConstraints:
fileprivate extension AuthViewController {
    
    func makeConstraints() {
        makeConstraintsToSignInLabel()
        makeConstraintsToFormStackView()
        makeConstraintsToSignInButton()
        makeConstraintsToOtherButtons()
    }
    
    func makeConstraintsToSignInLabel() {
        NSLayoutConstraint.activate([
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
    
    func makeConstraintsToFormStackView() {
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            formStackView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 50),
            formStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func makeConstraintsToSignInButton() {
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 30),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func makeConstraintsToOtherButtons() {
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
            
            forgorPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgorPasswordButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 15)
        ])
        
    }
    
}
