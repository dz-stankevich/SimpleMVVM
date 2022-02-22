//
//  ViewController.swift
//  SimpleMVVM
//
//  Created by Дмитрий Станкевич on 10.02.22.
//

import Foundation
import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK: - Varibles
    private var viewModel = ViewModel()
    private let edgeInsets = UIEdgeInsets(all: 20)
    private let imageSize = CGSize(width: 300, height: 300)
    private let buttonAndFieldSize = CGSize(width: 120, height: 30)
    

    //MARK: - UI Varibles
    private lazy var imageView: UIImageView = {
       let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        image.image = UIImage(named: "404")
        
        return image
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .black
        label.text = "Enter a network status code"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private lazy var textField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "100..599"
        textField.backgroundColor = .white
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get image", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    
    //MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
         
        initView()
        
        self.viewModel.bindViewModelToView = {
            self.updateUI()
        }
    }
    

    //MARK: - Init
    
    private func initView() {
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.infoLabel)
        self.view.addSubview(self.textField)
        self.view.addSubview(self.continueButton)
        
        self.view.backgroundColor = .systemGray
        
        constraints()
    }
    
    //MARK: - UpdateUI
    private func updateUI() {
        self.imageView.image = self.viewModel.image
    }
    
    
    //MARK: - Constraints
    private func constraints() {
        self.imageView.snp.updateConstraints { (make) in
            make.top.equalToSuperview().inset(120)
            make.left.right.lessThanOrEqualToSuperview().inset(self.edgeInsets)
            make.centerX.equalToSuperview()
            make.size.equalTo(self.imageSize)
        }
        
        self.infoLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.left.right.lessThanOrEqualToSuperview().inset(self.edgeInsets)
        }
        
        self.textField.snp.updateConstraints { (make) in
            make.top.equalTo(self.infoLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.size.equalTo(self.buttonAndFieldSize)
        }
        
        self.continueButton.snp.updateConstraints { (make) in
            make.top.equalTo(self.textField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.size.equalTo(self.buttonAndFieldSize)
        }
    }
    
    //MARK: - Methods
    @objc internal func buttonPressed() {
        print("Button pressed")
        self.viewModel.believeCode(codeString: self.textField.text)
    }
}
