//
//  DataModel.swift
//  TelstraIosProject
//
//  Created by Parul on 12/02/20.
//  Copyright © 2020 parul.b.mittal. All rights reserved.
//

import Foundation
import UIKit

//MARK: Telstra Exercise Data Model
struct TelstraExerciseData : Decodable {
    var title: String?
    var description:String?
    var imageHref: String?
}
struct TelstraExerciseArray:Decodable {
    var title : String?
    var rows: [TelstraExerciseData]
}

