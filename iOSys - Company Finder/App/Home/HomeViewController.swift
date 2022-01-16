//
//  HomeViewController.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 14/01/22.
//

import UIKit

class HomeViewController: BaseViewController {

    let identifierCell = "CompanyCell"
    let notFoundCell = "NotFoundCell"
    let homeViewModel: HomeViewModel
    let debouncer = Debouncer(timeInterval: 0.3)
    var notFoundEnterprises = false
    var hasLoaded = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        debouncer.renewInterval()
        debouncer.handler = {
            self.homeViewModel.searchEnterprises(self.textField.text)
        }
    }
    
    init(_ viewModel: HomeViewModel) {
        self.homeViewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CompanyCell", bundle: nil), forCellWithReuseIdentifier: identifierCell)
        collectionView.register(UINib(nibName: "NotFoundCell", bundle: nil), forCellWithReuseIdentifier: notFoundCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.homeViewModel.delegate = self
        self.loadInitialData()
    }
    
    private func loadInitialData() {
        self.homeViewModel.searchEnterprises("")
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.notFoundEnterprises = false
        let count = self.homeViewModel.enterprises.enterprises.count
        if count > 0 {
            return count
        } else if hasLoaded {
            self.notFoundEnterprises = true
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if notFoundEnterprises {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: notFoundCell, for: indexPath) as! NotFoundCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as! CompanyCell
        cell.setup(self.homeViewModel.enterprises.enterprises[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if notFoundEnterprises {
            let width = collectionView.bounds.width
            return CGSize(width: width, height: 200)
        }
        let width = collectionView.bounds.width / 2
        return CGSize(width: width - 5, height: 149)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if notFoundEnterprises == false {
            self.homeViewModel.goToDetails(self.homeViewModel.enterprises.enterprises[indexPath.row])
        }
    }
}

extension HomeViewController: HomeViewDelegete {
    func updateData() {
        self.hasLoaded = true
        self.collectionView.reloadData()
    }
}
