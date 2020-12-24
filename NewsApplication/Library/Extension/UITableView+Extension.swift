//
//  UITableView+Extension.swift
//  NewsApplication
//
//  Created by macbook on 24/12/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

extension UITableView {
    func registerXibs(identifiers: [String]) {
        identifiers.forEach { (identifier) in
            self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        }
    }
}
