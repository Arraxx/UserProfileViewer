//
//  UserInfoDataModel.swift
//  MarketCircleAssignment
//
//  Created by Arrax on 05/03/24.
//

import Foundation

struct UserInfoDataModel : Codable, Hashable {
    var name : String
    var info : info
}

struct info : Codable, Hashable {
    var title : String
    var age : Int
    var phone : String
    var email : String
}
