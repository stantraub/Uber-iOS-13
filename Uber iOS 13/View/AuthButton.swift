//
//  AuthButton.swift
//  Uber iOS 13
//
//  Created by Stanley Traub on 7/8/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import UIKit

class AuthButton: UIButton {


    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("Log In", for: .normal)
        setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        backgroundColor = .mainBlueTint
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
