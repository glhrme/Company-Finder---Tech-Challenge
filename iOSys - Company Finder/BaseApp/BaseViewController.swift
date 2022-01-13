//
//  BaseViewController.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import UIKit

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}

class BaseViewController: UIViewController {
    
    init() {
        let nibName = type(of: self).className
        super.init(nibName: nibName, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
