//
//  DetailViewController.swift
//  BMI Calculator Test 2
//  Created by Niraj Nepal
//  Student ID: 301211100
//

import UIKit

class DetailViewController: UIViewController {
    
    var dataList : BMIModel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var bmiField: UITextField!
    
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var updateBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}
