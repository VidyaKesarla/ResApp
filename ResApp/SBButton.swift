//
//  SBButton.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 01/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class SBButton: UIButton {

        
        override init(frame: CGRect){
            super.init(frame: frame)
            setupButton()
        }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton(){
        //backgroundColor =
        //titleLabel?.font = UIFont(name: font.avenirNextCondensedDemiBold, size: 22)
        layer.cornerRadius = frame.size.height/2
        setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    }


