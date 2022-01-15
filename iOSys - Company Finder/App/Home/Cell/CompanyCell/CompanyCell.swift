//
//  CompanyCell.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 14/01/22.
//

import UIKit

class CompanyCell: UICollectionViewCell {

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

}
