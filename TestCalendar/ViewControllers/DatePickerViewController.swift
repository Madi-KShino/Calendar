//
//  DatePickerViewController.swift
//  TestCalendar
//
//  Created by Madison Kaori Shino on 8/12/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    //Outlets
    @IBOutlet weak var datePickerView: UIPickerView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var cycleDayLabel: UILabel!
    @IBOutlet weak var symptomsLabel: UILabel!
    @IBOutlet weak var symptomsListLabel: UILabel!
    @IBOutlet weak var addSymptomsButton: UIButton!
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Helper Functions
    func populatePickerData() {
//        let month = Date().timeIntervalSince(<#T##date: Date##Date#>)
    }
}
