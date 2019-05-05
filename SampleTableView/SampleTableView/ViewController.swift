//
//  ViewController.swift
//  SampleTableView
//
//  Created by Tara Singh M C on 04/05/19.
//  Copyright © 2019 Tara Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataModel: TableViewDataModel = {
        return TableViewDataModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
          tableView.register(UINib(nibName: "MoreTableViewCell", bundle: nil), forCellReuseIdentifier: "MoreTableViewCell")
        
        tableView.register(UINib.init(nibName: "TableViewHeaderFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TableViewHeaderFooterView")
        
        tableView.delegate = dataModel
        tableView.dataSource = dataModel
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 600
        tableView.setEditing(true, animated: true)

        tableView.reloadData()
        
        
    }


}

