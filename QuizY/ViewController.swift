//
//  ViewController.swift
//  QuizY
//
//  Created by Daniil Batin on 23.05.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var mainCollectionView = UICollectionView()
    var collectionViewCell = UICollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()

        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.addSubview(collectionViewCell)
    }


    private func initializeCollectionView() {
//        view.addSubview(mainCollectionView)
//        mainCollectionView.snp.makeConstraints { maker in
//            maker.top.equalTo(self.view.safeArea.top)
//            maker.width.equalTo(self.view.snp.width)
//            maker.height.equalTo(self.view.safeArea.height)
//        }
        let myView = UIView()
        myView.backgroundColor = .blue
        view.addSubview(myView)
        myView.snp.makeConstraints { make in
//            make.top.equalTo(self.safeAreaInsets.top)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(self.view.safeAreaLayoutGuide.snp.height)
           
        }
    }
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
}

//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueConfiguredReusableCell(using: collectionView, for: indexPath.row, item: collectionViewCell)
//    
    
    return cell
}

