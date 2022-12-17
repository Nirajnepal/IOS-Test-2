//
//  PersonalInfoViewController.swift
//  BMI Calculator Test 2
//
//  Created by Niraj Nepal on 15/12/2022.
//

import UIKit

class PersonalInfoViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!

    struct User{
        let name: String
        let date: String
        let time: String
    }
    
    let data: [User] = [
        User(name: "Jane Doe", date:"2022-12-25", time:"17:00 PM"),
        User(name: "Jane Geda", date:"2022-12-25", time:"17:00 PM"),
        User(name: "Jane MUJI", date:"2022-12-25", time:"17:00 PM"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
          
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.nameLabel.text = user.name
        cell.dateLabel.text = user.date
        cell.timeLabel.text = user.time
        return cell
    }

}
