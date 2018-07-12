//
//  BasePresenter.swift
//  Task
//
//  Created by Amr Mohamed Allam on 7/12/18.
//  Copyright © 2018 Amr Mohamed Allam. All rights reserved.
//

import UIKit

class BasePresenter: PresenterProtocol {
    
    private weak var view: UIViewController?
    
    func attachView(view: UIViewController) {
        self.view = view
    }
    
    func getView() -> UIViewController? {
        return view
    }
    
    func isViewAttached() -> Bool {
        return view == nil
    }
    
    func detachView() {
        view = nil
    }
    
    func loadViewData() {
        
    }
    
}


