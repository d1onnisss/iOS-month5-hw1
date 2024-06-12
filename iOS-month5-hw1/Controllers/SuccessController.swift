//
//  SuccessController.swift
//  iOS-month5-hw1
//
//  Created by Alexey Lim on 12/6/24.
//

import UIKit
import SnapKit

class SuccessController: UIViewController {

    private lazy var successLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        navigationController?.navigationBar.tintColor = .black
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(successLabel)
        
        successLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
