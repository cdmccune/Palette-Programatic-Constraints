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
    
    var photos: [UnsplashPhoto] = []
    
    
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        addAllSubviews()
        setUpButtonStackView()
        constrainTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemIndigo
        configureTableView()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Helper Functions
    
    func addAllSubviews () {
        self.view.addSubview(featureButton)
        self.view.addSubview(randomButton)
        self.view.addSubview(doubleRainbowButton)
        self.view.addSubview(buttonStackView)
        self.view.addSubview(palleteTableView)
    }
    
    func setUpButtonStackView () {
        buttonStackView.addArrangedSubview(featureButton)
        buttonStackView.addArrangedSubview(randomButton)
        buttonStackView.addArrangedSubview(doubleRainbowButton)
        buttonStackView.topAnchor.constraint(equalTo: self.safeArea.topAnchor, constant: 16).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 8).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -8).isActive = true
    }
    
    func constrainTableView() {
        palleteTableView.anchor(top: buttonStackView.bottomAnchor, bottom: self.safeArea.bottomAnchor, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
    }
    
    func configureTableView() {
        palleteTableView.delegate = self
        palleteTableView.dataSource = self
        palleteTableView.register(PaletteTableViewCell.self, forCellReuseIdentifier: "photoCell")
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
    
    let palleteTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()

} //End of class

extension PaletteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //photos.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as? PaletteTableViewCell else {return UITableViewCell()}
        
//        let photo = photos[indexPath.row]
//        cell.photo = photo
        cell.updateViews()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let imageViewSpace: CGFloat = view.frame.width - (2*SpacingConstants.outerHorizontalPadding)
        
        let outerVerticalPaddingSpace:CGFloat = 2 * SpacingConstants.outerVerticalPadding
        
        let labelSpace: CGFloat = SpacingConstants.smallElementHeight
        
        let objectBuffer: CGFloat = 2 * SpacingConstants.verticalObjectVuffer
        
        let colorPaletteViewSpace: CGFloat = SpacingConstants.mediumElementHeight
        
        return imageViewSpace + outerVerticalPaddingSpace + labelSpace + objectBuffer + colorPaletteViewSpace
    }
} //End of Extension
