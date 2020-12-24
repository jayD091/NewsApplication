//
//  BaseTableView.swift
//  NewsApplication
//
//  Created by macbook on 24/12/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class BaseTableView: UITableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .homeScreenTableBackground
        self.tableFooterView = UIView()
        self.separatorStyle = .none
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
}
