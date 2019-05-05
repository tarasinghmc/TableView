//
//  TableViewCell.swift
//  SampleTableView
//
//  Created by Tara Singh M C on 04/05/19.
//  Copyright © 2019 Tara Singh. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate: class {
    func didPushSwitchValueChaged(_ state: Bool, at indexPath: IndexPath)
}

class TableViewCell: UITableViewCell {
    
    var indexPath: IndexPath!
    var delegate: TableViewCellDelegate?
    var isSelect: Bool = true
    @IBAction func pushSwitchValueChanged(_ sender: UISwitch) {
        delegate?.didPushSwitchValueChaged(sender.isOn, at: indexPath)
    }
    
    @IBOutlet weak var pushSwitch: UISwitch!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    /* override func  layoutSubviews() {
     super.layoutSubviews()
     
     let vComp = UIDevice.current.systemVersion.components(separatedBy: ".")
     
     if Int(vComp[0]) ?? 0 <= 7 {
     for subview in self.subviews {
     for subsubview in subview.subviews {
     
     if (subsubview.description.contains("UITableViewCellEditControl"))
     {
     if(isSelect == true)
     {
     subsubview.tintColor = UIColor.green
     self.selectedBackgroundView?.backgroundColor = .clear
     }
     }
     }
     }
     }
     else if (Int(vComp[0]) ?? 0 >= 8)
     {
     for subsubview in self.subviews
     {
     if (subsubview.description.contains("UITableViewCellEditControl"))
     {
     if(isSelect == true)
     {
     subsubview.tintColor = UIColor.green
     self.selectedBackgroundView?.backgroundColor = .clear
     }
     }
     }
     }
     }*/
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            
            for view in subviews where
                view.description.contains("UITableViewCellEditControl") {
                    
                    for case let subview as UIImageView in view.subviews {
                        subview.isHidden = true
                        //subview.image = UIImage(named: "trash")
                    }
            }
            
        }
    }
    
    /*   override func layoutSubviews() {
     super.layoutSubviews()
     for view in subviews where
     view.description.contains("UITableViewCellEditControl") {
     
     for case let subview as UIImageView in view.subviews {
     subview.isHidden = true
     //  subview.image = UIImage(named: "trash")
     }
     }
     
     for view in subviews where
     view.description.contains("UITableViewCellReorderControl") {
     
     for case let subview as UIImageView in view.subviews {
     subview.isHidden = true
     //  subview.image = UIImage(named: "trash")
     }
     }
     
     //UITableViewCellReorderControl
     
     //        for view in subviews where
     //            view.description.contains("UITableViewCellEditControl") {
     //
     //                for case let subview as UIImageView in view.subviews {
     //
     //                    subview.image = UIImage(named: "trash")
     //                }
     //        }
     
     //        for subview in self.subviews as [UIView] {
     //
     //            if subview is UITableViewCellDeleteConfirmationControl {
     //
     //                // do magic here
     //
     //
     //            } else if subview is UITableViewCellEditControl {
     //
     //                // do magic here
     //
     //
     //            } else if subview is UITableViewCellReorderControl {
     //
     //                // do magic here
     //            }
     //        }
     }*/
    
}


