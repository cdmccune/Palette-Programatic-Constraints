//
//  ColorPaletteView.swift
//  Palette
//
//  Created by Curt McCune on 6/9/22.
//  Copyright © 2022 Cameron Stuart. All rights reserved.
//

import UIKit

class ColorPaletteView: UIView {
    
    //MARK: - Properties
    var colors: [UIColor]? {
        didSet {
            buildColorBlocks()
        }
    }
    
    //MARK: - Lifecycles
        override func layoutSubviews() {
            super.layoutSubviews()
            setUpViews()
        }
        
    
    //MARK: - Helper Methods
    
    func buildColorBlocks () {
        resetColorBricks()
        guard let colors = colors else {return}
        
        for color in colors {
            let colorBrick = generateColorBrick(for: color)
            self.addSubview(colorBrick)
            self.colorStackView.addArrangedSubview(colorBrick)
        }
        self.layoutIfNeeded()
    }
    
    func generateColorBrick(for color:UIColor) -> UIView {
        let colorBrick = UIView()
        colorBrick.backgroundColor = color
        return colorBrick
    }
    
    func resetColorBricks() {
        for subview in colorStackView.arrangedSubviews {
            self.colorStackView.removeArrangedSubview(subview)
        }
    }
    
    func setUpViews() {
        self.addSubview(colorStackView)
        colorStackView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
    }
    
    
    //MARK: - Views
    let colorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    
} //End of Class

