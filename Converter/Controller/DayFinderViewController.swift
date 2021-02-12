//
//  ViewController.swift
//  Converter
//
//  Created by arta.zidele on 11/02/2021.
//

import UIKit

class DayFinderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func findWeekDayTapped(_ sender: Any) {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!) else {
            warningPopup(withTitle: "Input Error", withMessage: "Please enter the correct Date.")
            return
        }
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        guard let date = calendar.date(from: dateComponents) else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_En")
        dateFormatter.dateFormat = "EEEE"
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                let weekday = dateFormatter.string(from: date)
                let capitalizedWeekday = weekday.capitalized
                resultLabel.text = capitalizedWeekday
            } else {
                warningPopup(withTitle: "Wrong Date!", withMessage: "Please enter the correct Date!")
            }
        default:
        findButton.setTitle("Find", for: .normal)
        clearAllTextFields()
        }
    }
    
    func clearAllTextFields() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Write a date and press the button!"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func warningPopup(withTitle title: String?, withMessage message: String?) {
        let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        popUp.addAction(okButton)
        self.present(popUp, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dayInfo" {
            // Get the new view controller using segue.destination.
            let vc = segue.destination as! AppInfoViewController
            // Pass the selected object to the new view controller.
            vc.infoText = "Day Finder helps to find exact weekday for given date."
        }
        
    }


}

