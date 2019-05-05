//
//  MoreTableViewCell.swift
//  SampleTableView
//
//  Created by Tara Singh M C on 05/05/19.
//  Copyright © 2019 Tara Singh. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

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
    
}
