//
//  PaletteViewController.swift
//  Palette
//
//  Created by Curt McCune on 6/8/22.
//  Copyright © 2022 Cameron Stuart. All rights reserved.
//

import UIKit

class PaletteViewController: UIViewController {

    //MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        addAllSubviews()
        setUpButtonStackView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemIndigo
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Helper Functions
    
    func addAllSubviews () {
        self.view.addSubview(featureButton)
        self.view.addSubview(randomButton)
        self.view.addSubview(doubleRainbowButton)
        self.view.addSubview(buttonStackView)
    }
    
    func setUpButtonStackView () {
        buttonStackView.addArrangedSubview(featureButton)
        buttonStackView.addArrangedSubview(randomButton)
        buttonStackView.addArrangedSubview(doubleRainbowButton)
        buttonStackView.topAnchor.constraint(equalTo: self.safeArea.topAnchor, constant: 16).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 8).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -8).isActive = true
    }
    
    //MARK: - Views
    let featureButton: UIButton = {
        let button = UIButton()
        button.setTitle("Featured", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        
        return button
    }()
    
    let randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Random", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        
        return button
    }()
    
    let doubleRainbowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Double Rainbow", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        
        return button
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

} //End of class
