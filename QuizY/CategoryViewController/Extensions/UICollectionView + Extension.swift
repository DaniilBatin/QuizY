//
//  CategoryViewC + UICollectionView.swift
//  QuizY
//
//  Created by Daniil Batin on 23.06.2022.
//

import UIKit

extension CategoryViewController:  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Amount of cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.count
    }

    // Create cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyReuseID", for: indexPath) as? CustomCell else {return UICollectionViewCell()}
        cell.configure(with: presenter.filterArray[indexPath.item].description)
//        cell.backgroundColor = .systemGray
        return cell
    }

    // Setup custom adaptive size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize(width: 1, height: 1)}
        let itemsInRow = 2.0

        let offset = flowLayout.sectionInset.left + abs(flowLayout.sectionInset.right) + (flowLayout.minimumInteritemSpacing * (itemsInRow - 1))
        let availableSpace = collectionView.bounds.width - offset
        let itemWidth = availableSpace / itemsInRow
        return CGSize(width: itemWidth, height: itemWidth * 1.15)
    }

    // Action when select item selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let presenter = QuestionPresenter(presenter.filterArray[indexPath.item])
        let questionViewController = QuestionViewController(presenter)
        presenter.view = questionViewController
        navigationController?.pushViewController(questionViewController, animated: true)
    }


    
    
}



