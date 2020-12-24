//
//  NewDetailDataTVC.swift
//  NewsApplication
//
//  Created by macbook on 24/12/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class NewDetailDataTVC: BaseTableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var imageData: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configData(data: Article) {
        labelTitle.text = data.title
        labelDescription.text = data.description1
        labelContent.text = data.content
        labelAuthor.text = data.author
        labelDate.text = Globals.shared.getDate(date: data.publishedAt)//data.publishedAt
        imageData.downloaded(from: data.urlToImage)
    }
    
}
