//
//  DateViewController.swift
//  TestCalendar
//
//  Created by Madison Kaori Shino on 9/18/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    var date: Date?
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        load()
    }

    func load() {
        guard let date = date else { return }
        dateLabel.text = date.prettyDate()
    }
}
