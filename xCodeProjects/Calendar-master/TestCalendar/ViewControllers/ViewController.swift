//
//  ViewController.swift
//  TestCalendar
//
//  Created by Madison Kaori Shino on 8/12/19.
//  Copyright © 2019 Madi S. All rights reserved.
//
//
//import Foundation
//import UIKit
//
//class HomeController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
//
//    @IBOutlet weak var taskTypePicker: UIPickerView!
//    @IBOutlet weak var playButton: UIButton!
//
//    let pickerDataSource = [
//        "Adding012",
//        "Adding34"
//    ]
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//
//        let playImage = UIImage(named: "PlayButton")!
//        self.playButton.setImage(playImage, for: .normal)
//        self.playButton.tintColor = UIColor.red
//        self.playButton.frame = CGRect(x: 0, y: 0, width: 200, height: 117)
//
//        self.taskTypePicker.dataSource = self
//        self.taskTypePicker.delegate = self
//
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        let selected = UserDefaultsManager.loadSelectedTaskType()
//        let selectedIndex = pickerDataSource.index(of: selected)
//        if (selectedIndex != nil) {
//            taskTypePicker.selectRow(selectedIndex!, inComponent: 0, animated: true)
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    @IBAction func playPressed(_ sender: AnyObject) {
//        print("Play Clicked")
//    }
//
//    @available(iOS 2.0, *)
//    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return pickerDataSource.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let myView = UIView(frame: CGRect(x: 0, y: 0, width:pickerView.bounds.width - 30, height: 60))
//
//        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 220, height: 61))
//
//        //var rowString = String()
//
//        myImageView.image = UIImage(named: pickerDataSource[row])
//
//        //let myLabel = UILabel(frame: CGRect(x: 60, y:0, width: pickerView.bounds.width - 90, height: 60 ))
//        //myLabel.font = UIFont(name:some font, size: 18)
//        //myLabel.text = rowString
//
//        //myView.addSubview(myLabel)
//        myView.addSubview(myImageView)
//
//        return myView
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pickerDataSource[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print("pickerView selected")
//        UserDefaultsManager.saveSelectedTaskType(pickerDataSource[row])
//    }
//}
