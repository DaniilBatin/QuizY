//
//  ViewController.swift
//  QuizY
//
//  Created by Daniil Batin on 23.05.2022.
//

import UIKit
import SnapKit

class CategoryViewController: UIViewController {
   
    
    let categoryNameArray = CategoryType.allCases
        
    
    let presenter = CategoryPresenter()
    
    lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.sectionInset.left = 10
        layout.sectionInset.right = 10
        layout.sectionInset.top = 10
        layout.sectionInset.bottom = 10
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "MyReuseID")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        return searchBar
    }()
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        removeKeyboard()
//        let categoryNameCollection = categoryNameArray.map{$0.description}
        presenter.createFilterArray(categoryNameArray)
       
    }

    // Function which setup subviews on main view
    private func setupSubviews() {
        view.addSubview(mainCollectionView)
        view.addSubview(searchBar)
        view.backgroundColor = .systemBackground
    }
    
    // Function which setup constraints
    private func setupConstraints() {
        searchBar.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeArea.top)
            maker.width.equalTo(self.view.snp.width)
        }
        mainCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(searchBar.snp.bottom)
            maker.width.equalTo(self.view.snp.width)
            maker.bottom.equalTo(self.view.safeArea.bottom)
        }
    }
   
}



