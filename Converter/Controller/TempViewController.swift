//
//  TempViewController.swift
//  Converter
//
//  Created by arta.zidele on 11/02/2021.
//

import UIKit

class TempViewController: UIViewController {
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var tempSlider: UISlider!
    @IBOutlet weak var convertedTempLabel: UILabel!
    @IBOutlet weak var tempSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tempSliderChanged(_ sender: UISlider, forEvent event: UIEvent) {
        print(sender.value)
        updateTempSliderLabel(value: sender.value)
    }
    
    @IBAction func tempSegmentControlChanged(_ sender: UISegmentedControl) {
    }
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double) {
        let fahrenheit = (Double(celsius) * 9 / 5) + 32
        let kelvin = Double(celsius) + 273.15
        
        return(fahrenheit, kelvin)
    }
    
    func updateTempSliderLabel(value: Float) {
        let celsiumTemp = Int(value)
        celsiusLabel.text = "\(celsiumTemp) ° C"
        
        var tempString = ""
        switch tempSegmentControl.selectedSegmentIndex {
        case 0:
            let fahrenheitTempString = String(format: "%.2F", convertTempFrom(celsius: celsiumTemp).fahrenheit)
            tempString = fahrenheitTempString + " ° F"
        default:
            let kelvinTempString = String(format: "%.2F", convertTempFrom(celsius: celsiumTemp).kelvin)
            tempString = kelvinTempString + " ° K"
        }
        
        convertedTempLabel.text = tempString
        
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
    }
    
}
