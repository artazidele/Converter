//
//  AppearanceViewController.swift
//  Converter
//
//  Created by arta.zidele on 11/02/2021.
//

import UIKit

class AppearanceViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var buttonText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
    }
    
    @IBAction func openSettingsButtonTapped(_ sender: Any) {
        openSettings()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setLabelText() {
        var text = "Unable to specify UI Style"
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark Mode is on. \n Go to settings if you would like \n to change to Light Mode"
            textLabel.textColor = .white
            //buttonText.backgroundColor = .white
        } else {
            text = "Light Mode is on. \n Go to settings if you would like \n to change to Dark Mode"
            textLabel.textColor = .black
            //buttonText.backgroundColor = .systemPink
        }
        textLabel.text = text
    }
    func openSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsURL) {
            UIApplication.shared.open(settingsURL, options: [:]) { (success) in
                print("open: ", success)
            }
        }
    }

}
    
