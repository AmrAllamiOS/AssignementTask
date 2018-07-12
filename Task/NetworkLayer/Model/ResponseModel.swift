//
//	SDG.swift
//
//  Created by Amr Mohamed Allam on 7/12/18.
//  Copyright © 2018 Amr Mohamed Allam. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - SDG
public struct ResponseModel: Glossy {

	public let cars : [Car]?
	public let error : Error?
	public let refreshInterval : Int?
	public let ticks : String?
	public let alertAr : String?
	public let alertEn : String?
	public let count : Int?
	public let endDate : Int?
	public let sortDirection : String?
	public let sortOption : String?



	//MARK: Decodable
	public init?(json: JSON){
		cars = "Cars" <~~ json
		error = "Error" <~~ json
		refreshInterval = "RefreshInterval" <~~ json
		ticks = "Ticks" <~~ json
		alertAr = "alertAr" <~~ json
		alertEn = "alertEn" <~~ json
		count = "count" <~~ json
		endDate = "endDate" <~~ json
		sortDirection = "sortDirection" <~~ json
		sortOption = "sortOption" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"Cars" ~~> cars,
		"Error" ~~> error,
		"RefreshInterval" ~~> refreshInterval,
		"Ticks" ~~> ticks,
		"alertAr" ~~> alertAr,
		"alertEn" ~~> alertEn,
		"count" ~~> count,
		"endDate" ~~> endDate,
		"sortDirection" ~~> sortDirection,
		"sortOption" ~~> sortOption,
		])
	}

}
