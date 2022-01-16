//
//  HomeViewController.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 14/01/22.
//

import UIKit

class HomeViewController: BaseViewController {

    let identifierCell = "CompanyCell"
    let homeViewModel: HomeViewModel
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    init(_ viewModel: HomeViewModel) {
        self.homeViewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CompanyCell", bundle: nil), forCellWithReuseIdentifier: identifierCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.homeViewModel.delegate = self
        self.loadInitialData()
    }
    
    private func loadInitialData() {
        self.homeViewModel.searchEnterprises()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.homeViewModel.enterprises?.enterprises.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as! CompanyCell
        cell.setup(self.homeViewModel.enterprises!.enterprises[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        return CGSize(width: width - 5, height: 149)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO
    }
}

extension HomeViewController: HomeViewDelegete {
    func updateData() {
        self.collectionView.reloadData()
    }
}
