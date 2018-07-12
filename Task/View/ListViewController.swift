//
//  ViewController.swift
//  Task
//
//  Created by Amr Mohamed Allam on 7/12/18.
//  Copyright © 2018 Amr Mohamed Allam. All rights reserved.
//

import UIKit
import CRRefresh

class ListViewController: UIViewController {
    var listPresenter = ListPresenter()
    var cardsDataSourceArr = [Car]()
    var responseModel : ResponseModel?

    @IBOutlet weak var cardTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listPresenter._listViewController = self
        listPresenter.attachView(view: self)
        listPresenter.getViewData()
        setupTableView()
        handelErrorView()
    }
    func fillWithData(model:ResponseModel){
        
        if let cards = model.cars{
         cardsDataSourceArr = [Car]()
         cardsDataSourceArr = cards
        }
        responseModel = model
        cardTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupTableView() {
        cardTableView?.estimatedRowHeight = 150
        cardTableView?.rowHeight = UITableViewAutomaticDimension
        cardTableView.backgroundColor = UIColor.clear
        cardTableView?.separatorStyle = .none
        cardTableView.cr.addHeadRefresh(animator: NormalHeaderAnimator()) { [weak self] in
            self?.listPresenter.getViewData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self?.cardTableView.cr.endHeaderRefresh()
            })
        }
        cardTableView.cr.beginHeaderRefresh()

    }
    
    
//    //timer
//    func runTimer(withDate:Double?) {
//        if let date = withDate{
//            timeEnd = Date(timeInterval:date , since: Date())
//            setTimeLeft()
//            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.setTimeLeft)), userInfo: nil, repeats: true)
//        }
//    }
//
//    @objc func setTimeLeft() {
//        let timeNow = Date()
//        if timeEnd?.compare(timeNow) != ComparisonResult.orderedDescending {
//            timer.invalidate()
//            //call refresh request
//            listPresenter.getViewData()
//        }
//    }

    func handelErrorView() {
        let alert = UIAlertController(title: "Error", message: "There was an error ... please refresh.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }


}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsDataSourceArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardViewCell") as! CardViewCell
        cell.timer.invalidate()
        cell.setupCell(uiModel:cardsDataSourceArr[indexPath.row],model:responseModel!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

}
}

