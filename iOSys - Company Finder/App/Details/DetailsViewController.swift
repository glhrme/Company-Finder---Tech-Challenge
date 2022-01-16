//
//  DetailsViewController.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 16/01/22.
//

import UIKit
import Kingfisher

class DetailsViewController: BaseViewController {
    
    let baseURL = "https://empresas.ioasys.com.br"
    let enterprise: Enterprise
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    init(_ enterprise: Enterprise) {
        self.enterprise = enterprise
        super.init()
    }
    
    private func setup() {
        self.descriptionLabel.text = self.enterprise.description
        self.setupImage(self.enterprise.photo)
    }
    
    private func setupImage(_ photo: String) {
        let url = URL(string: self.baseURL + photo)
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
