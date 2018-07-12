//
//	Car.swift
//
//  Created by Amr Mohamed Allam on 7/12/18.
//  Copyright © 2018 Amr Mohamed Allam. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - Car
public struct Car: Glossy {

	public let auctionInfo : AuctionInfo?
	public let bodyAr : String?
	public let bodyEn : String?
	public let bodyId : Int?
	public let carID : Int?
	public let descriptionAr : String?
	public let descriptionEn : String?
	public let image : String?
	public let imgCount : Int?
	public let makeAr : String?
	public let makeEn : String?
	public let makeID : Int?
	public let mileage : String?
	public let modelAr : String?
	public let modelEn : String?
	public let modelID : Int?
	public let sharingLink : String?
	public let sharingMsgAr : String?
	public let sharingMsgEn : String?
	public let year : Int!



	//MARK: Decodable
	public init?(json: JSON){
		auctionInfo = "AuctionInfo" <~~ json
		bodyAr = "bodyAr" <~~ json
		bodyEn = "bodyEn" <~~ json
		bodyId = "bodyId" <~~ json
		carID = "carID" <~~ json
		descriptionAr = "descriptionAr" <~~ json
		descriptionEn = "descriptionEn" <~~ json
		image = "image" <~~ json
		imgCount = "imgCount" <~~ json
		makeAr = "makeAr" <~~ json
		makeEn = "makeEn" <~~ json
		makeID = "makeID" <~~ json
		mileage = "mileage" <~~ json
		modelAr = "modelAr" <~~ json
		modelEn = "modelEn" <~~ json
		modelID = "modelID" <~~ json
		sharingLink = "sharingLink" <~~ json
		sharingMsgAr = "sharingMsgAr" <~~ json
		sharingMsgEn = "sharingMsgEn" <~~ json
		year = "year" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"AuctionInfo" ~~> auctionInfo,
		"bodyAr" ~~> bodyAr,
		"bodyEn" ~~> bodyEn,
		"bodyId" ~~> bodyId,
		"carID" ~~> carID,
		"descriptionAr" ~~> descriptionAr,
		"descriptionEn" ~~> descriptionEn,
		"image" ~~> image,
		"imgCount" ~~> imgCount,
		"makeAr" ~~> makeAr,
		"makeEn" ~~> makeEn,
		"makeID" ~~> makeID,
		"mileage" ~~> mileage,
		"modelAr" ~~> modelAr,
		"modelEn" ~~> modelEn,
		"modelID" ~~> modelID,
		"sharingLink" ~~> sharingLink,
		"sharingMsgAr" ~~> sharingMsgAr,
		"sharingMsgEn" ~~> sharingMsgEn,
		"year" ~~> year,
		])
	}

}
