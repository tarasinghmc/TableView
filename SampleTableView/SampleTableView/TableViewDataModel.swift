//
//  TableViewDataModel.swift
//  SampleTableView
//
//  Created by Tara Singh M C on 04/05/19.
//  Copyright © 2019 Tara Singh. All rights reserved.
//

import UIKit

enum SectionType {
    case selected
    case more
}

struct Item {
    var name: String
    var isPushEnabled: Bool
    
    init(name: String, isPushEnabled: Bool = false) {
        
        self.name = name
        self.isPushEnabled = isPushEnabled
        
    }
}

struct Section {
    var type: SectionType
    var headerTitle: String
    var subheaderTitle: String
    var items = [Item]()
    
    init(type: SectionType, headerTitle: String, subheaderTitle: String, items: [Item]) {
        
        self.type = type
        self.headerTitle = headerTitle
        self.subheaderTitle = subheaderTitle
        self.items = items
    }
}

class TableViewDataModel: NSObject, UITableViewDelegate, UITableViewDataSource {
  
    lazy var sections: [Section] = {
        let sections = self.createDefaultSectionsArray()
        return sections
    }()
    
    override init() {
        super.init()
    
    }
    
    func createDefaultSectionsArray() -> [Section] {
        
        // Selected Section
        let selectedSection = Section(type: .selected, headerTitle: "Selected Countries", subheaderTitle: "Show description", items: [Item(name: "India") , Item(name: "USA"), Item(name: "UK"), Item(name: "Japan")])
        
        // More
        let moreSection = Section(type: .more, headerTitle: "", subheaderTitle: "More Countries", items: [Item(name: "Chain"), Item(name: "Korea")])
        
        return [selectedSection, moreSection]
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
            cell?.indexPath = indexPath
            cell?.delegate = self
            cell?.nameLabel.text = self.sections[indexPath.section].items[indexPath.row].name
            cell?.pushSwitch.isOn = self.sections[indexPath.section].items[indexPath.row].isPushEnabled
            //        let checkBoxButton = UIButton.init(frame:CGRect(x: 0, y: 0, width: 40, height: 32))
            //        checkBoxButton.backgroundColor = .red
            //            checkBoxButton.setTitle("0", for: .normal)
            //        checkBoxButton.setTitle("√", for: .selected)
            //        checkBoxButton.addTarget(self, action: #selector(checkBoxButtonPressed(_:)), for: .touchUpInside)
            //
            //
            //       cell?.editingAccessoryType = .checkmark
            //        cell?.editingAccessoryView = checkBoxButton
       
            return cell!
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as? MoreTableViewCell
        cell?.indexPath = indexPath
        cell?.delegate = self
        cell?.nameLabel.text = self.sections[indexPath.section].items[indexPath.row].name
        cell?.pushSwitch.isOn = self.sections[indexPath.section].items[indexPath.row].isPushEnabled
        
        return cell!
    }
    
    @objc func checkBoxButtonPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
   
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let obj = sections[section]
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewHeaderFooterView") as? TableViewHeaderFooterView
        headerView?.headerLabel.text = obj.headerTitle
        headerView?.subheaderLabel.text = obj.subheaderTitle
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.section == 0 {
//            return true
//        }
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
        
        if editingStyle == .insert {
            
            let item = self.sections[indexPath.section].items[indexPath.row]
            
            self.sections[indexPath.section].items.remove(at: indexPath.row)
            
            self.sections[0].items.append(item)
            
            tableView.reloadData()
        }
        
        //tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Remove") { (action, indexPath) in
            // delete item at indexPath
            let item = self.sections[indexPath.section].items[indexPath.row]
            
            self.sections[indexPath.section].items.remove(at: indexPath.row)
            
            self.sections[1].items.append(item)
            
            tableView.reloadData()
          
        }

        
        return [delete]
    }
    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return indexPath.section == 0 ? .delete : .insert
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        
        return false
    }
}

extension TableViewDataModel: TableViewCellDelegate {
   
    func didPushSwitchValueChaged(_ state: Bool, at indexPath: IndexPath) {
        
        var item = sections[indexPath.section].items[indexPath.row]
        item.isPushEnabled = state
        
        sections[indexPath.section].items[indexPath.row] = item
    }
    
    
}
