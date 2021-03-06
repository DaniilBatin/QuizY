//
//  CustomCell + Extension.swift
//  QuizY
//
//  Created by Daniil Batin on 23.06.2022.
//

import Foundation
import UIKit

extension CustomCell {
    
    //Make rounding for custom cell
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
}
