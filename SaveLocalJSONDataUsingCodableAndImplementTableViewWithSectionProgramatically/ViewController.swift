//  ViewController.swift
//  SaveJSONDataUsingCodableAndImplementTableViewWithSectionProgramatically
//  Created by Ranjeet Raushan on 09/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit
import Foundation

 
class ViewController: UIViewController {
     var result: Result?
    /* Table View Programatically - starts here */
    let tableView : UITableView = {
        let table = UITableView(frame: .zero,
                                style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
   /* Table View Programatically - ends here */
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Table View Programatically - starts here */
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        /* Table View Programatically - ends here */
        
        guard let path = Bundle.main.path(
            forResource: "local",
            ofType: "json"
            )else{ return }
        let url = URL(fileURLWithPath: path)
        do{
             
            let jsonData = try Data(contentsOf: url)
            self.result = try JSONDecoder().decode(Result.self, from: jsonData)
            print(result!)
        }
        catch{
            print("Error : \(error)")
        }
    }

}

/* Table View Programatically - starts here */
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return result?.data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = result{
            return result.data?[section].items?.count ?? 0
        }
        return 0
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = result?.data?[indexPath.section].items?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model
        return cell
       }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return result?.data?[section].title
    }
}
 /* Table View Programatically - ends here */
