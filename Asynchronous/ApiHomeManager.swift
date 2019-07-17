//
//  ApiHomeManager.swift
//  Comic
//
//  Created by HoaPQ on 7/7/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias Completion = (_ success: Bool, _ data: [String: Any?]?) -> ()

class ApiHomeManager
{
    static let shared: ApiHomeManager = ApiHomeManager()
    
    func getHomeDta(url: String, completion: @escaping Completion)
    {
        if let url = URL(string: url)
        {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.timeoutInterval = 10
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error)in
                if let responseData = data
                {
                    var json = JSON(responseData) // cast nó thành dạng json
                    var newest = [HomeAPI]()
                    for newestJSON in json["newest"].arrayValue
                    {
                        let comic = HomeAPI(json: newestJSON) // cast back to HomeAPI
                        newest.append(comic) // append in
                    }
                    
                    var popular = [HomeAPI]()
                    for popularJSON in json["popular"].arrayValue
                    {
                        let comic = HomeAPI(json: popularJSON)
                        popular.append(comic)
                    }
                    completion(true, ["newest": newest, "popular": popular])
                }
                else
                {
                    completion(false, nil)
                }
            }.resume()
        }
    }
    
}
