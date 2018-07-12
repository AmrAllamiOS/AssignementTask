//
//  Request.swift
//  Task
//
//  Created by Amr Mohamed Allam on 7/12/18.
//  Copyright © 2018 Amr Mohamed Allam. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

let Api_Url = "http://api.emiratesauction.com/v2/carsonline"

class Request: NSObject {
    
    static func fireRequest(withResponse : @escaping (ResponseModel?) -> ())   {
        Alamofire.request(Api_Url).validate().responseJSON { response in
            switch response.result {
            case .success:
                guard let value = response.result.value as? JSON,
                    let responseModel = ResponseModel(json: value) else {
                        return
                }
                withResponse(responseModel)
            case .failure(let error):
                withResponse(nil)

            }
        }
        
    }
}
