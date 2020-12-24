//
//  NetworkManager.swift
//  NewsApplication
//
//  Created by macbook on 24/12/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import Alamofire

class APIResponse: NSObject {
    var status : Bool!
    var data: Any!
    
    convenience init(response : [String:Any]) {
        self.init()
        if let status = response["status"] as? String {
           self.status = (status.lowercased() == "ok")
        }
        self.data = response["articles"]
    }
}

class NetworkManager: NSObject {

    static let shared = NetworkManager()
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    
    var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    private override init () {
       super.init()
       let cstorage = HTTPCookieStorage.shared
       if let cookies = cstorage.cookies {
           for cookie in cookies {
               cstorage.deleteCookie(cookie)
           }
       }
    }

    func startNetworkReachabilityObserver() {
        reachabilityManager?.listener = { status in
            switch status {
            case .notReachable:
                debugPrint("The network is not reachable")
            case .unknown :
                debugPrint("It is unknown whether the network is reachable")
            case .reachable(.ethernetOrWiFi):
                debugPrint("The network is reachable over the WiFi connection")
            case .reachable(.wwan):
                debugPrint("The network is reachable over the WWAN connection")
            }
        }
        reachabilityManager?.startListening()
    }

    func get(success : @escaping (APIResponse) -> Void, failure : @escaping (Error) -> Void) {
        
        let baseURL = Globals.baseUrl
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        let finalPath = baseURL
        debugPrint("API : ", finalPath)
        Alamofire.request(finalPath, headers: headers).responseString(completionHandler: { (response) in
            debugPrint("Response String : ", response)
        })
        .responseJSON { response in
            self.handleResponse(response: response, success: success, failure: failure)
        }
        
    }

    func handleResponse(response : DataResponse<Any>, success : @escaping (APIResponse) -> Void, failure : @escaping (Error) -> Void) {
        switch response.result {
        case .success(let result):
            if let result = result as? [String: Any] {
                debugPrint("Response : ", result)
                let apiResponse = APIResponse(response: result)
                if apiResponse.status == true {
                    success(apiResponse)
                }
            }
        case .failure(let error):
            debugPrint(error)
            failure(error)
        }
    }
}
