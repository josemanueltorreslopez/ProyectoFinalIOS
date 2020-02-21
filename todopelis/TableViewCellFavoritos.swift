//
//  TableViewCellFavoritos.swift
//  todopelis
//
//  Created by Antonio y Jose on 17/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TableViewCellFavoritos: UITableViewCell {
    
    @IBOutlet weak var lb_Titulo: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
