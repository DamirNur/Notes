//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Damir Nuriev on 22.12.2022.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    var objects = [Notes(name: "Purchases", note: "Coffee, tea, butter")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Notes"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        let sourceVC = segue.source as! NewNoteTableViewController
        let note = sourceVC.note
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            objects[selectedIndexPath.row] = note
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        } else {
            let newIndexPath = IndexPath(row: objects.count, section: 0)
            objects.append(note)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "editNote" else { return }
        let indexPath = tableView.indexPathForSelectedRow!
        let note = objects[indexPath.row]
        let navigationVC = segue.destination as! UINavigationController
        let newNoteVC = navigationVC.topViewController as! NewNoteTableViewController
        newNoteVC.note = note
        newNoteVC.title = "Edit"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath) as! NotesTableViewCell
        let object = objects[indexPath.row]
        cell.set(object: object)

        return cell
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedNote = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedNote, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
}
