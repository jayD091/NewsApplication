//
//  ArticleService.swift
//  NewsApplication
//
//  Created by macbook on 24/12/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import EVReflection

class Article: EVObject {
    var source: Source?
    var author: String = ""
    var title: String = ""
    var description1: String = ""
    var url: String = ""
    var urlToImage: String = ""
    var publishedAt: String = ""
    var content: String = ""
    
    override func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "description1",keyInResource: "description")]
    }
}

class Source: EVObject {
    var id: String = ""
    var name: String = ""
}

class ArticleService: NSObject {

    class func getArticleListing(success: @escaping ([Article]) -> Void, failure: @escaping (Error?) -> Void) {
        NetworkManager.shared.get(success: { (response) in
            print(response)
            if let data = response.data as? [NSDictionary] {
                var arrayArticleData = [Article]()
                arrayArticleData = [Article].init(dictionaryArray: data)
                success(arrayArticleData)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}
