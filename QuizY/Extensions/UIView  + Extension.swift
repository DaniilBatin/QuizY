//
//  UIView .swift
//  QuizY
//
//  Created by Daniil Batin on 23.06.2022.
//


import SnapKit


extension UIView {
    
    var safeArea: ConstraintBasicAttributesDSL {
        
        #if swift(>=3.2)
            if #available(iOS 11.0, *) {
                return self.safeAreaLayoutGuide.snp
            }
            return self.snp
        #else
            return self.snp
        #endif
    }

}
