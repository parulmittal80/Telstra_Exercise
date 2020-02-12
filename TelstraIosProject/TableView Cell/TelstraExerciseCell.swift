//
//  TelstraExerciseCell.swift
//  Telstra Exercise
//
//  Created by Parul on 11/02/20.
//  Copyright © 2020 parul.b.mittal. All rights reserved.
//

import UIKit

//MARK:- TableView Cell Class
class TelstraExerciseCell: UITableViewCell {
    //Mark:- TelstraExerciseCell UI Components
    
    let padding: CGFloat = 20
    let tableViewCellTitle = UILabel()
    let tableViewTextView = UITextView()
    let tableViewImage = UIImageView(image: UIImage(named: "defaultImage"))
        
    //MARK:- TableView Cell Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupTableViewCellConstraints()
    }
    
    func setupTableViewCellConstraints() {
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: 130).isActive = true
        tableViewImage.translatesAutoresizingMaskIntoConstraints = false
        tableViewImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        tableViewImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        tableViewImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
        tableViewImage.widthAnchor.constraint(equalToConstant: 130).isActive = true
        tableViewImage.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor).isActive = true
        tableViewCellTitle.translatesAutoresizingMaskIntoConstraints = false
        tableViewCellTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: padding).isActive = true
        tableViewCellTitle.leadingAnchor.constraint(equalTo: tableViewImage.trailingAnchor, constant: padding).isActive = true
        tableViewCellTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableViewTextView.translatesAutoresizingMaskIntoConstraints = false
        tableViewTextView.topAnchor.constraint(equalTo: tableViewCellTitle.bottomAnchor, constant: (padding/4)).isActive = true
        tableViewTextView.leadingAnchor.constraint(equalTo: tableViewCellTitle.leadingAnchor).isActive = true
        tableViewTextView.trailingAnchor.constraint(equalTo: tableViewCellTitle.trailingAnchor).isActive = true
        tableViewTextView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -(padding/2)).isActive = true
    }
    
    func setupUI() {
        tableViewTextView.font = UIFont.systemFont(ofSize: 16)
        tableViewTextView.isEditable = false
        tableViewTextView.isSelectable = false
        tableViewTextView.isScrollEnabled = false

        tableViewImage.contentMode = .scaleAspectFit
        tableViewImage.clipsToBounds = true
        tableViewImage.layer.masksToBounds = true
        
        addSubview(tableViewCellTitle)
        addSubview(tableViewTextView)
        addSubview(tableViewImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
