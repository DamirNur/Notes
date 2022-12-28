//
//  NewNoteTableViewController.swift
//  Notes
//
//  Created by Damir Nuriev on 23.12.2022.
//

import UIKit

class NewNoteTableViewController: UITableViewController {
    
    var note = Notes(name: "", note: "")
    
    
    @IBOutlet weak var nameTextView: UITextView!
    @IBOutlet weak var noteTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    private func updateUI() {
        noteTextView.text = note.note
        nameTextView.text = note.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        let name = nameTextView.text ?? ""
        let note = noteTextView.text ?? ""
        
        self.note = Notes(name: name, note: note)
    }

}
