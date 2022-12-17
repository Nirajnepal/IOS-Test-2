//
//  AppDelegate.swift
//  BMI Calculator Test 2
//
//  Created by Niraj Nepal
//  Student ID: 301211100
//

import UIKit

class ViewController: UIViewController {

    // Outlets for the text fields
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var unitsControl: UISegmentedControl!

    // Outlets for the labels
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // Action for the submit button
    @IBAction func submitButtonTapped(_ sender: Any) {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "MMM d yyyy"
        
        // Get the user's name, age, weight, and height
        let name = nameField.text!
        let age = ageField.text!
        let gender = genderField.text!
        let weight = weightField.text
        let height = heightField.text
    
        // Convert the weight and height to double values
        let weightDouble = Double(weight!)
        let heightDouble = Double(height!)

        if(name.isEmpty || age.isEmpty || gender.isEmpty){
            showToast(message: "Pleas enter your general info")
        }else if(height!.isEmpty || weight!.isEmpty){
            showToast(message: "Height and weight missing")
        }
        else{
            // Calculate the BMI based on the selected units
            var bmi: Double = 0
            if unitsControl.selectedSegmentIndex == 0 {
                // Imperial units: BMI = weight (lb) / height (in)^2 * 703
                bmi = weightDouble! / (heightDouble! * heightDouble!) * 703
            } else {
                // Metric units: BMI = weight (kg) / height (m)^2
                bmi = weightDouble! / (heightDouble! * heightDouble!)
            }

            // Round the BMI to one decimal place
            bmi = round(bmi * 10) / 10
            
            showBMI(bmi:bmi)
            modelValue(bmi, formatter3, date, hour, minutes)
        }
    }
    
    func showBMI(bmi: Double){
        // Update the BMI label with the calculated value
        bmiLabel.text = "Your BMI: \(bmi)"

        // Determine the BMI status based on the calculated value
        var status = ""
        if bmi < 16 {
            status = "Severe Thinness"
        } else if bmi >= 17 && bmi <= 16 {
            status = "Moderate Thinness"
        } else if  bmi >= 17 && bmi <= 18.5 {
            status = "Mild Thinness"
        } else if  bmi >= 18.5 && bmi <= 25 {
            status = "Normal"
        } else if bmi >= 25 && bmi <= 30  {
            status = "Overweight"
        } else if  bmi >= 30  && bmi <= 35 {
            status = "Obese Class I"
        } else if  bmi >= 35 && bmi <= 40 {
            status = "Obese Class II"
        } else {
            status = "Obese Class III"
        }
        
        // Update the status label with the determined status
        statusLabel.text = "Your BMI status is: \(status)"
    }
    
    func modelValue(_ bmi: Double, _ formatter3: DateFormatter, _ date: Date, _ hour: Int, _ minutes: Int) {
            let bmiModel = BMIModel(context: self.context)
            
            bmiModel.name = nameField.text
            bmiModel.age = ageField.text
            bmiModel.gender = genderField.text
            bmiModel.bmi = String(format: "%.1f", bmi)
            bmiModel.weight = weightField.text
            bmiModel.height = heightField.text
            bmiModel.date = formatter3.string(from: date)
            bmiModel.time = String(hour) + " : " +  String(minutes)
            self.saveData()
        }
    func saveData() {
            do
            {
                try self.context.save()
    //            let _ = try self.context.fetch(Note.fetchRequest())
            }
            catch {
                print("Error")
            }
        }
}

extension ViewController {
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 125, y: self.view.frame.size.height-100, width: 250, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.textAlignment = .center;
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                 toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
    }
}

