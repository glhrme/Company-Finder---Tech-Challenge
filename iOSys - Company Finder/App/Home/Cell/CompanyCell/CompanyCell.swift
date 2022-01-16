//
//  CompanyCell.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 14/01/22.
//

import UIKit
import Kingfisher

class CompanyCell: UICollectionViewCell {
    
    let baseURL = "https://empresas.ioasys.com.br"
    
    var enterprise: Enterprise?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var purpleView: UIView! {
        didSet {
            purpleView.roundCorners(corners: UIRectCorner([.allCorners]), radius: 10)
        }
    }
    @IBOutlet weak var whiteView: UIView! {
        didSet {
            whiteView.roundCorners(corners: UIRectCorner([.bottomLeft, .bottomRight]), radius: 10)
        }
    }
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        //Forma 100% nativa de adicionar 'border radius'
        imageView.layer.cornerRadius = 10
    }
    
    func setup(_ enterprise: Enterprise) {
        self.enterprise = enterprise
        self.setupImage()
        self.setupLabel()
    }
    
    private func setupLabel() {
        self.titleLabel.text = enterprise?.enterprise_name
    }
    
    private func setupImage() {
        guard let enterprise = self.enterprise else { return }
        let url = URL(string: self.baseURL + enterprise.photo)
        self.imageView.kf.setImage(with: url, placeholder: nil, options: nil) { result in
            switch result {
            case .success:
                self.imageView.contentMode = .scaleToFill
            case .failure:
                self.imageView.image = UIImage(named: "book")
            }
        }
                
    }

}
