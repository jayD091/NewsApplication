//
//  NewsListingDataTVC.swift
//  NewsApplication
//
//  Created by macbook on 24/12/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class NewsListingDataTVC: BaseTableViewCell {

    @IBOutlet weak var labelHeader: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelPublishedAt: UILabel!
    @IBOutlet weak var imageData: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configData(data: Article) {
        labelHeader.text = data.title
        labelAuthor.text = data.author
        labelPublishedAt.text = data.publishedAt
        imageData.downloaded(from: data.urlToImage)
    }
    
}
