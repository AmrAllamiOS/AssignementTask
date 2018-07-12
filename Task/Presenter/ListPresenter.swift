//
//  ListPresenter.swift
//  Task
//
//  Created by Amr Mohamed Allam on 7/12/18.
//  Copyright © 2018 Amr Mohamed Allam. All rights reserved.
//

import UIKit

class ListPresenter: BasePresenter {
    var _listViewController: ListViewController?
    var service = Service()
    var timer = Timer()
    var timeEnd : Date?

    var listViewController: ListViewController? {
        get {
            if _listViewController == nil {
                _listViewController = self.getView() as? ListViewController
            }
            return _listViewController
        }
    }
    
    func getViewData() {
        service.getApiResponse { (model) in
            if model != nil{
               // fill data in view
                self.listViewController?.fillWithData(model: model!)
                if let ticks = model?.ticks{
                    self.runTimer(withDate: Double(ticks))
                }
            }else{
                // show error
                self.listViewController?.handelErrorView()
            }
        }
    }
    
    //timer
    func runTimer(withDate:Double?) {
        if let date = withDate{
            timeEnd = Date(timeInterval:date , since: Date())
            setTimeLeft()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.setTimeLeft)), userInfo: nil, repeats: true)
        }
    }
    @objc func setTimeLeft() {
        let timeNow = Date()
        if timeEnd?.compare(timeNow) != ComparisonResult.orderedDescending {
            timer.invalidate()
            //call refresh request
            self.getViewData()
        }
    }
}
