//
//  ViewController.swift
//  TableViewCellTest
//
//  Created by Mike Kralitschek on 23.04.23.
//

import UIKit

class ViewController: UIViewController {
    
    struct Item {
        let name: String
        let gewicht: Int32
        let eingepackt: Bool
        let anzahl: Int32
        
        init(name: String, gewicht: Int32, eingepackt: Bool, anzahl: Int32) {
            self.name = name
            self.gewicht = gewicht
            self.eingepackt = eingepackt
            self.anzahl = anzahl
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    var myArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        myArray.append(Item(name: "Koffer", gewicht: 25, eingepackt: true, anzahl: 2))
        myArray.append(Item(name: "Fahrrad", gewicht: 30, eingepackt: true, anzahl: 1))
        
        print(myArray)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        let row = indexPath.row
        cell.label1.text = myArray[row].name
        cell.label2.text = "\(String(myArray[row].gewicht)) kg"
        cell.label3.text = "Anzahl: \(String(myArray[row].anzahl))"
        return cell
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            myArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myArray[indexPath.row].name)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Erstellen einer neuen Aktion mit einem Titel und einer Hintergrundfarbe
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, view, completionHandler) in
            // Fügen Sie hier den Code ein, um den Artikel zu löschen
            print("Löschen")
            completionHandler(true)
        }
        
        // Ändern der Farbe des Löschen-Buttons
        deleteAction.backgroundColor = .red
        deleteAction.image = UIImage(systemName: "trash.fill")
        
        // Erstellen einer neuen Aktion mit einem Titel und einer Hintergrundfarbe
        let editAction = UIContextualAction(style: .normal, title: nil) { (action, view, completionHandler) in
            // Fügen Sie hier den Code ein, um den Artikel zu archivieren
            completionHandler(true)
        }
        
        // Ändern der Farbe des Archivierungs-Buttons
        editAction.backgroundColor = .orange
        editAction.image = UIImage(systemName: "slider.horizontal.3")
        
        // Erstellen einer Swipe-Actions-Konfiguration mit den Aktionen
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        
        // Rückgabe der Swipe-Actions-Konfiguration
        return configuration
    }

}
