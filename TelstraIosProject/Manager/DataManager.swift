//
//  DataManager.swift
//  TelstraIosProject
//
//  Created by Parul on 12/02/20.
//  Copyright © 2020 parul.b.mittal. All rights reserved.
//

import Foundation
import UIKit

//MARK: Telstra Exercise Data Model Manager
class DataManager: NSObject {
    
    static let urlString = "https://api.myjson.com/bins/ao19k"
    
    /// Data Parser for Telstra Ecercise
    static func loadTelstraExerciseJson(completion: ([TelstraExerciseData],String)->()) {
        if let url = URL(string: urlString){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(TelstraExerciseArray.self, from: data)
                completion(jsonData.rows, jsonData.title ?? "")
            } catch {
                print("error:\(error)")
                completion([],"")
            }
        }
    }
}

