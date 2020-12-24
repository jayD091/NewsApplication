//
//  UIViewController+Extension.swift
//  NewsApplication
//
//  Created by macbook on 24/12/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

extension UIViewController {
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
