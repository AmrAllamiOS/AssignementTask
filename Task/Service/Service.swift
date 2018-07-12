//
//  Service.swift
//  Task
//
//  Created by Amr Mohamed Allam on 7/12/18.
//  Copyright © 2018 Amr Mohamed Allam. All rights reserved.
//

import UIKit

class Service: NSObject {
    
    func getApiResponse(withModel : @escaping (ResponseModel?) -> ()) {
        Request.fireRequest { (responseModel) in
            if responseModel != nil {
                //sucess
                withModel(responseModel)
            }else{
                //error
                withModel(nil)
            }
        }
    }

}
