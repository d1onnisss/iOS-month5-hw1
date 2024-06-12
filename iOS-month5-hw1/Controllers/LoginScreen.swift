//
//  ViewController.swift
//  iOS-month5-hw1
//
//  Created by Alexey Lim on 12/6/24.
//

import UIKit
import SnapKit

protocol LoginScreenDelegate: AnyObject {
    func didLoginSuccess()
    func didLoginFail()
}

class LoginScreen: UIViewController, LoginScreenDelegate {
    
    private var controller: LoginControllerProtocol!
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 10
        return view
    }()
    
    private lazy var loginTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your login"
        tf.textColor = .black
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 12
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        tf.addTarget(self, action: #selector(textFieldsValidate), for: .editingChanged)
        
        return tf
    }()
    
    private lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your password"
        tf.textColor = .black
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 12
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        tf.addTarget(self, action: #selector(textFieldsValidate), for: .editingChanged)
        
        return tf
    }()
    
    private let enterBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 16
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.isEnabled = false
        button.addTarget(self, action: #selector(enterBtnTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        controller = LoginScreenController(model: LoginScreenModel(), view: self)
        setupUI()
    }
    
    func didLoginSuccess() {
        resetBorderColors()
        let vc = SuccessController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didLoginFail() {
        loginTF.layer.borderColor = UIColor.red.cgColor
        passwordTF.layer.borderColor = UIColor.red.cgColor
    }
    
    @objc private func textFieldsChanged() {
        enterBtn.isEnabled = !(loginTF.text?.isEmpty ?? true) &&
        !(passwordTF.text?.isEmpty ?? true)
    }
    
    @objc private func textFieldsValidate() {
        if !(loginTF.text?.isEmpty ?? true) &&  !(passwordTF.text?.isEmpty ?? true) {
            enterBtn.backgroundColor = .systemRed
        } else {
            enterBtn.backgroundColor = .systemGray4
        }
    }
    
    private func resetBorderColors() {
        loginTF.layer.borderColor = UIColor.black.cgColor
        passwordTF.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc private func enterBtnTapped() {
        let login = loginTF.text ?? ""
        let password = passwordTF.text ?? ""
        controller?.login(username: login, password: password)
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(50)
            make.centerY.equalToSuperview()
        }
        
        stackView.addArrangedSubview(loginTF)
        stackView.addArrangedSubview(passwordTF)
        stackView.addArrangedSubview(enterBtn)
        
        loginTF.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        passwordTF.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        enterBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
}

