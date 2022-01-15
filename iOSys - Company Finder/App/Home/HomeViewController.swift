//
//  HomeViewController.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 14/01/22.
//

import UIKit

class HomeViewController: BaseViewController {

    let identifierCell = "CompanyCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CompanyCell", bundle: nil), forCellWithReuseIdentifier: identifierCell)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        return CGSize(width: width - 5, height: 149)
    }
}
