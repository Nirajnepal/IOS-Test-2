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

    // Action for the submit button
    @IBAction func submitButtonTapped(_ sender: Any) {
        // Get the user's name, age, weight, and height
        let name = nameField.text
        let age = ageField.text
        let gender = genderField.text
        let weight = weightField.text
        let height = heightField.text

        // Convert the weight and height to double values
        let weightDouble = Double(weight!)
        let heightDouble = Double(height!)

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

        // Update the BMI label with the calculated value
        bmiLabel.text = "Your BMI: \(bmi)"

        // Determine the BMI status based on the calculated value
        var status = ""
        if bmi < 18.5 {
            status = "Underweight"
        } else if bmi < 25.0 {
            status = "Normal"
        } else if bmi < 30.0 {
            status = "Overweight"
        } else {
            status = "Obese"
        }

        // Update the status label with the determined status
        statusLabel.text = "Your status: \(status)"
    }

}

