//
//  ViewController.swift
//  QuizY
//
//  Created by Daniil Batin on 23.05.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    

    private var categoryArray = [Category]()
    
    private lazy var mainCollectionView: UICollectionView = {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        createCategoryArray()
        
       
    }


    private func setupSubviews() {
        view.addSubview(mainCollectionView)
        view.backgroundColor = .systemBackground
    }
    
    private func setupConstraints() {
        mainCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeArea.top)
            maker.width.equalTo(self.view.snp.width)
            maker.height.equalTo(self.view.safeArea.height)
        }
    }
       
    
    
    private func createCategoryArray() {
        let categoryNameArray = ["Geography", "Just desserts", "Lakes, rivers", "Word origins", "People",
                           "Sports stars", "The elements", "Movies", "Stock symbols", "Pop music"]
   
        for index in categoryNameArray {
            let categoryItem = Category()
            categoryItem.name = index
            categoryItem.imageLogo = UIImage(named: index)
            categoryArray.insert(categoryItem, at: 0)
        }
    }
    


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyReuseID", for: indexPath) as? CustomCell else {return UICollectionViewCell()}
        cell.configure(with: categoryArray[indexPath.item])
        cell.backgroundColor = .systemGray

        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize(width: 1, height: 1)}
        let itemsInRow = 2.0

        let offset = flowLayout.sectionInset.left + abs(flowLayout.sectionInset.right) + (flowLayout.minimumInteritemSpacing * (itemsInRow - 1))
        let availableSpace = collectionView.bounds.width - offset
        let itemWidth = availableSpace / itemsInRow
        return CGSize(width: itemWidth, height: itemWidth * 1.25)
    }
    
    
    
}



