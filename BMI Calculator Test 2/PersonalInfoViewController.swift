//
//  PersonalInfoViewController.swift
//  BMI Calculator Test 2
//  Created by Niraj Nepal
//  Student ID: 301211100
//

import UIKit

class PersonalInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var bmiTable: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var data = [BMIModel]()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiTable.dataSource = self
        bmiTable.delegate = self
        bmiTable.separatorInset = bmiTable.layoutMargins
        fetchRecord()
    }
    
    func fetchRecord(){
        do{
            self.data =  try context.fetch(BMIModel.fetchRequest())
            self.bmiTable.reloadData()
        }catch{
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bmiTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let bmiRecord: BMIModel!
        bmiRecord = data[indexPath.row]

        cell.nameLabel.text = bmiRecord.name!
        cell.dateLabel.text = bmiRecord.date!
        cell.timeLabel.text = bmiRecord.time!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bmiRecord: BMIModel!
        bmiRecord = self.data[indexPath.row]
        performSegue(withIdentifier: "detailView", sender: bmiRecord)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            if let data = sender as? BMIModel {
                detailViewController.dataList = data
            }
        }
    }
    
    //swiping right to left to delete the items in the table
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let bmiRecord: BMIModel!
            bmiRecord = self.data[indexPath.row]
            self.context.delete(bmiRecord)
            
            do{
                try self.context.save()
            }
            catch{
                print("Error")
            }
            self.data.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }

}
