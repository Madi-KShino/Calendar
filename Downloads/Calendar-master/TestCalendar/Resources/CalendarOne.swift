//
//  CalendarOne.swift
//  TestCalendar
//
//  Created by Madison Kaori Shino on 8/13/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
//
//class CalendarViewController: UIViewController {
//    
//    //Properties
//    var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
//    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
//    var daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
//    var currentMonthIndex = month - 1
//    var currentYear = year
//    var firstWeekdayOfMonth = 0
//    var monthBeingViewed = 0
//    
//    //Outlets
//    @IBOutlet weak var timeController: UISegmentedControl!
//    @IBOutlet weak var previousButton: UIButton!
//    @IBOutlet weak var nextButton: UIButton!
//    @IBOutlet weak var monthLabel: UILabel!
//    @IBOutlet weak var sundayLabel: UILabel!
//    @IBOutlet weak var modayLabel: UILabel!
//    @IBOutlet weak var tuesdayLabel: UILabel!
//    @IBOutlet weak var wednesdayLabel: UILabel!
//    @IBOutlet weak var thursdayLabel: UILabel!
//    @IBOutlet weak var fridayLabel: UILabel!
//    @IBOutlet weak var saturdayLabel: UILabel!
//    @IBOutlet weak var monthView: UIView!
//    @IBOutlet weak var daysView: UIView!
//    @IBOutlet weak var calendarCollectionView: UICollectionView!
//    
//    //Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        calendarCollectionView.dataSource = self
//        calendarCollectionView.delegate = self
//    }
//    
//    //Actions
//    @IBAction func previousMonthTapped(_ sender: Any) {
//        currentMonthIndex -= 1
//        if currentMonthIndex < 0 {
//            currentMonthIndex = 11
//            currentYear -= 1
//        }
//        monthBeingViewed = currentMonthIndex + 1
//        monthLabel.text = "\(months[currentMonthIndex]) \(currentYear)"
//    }
//    
//    @IBAction func nextMonthTapped(_ sender: Any) {
//        currentMonthIndex += 1
//        if currentMonthIndex > 11 {
//            currentMonthIndex = 0
//            currentYear += 1
//        }
//        monthBeingViewed = currentMonthIndex + 1
//        monthLabel.text = "\(months[currentMonthIndex]) \(currentYear)"
//    }
//    
//    func setView() {
//        monthBeingViewed = currentMonthIndex + 1
//        monthLabel.text = "\(months[currentMonthIndex]) \(currentYear)"
//    }
//    
//    func initializeMonthView() {
//        firstWeekdayOfMonth = getFirstWeekDay(month: monthBeingViewed, year: currentYear)
//        monthBeingViewed = currentMonthIndex
//    }
//    
//    func getFirstWeekDay(month: Int, year: Int) -> Int {
//        var firstWeekday = 1
//        var dateComponents = DateComponents()
//        dateComponents.month = month
//        dateComponents.year = year
//        dateComponents.day = 1
//        if let firstOfMonth = Calendar.current.date(from: dateComponents) {
//            firstWeekday = calendar.component(.weekday, from: firstOfMonth)
//        }
//        return firstWeekday
//    }
//    
//    func didChangeMonth(monthIndex: Int, year: Int) {
//        currentMonthIndex = monthIndex + 1
//        currentYear = year
//        firstWeekdayOfMonth = getFirstWeekDay(month: currentMonthIndex, year: currentYear)
//        calendarCollectionView.reloadData()
//    }
//}
//
//extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return daysInMonth[currentMonthIndex] + firstWeekdayOfMonth - 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as? DateCollectionViewCell else { return UICollectionViewCell() }
//        cell.backgroundColor = UIColor.white
//        cell.dateLabel.textColor = UIColor.black
//        cell.cycleIndicator.backgroundColor = UIColor.white
//        cell.symptomsIndicator.backgroundColor = UIColor.white
//        if indexPath.item <= firstWeekdayOfMonth - 2 {
//            cell.backgroundColor = UIColor.lightGray
//            cell.dateLabel.textColor = UIColor.white
//            cell.cycleIndicator.backgroundColor = UIColor.lightGray
//            cell.symptomsIndicator.backgroundColor = UIColor.lightGray
//        } else {
//            let calcDate = indexPath.row - firstWeekdayOfMonth + 2
//            cell.dateLabel.text =
//        }
//        return cell
//    }
//}
//
