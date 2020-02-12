//
//  TableViewModel.swift
//  Telstra Exercise
//
//  Created by Parul on 11/02/20.
//  Copyright © 2020 parul.b.mittal. All rights reserved.
//

import UIKit

/// Responder to satify mvvm pattern
protocol Responder {
    func updateTelstraData(_ data: [TelstraExerciseData])
    func updateTelstraTitle(_ title: String)
}

/// View Model for the Telstra Table view
class TableViewModel {
    let responder: Responder
    init(responder: Responder) {
        self.responder = responder
    }
    
    func loadTelstraData() {
        DataManager.loadTelstraExerciseJson(completion: { (dataSet, title) in
            responder.updateTelstraData(dataSet.filter( { $0.title != nil }))
            responder.updateTelstraTitle(title)
        })
    }
}
