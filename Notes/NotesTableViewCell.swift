//
//  NotesTableViewCell.swift
//  Notes
//
//  Created by Damir Nuriev on 22.12.2022.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var noteLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }

    func set(object: Notes) {
        self.nameLabel.text = object.name
        self.noteLabel.text = object.note
    }

}
