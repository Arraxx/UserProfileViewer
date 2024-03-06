//
//  JSONLoader.swift
//  MarketCircleAssignment
//
//  Created by Arrax on 05/03/24.
//

import Foundation

class JSONLoader : ObservableObject {
    
    @Published var userInfoData: [UserInfoDataModel] = [UserInfoDataModel]()
    
    func loadData() {
        if let path = Bundle.main.url(forResource: "JSONDataFile", withExtension: "json") {
            print(path)
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                self.userInfoData = try decoder.decode([UserInfoDataModel].self, from: data)
            } catch {
                print("Error loading data: \(error.localizedDescription)")
            }
        }
    }
}
