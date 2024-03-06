//
//  AddNewUserData.swift
//  MarketCircleAssignment
//
//  Created by Arrax on 06/03/24.
//

import Foundation

class AddNewUserData {
    
    static var shared : AddNewUserData = AddNewUserData()
    
    private init() {}
    
    func writeDataToFile(data: UserInfoDataModel) -> Bool{
        print(data)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let jsonData = try encoder.encode(data)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let fileURL = documentsURL.appendingPathComponent("JSONDataFile.json")
                try jsonString.write(to: fileURL, atomically: true, encoding: .utf8)
                print("Data written to file successfully.")
                return true
            }
        } catch {
            print("Error encoding data: \(error.localizedDescription)")
        }
        return false
    }
}
