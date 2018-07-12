//
//  CardViewCell.swift
//  Task
//
//  Created by Amr Mohamed Allam on 7/12/18.
//  Copyright © 2018 Amr Mohamed Allam. All rights reserved.
//

import UIKit
import Kingfisher

class CardViewCell: UITableViewCell {
    
     let image_width = "300"
     let image_height = "300"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceCurency: UILabel!
    @IBOutlet weak var titlePriceLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var bidsLabel: UILabel!
    @IBOutlet weak var lotLabel: UILabel!
    var timer = Timer()
    var timeEnd : Date?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configre the view for the selected state
    }
    func setupCell(uiModel:Car,model:ResponseModel) {
        titleLabel.text = "\(uiModel.modelEn ?? "") \(uiModel.year ?? 0)"
        titlePriceLabel.text = "\(uiModel.auctionInfo?.currentPrice ?? 0)"
        priceCurency.text = uiModel.auctionInfo?.currencyEn ?? ""
        var imageUrlString = uiModel.image?.replacingOccurrences(of: "[w]", with: image_width)
        imageUrlString = imageUrlString?.replacingOccurrences(of: "[h]", with: image_height)
        lotLabel.text = "\(uiModel.auctionInfo?.lot ?? 0)"
        bidsLabel.text = "\(uiModel.auctionInfo?.bids ?? 0)"
        if let imageUrl = imageUrlString{
            cardImage.kf.setImage(with: URL.init(string: imageUrl))
        }
        if let ticks = model.ticks{
            runTimer(withDate: Double(ticks))
        }
    }
    func runTimer(withDate:Double?) {
        if let date = withDate{
            timeEnd = Date(timeInterval:date , since: Date())
            setTimeLeft()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.setTimeLeft)), userInfo: nil, repeats: true)
        }
    }

    @objc func setTimeLeft() {
        let timeNow = Date()
        
        
        if timeEnd?.compare(timeNow) == ComparisonResult.orderedDescending {
            
            let interval = timeEnd?.timeIntervalSince(timeNow)
            
            let daysRemainder = interval?.truncatingRemainder(dividingBy: 60*60*24)
            
            let hours = (daysRemainder! / (60 * 60)).rounded(.down)
            
            let hoursRemainder = daysRemainder?.truncatingRemainder(dividingBy: 60 * 60).rounded(.down)
            
            let minites  = (hoursRemainder! / 60).rounded(.down)
            
            let minitesRemainder = hoursRemainder?.truncatingRemainder(dividingBy: 60).rounded(.down)
            
            let scondes = minitesRemainder?.truncatingRemainder(dividingBy: 60).rounded(.down)
            
            
            let formatter = NumberFormatter()
            formatter.minimumIntegerDigits = 2
            let hoursNum = formatter.string(from: NSNumber(value:hours))
            let minNum = formatter.string(from: NSNumber(value:minites))
            let secNum = formatter.string(from: NSNumber(value:scondes!))
            if minNum == "05"{
                timeLeftLabel.textColor = UIColor.red
            }else{timeLeftLabel.textColor = UIColor.black}
            timeLeftLabel.text = "\(hoursNum ?? ""):\(minNum ?? ""):\(secNum ?? "")"
        } else {
            timer.invalidate()
        }
    }
    
    
    
}

