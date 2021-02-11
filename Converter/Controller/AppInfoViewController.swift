//
//  AppInfoViewController.swift
//  Converter
//
//  Created by arta.zidele on 11/02/2021.
//

import UIKit

class AppInfoViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    var infoText = String()

    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //if !infoText.isEmpty {
            textLabel.text = infoText
        //}
    }
    

}
