//
//  UISearchBar + Extension.swift
//  QuizY
//
//  Created by Daniil Batin on 23.06.2022.
//

import UIKit

extension CategoryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.filterArray = searchText.isEmpty ? categoryNameArray : categoryNameArray.filter { $0.description.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
//        categoryNameArray.filter { (item: String) -> Bool in
//            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
//        }
        mainCollectionView.reloadData()
    }
}


