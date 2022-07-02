//
//  CategoryVC + Extension.swift
//  QuizY
//
//  Created by Daniil Batin on 02.07.2022.
//

import Foundation
import UIKit

extension CategoryViewController {
    
    func removeKeyboard() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
       
    }
    



@objc func dismissKeyboard(sender: UITapGestureRecognizer) {
    view.endEditing(true)
}
    
}
