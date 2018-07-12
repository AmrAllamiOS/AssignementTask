//
//	AuctionInfo.swift
//
//  Created by Amr Mohamed Allam on 7/12/18.
//  Copyright © 2018 Amr Mohamed Allam. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - AuctionInfo
public struct AuctionInfo: Glossy {

	public let vATPercent : Int!
	public let bids : Int!
	public let currencyAr : String!
	public let currencyEn : String!
	public let currentPrice : Int!
	public let endDate : Int!
	public let endDateAr : String!
	public let endDateEn : String!
	public let iCarId : Int!
	public let iVinNumber : String!
	public let isModified : Int!
	public let itemid : Int!
	public let lot : Int!
	public let minIncrement : Int!
	public let priority : Int!



	//MARK: Decodable
	public init?(json: JSON){
		vATPercent = "VATPercent" <~~ json
		bids = "bids" <~~ json
		currencyAr = "currencyAr" <~~ json
		currencyEn = "currencyEn" <~~ json
		currentPrice = "currentPrice" <~~ json
		endDate = "endDate" <~~ json
		endDateAr = "endDateAr" <~~ json
		endDateEn = "endDateEn" <~~ json
		iCarId = "iCarId" <~~ json
		iVinNumber = "iVinNumber" <~~ json
		isModified = "isModified" <~~ json
		itemid = "itemid" <~~ json
		lot = "lot" <~~ json
		minIncrement = "minIncrement" <~~ json
		priority = "priority" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"VATPercent" ~~> vATPercent,
		"bids" ~~> bids,
		"currencyAr" ~~> currencyAr,
		"currencyEn" ~~> currencyEn,
		"currentPrice" ~~> currentPrice,
		"endDate" ~~> endDate,
		"endDateAr" ~~> endDateAr,
		"endDateEn" ~~> endDateEn,
		"iCarId" ~~> iCarId,
		"iVinNumber" ~~> iVinNumber,
		"isModified" ~~> isModified,
		"itemid" ~~> itemid,
		"lot" ~~> lot,
		"minIncrement" ~~> minIncrement,
		"priority" ~~> priority,
		])
	}

}
