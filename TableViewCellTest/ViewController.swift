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
        cell.label2.text = String(myArray[row].gewicht)
        cell.label3.text = String(myArray[row].anzahl)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myArray[indexPath.row].name)
    }
}
