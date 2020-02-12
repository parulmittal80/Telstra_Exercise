//
//  TableViewController.swift
//  Telstra Exercise
//
//  Created by Parul on 11/02/20.
//  Copyright © 2020 parul.b.mittal. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Table View Controller Class
class TableViewController: UIViewController {
    
    var viewModel: TableViewModel!
    var dataSet : [TelstraExerciseData] = []
    let cellId = "tableCellId"
    var imageDownloader : TelstraDownloader?
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TableViewModel.init(responder: self)
        imageDownloader = TelstraDownloader()
        setTableView()
        viewModel.loadTelstraData()
    }
    
    func setTableView() {
        view.addSubview(tableView)
        tableView.register(TelstraExerciseCell.self, forCellReuseIdentifier: cellId)
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        addConstraintsForTableView()
    }
    
    func addConstraintsForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

//MARK:- Extension for Table View Controller
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK:- Tableview data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TelstraExerciseCell
        let currentItem = dataSet[indexPath.row]
        cell.tableViewCellTitle.text = currentItem.title
        cell.tableViewTextView.text = currentItem.description
        cell.tableViewImage.image = UIImage(named: "defaultImage")
        return cell
    }
    
    // MARK:- Tableview Delegates
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! TelstraExerciseCell
        let currentItem = dataSet[indexPath.row]
        if let imageUrl = currentItem.imageHref {
            DispatchQueue.global(qos: .default).async {
                self.imageDownloader?.checkImage(path: imageUrl, completion: { (image) in
                    DispatchQueue.main.async {
                        if tableView.cellForRow(at: indexPath) != nil {
                            cell.tableViewImage.image = image
                        }
                    }
                })
            }
        }
    }
}

extension TableViewController: Responder {
    func updateTelstraData(_ data: [TelstraExerciseData]) {
        self.dataSet = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func updateTelstraTitle(_ title: String) {
        DispatchQueue.main.async {
            self.title = title
        }
    }
}
