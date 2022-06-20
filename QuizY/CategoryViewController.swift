//
//  ViewController.swift
//  QuizY
//
//  Created by Daniil Batin on 23.05.2022.
//

import UIKit
import SnapKit

class CategoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    

//  private var categoryArray = [Category]()
    private   let categoryNameArray = ["Geography", "Just desserts", "Lakes, rivers", "Word origins", "People",
                                       "Sports stars", "The elements", "Movies", "Stock symbols", "Pop music"]
               
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
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
//        createCategoryArray()
        
       
    }

    // Function which setup busviews on main view
    private func setupSubviews() {
        view.addSubview(mainCollectionView)
        view.backgroundColor = .systemBackground
    }
    
    // Function which setup constraints
    private func setupConstraints() {
        mainCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeArea.top)
            maker.width.equalTo(self.view.snp.width)
            maker.height.equalTo(self.view.safeArea.height)
        }
    }
       
    
    
//    private func createCategoryArray() {
////        let categoryNameArray = ["Geography", "Just desserts", "Lakes, rivers", "Word origins", "People",
////                           "Sports stars", "The elements", "Movies", "Stock symbols", "Pop music"]
//
//        for index in categoryNameArray {
//            let categoryItem = Category()
//            categoryItem.name = index
//            categoryItem.imageLogo = UIImage(named: index)
//            categoryArray.insert(categoryItem, at: 0)
//        }
//    }
    
    //MARK: CollectioView methods

    // Amount of cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryNameArray.count
    }

    // Create cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyReuseID", for: indexPath) as? CustomCell else {return UICollectionViewCell()}
        cell.configure(with: categoryNameArray[indexPath.item])
        cell.backgroundColor = .systemGray
        return cell
    }

    // Setup custom adaptive size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize(width: 1, height: 1)}
        let itemsInRow = 2.0

        let offset = flowLayout.sectionInset.left + abs(flowLayout.sectionInset.right) + (flowLayout.minimumInteritemSpacing * (itemsInRow - 1))
        let availableSpace = collectionView.bounds.width - offset
        let itemWidth = availableSpace / itemsInRow
        return CGSize(width: itemWidth, height: itemWidth * 1.25)
    }
    
    // Action when select item selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let questionViewController = UIViewController() as? QuestionViewController else { return }
        
//        guard let infoArea = qu.instantiateViewController(withIdentifier: "infoArea") as? InformationViewController else {return}
//        guard let infoArea =
//        infoArea.person = categoryNameArray[indexPath.item]
        navigationController?.pushViewController(questionViewController, animated: true)
    }
    
   
    
}



