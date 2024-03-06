//
//  MarketCircleAssignmentTests.swift
//  MarketCircleAssignmentTests
//
//  Created by Arrax on 06/03/24.
//

import XCTest

final class MarketCircleAssignmentTests: XCTestCase {
    
    func checkCanBeAdded(){
        let objUser : UserInfoDataModel = UserInfoDataModel(name: "Name", info: info(title: "Dr.", age: 50, phone: "7586980809", email: "someemail.gmail.com"))
        let actual = AddNewUserData.shared.writeDataToFile(data: objUser)
        let final = true
        
        XCTAssertEqual(actual, final)
    }

}
