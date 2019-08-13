//
//  CalendarViewController.swift
//  TestCalendar
//
//  Created by Madison Kaori Shino on 8/12/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    //Properties
    var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    var currentMonth = String()
    var blankDaysAtStart = Int()
    var blankDaysAtEnd = Int()
    var previousMonthBlankDays = 0
    var nextMonthBlankDays = 0
    var direction = 0 //(0 current, -1 past, 1 future)
    var positionIndex = 0
    var leapYearCounter = 3 //two years away from current date

    //Outlets
    @IBOutlet weak var timeController: UISegmentedControl!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!
    @IBOutlet weak var modayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    @IBOutlet weak var monthView: UIView!
    @IBOutlet weak var daysView: UIView!
    @IBOutlet weak var calendarCollectionView: UICollectionView!

    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarCollectionView.dataSource = self
        calendarCollectionView.delegate = self
        currentMonth = months[month]
        setView()
        print(day, weekday, month, year)
    }

    //Actions
    @IBAction func previousMonthTapped(_ sender: Any) {
        direction = -1
        switch currentMonth {
        case "January" :
            month = 11
            year -= 1
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCollectionView.reloadData()

            if leapYearCounter > 0 {
                leapYearCounter -= 1
            }
            if leapYearCounter == 0 {
                daysInMonth[1] = 29
                leapYearCounter = 4
            } else {
                daysInMonth[1] = 28
            }
        default :
            month -= 1
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCollectionView.reloadData()
        }
        dayOnePosition()
    }

    @IBAction func nextMonthTapped(_ sender: Any) {
        direction = 1
        switch currentMonth {
        case "December" :
            month = 1
            year += 1
            currentMonth = months[0]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCollectionView.reloadData()

            if leapYearCounter < 5 {
                leapYearCounter += 1
            }
            if leapYearCounter == 4 {
                daysInMonth[1] = 29
            }
            if leapYearCounter == 5 {
                leapYearCounter = 1
                daysInMonth[1] = 28
            }
        default :
            month += 1
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCollectionView.reloadData()
        }
        dayOnePosition()
    }

    func setView() {
        dayOnePosition()
        monthLabel.text = "\(currentMonth) \(year)"
    }

    func dayOnePosition() {
        blankDaysAtStart = 0
        switch direction {
        case 0 :
            let firstDay = day % 7
            var weekdayIndex = weekday - (firstDay - 1)
            if weekdayIndex < 0 {
                weekdayIndex += 7
            }
            positionIndex = weekdayIndex - 1
            blankDaysAtStart = positionIndex
            
        case 1... :
            blankDaysAtEnd = (positionIndex + daysInMonth[month - 1]) % 7
            positionIndex = blankDaysAtEnd
        case -1 :
            previousMonthBlankDays = (7 - (daysInMonth[month] - positionIndex) % 7)
            if previousMonthBlankDays == 7 {
                previousMonthBlankDays = 0
            }
            positionIndex = previousMonthBlankDays
        default :
            fatalError()
        }
    }
}

extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch direction {
        case 0 :
            return daysInMonth[month] + blankDaysAtStart
        case 1... :
            return daysInMonth[month] + blankDaysAtEnd
        case -1 :
            return daysInMonth[month] + previousMonthBlankDays
        default :
            fatalError()
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as? DateCollectionViewCell else { return UICollectionViewCell() }
        cell.isHidden = false
        cell.symptomsIndicator.backgroundColor = UIColor.white
        cell.cycleIndicator.backgroundColor = UIColor.white
        cell.dateLabel.textColor = UIColor.black
        cell.backgroundColor = UIColor.clear
        switch direction {
        case 0 :
            cell.dateLabel.text = "\(indexPath.row + 1 - blankDaysAtStart)"
        case 1... :
            cell.dateLabel.text = "\(indexPath.row + 1 - blankDaysAtEnd)"
        case -1 :
            cell.dateLabel.text = "\(indexPath.row + 1 - previousMonthBlankDays)"
        default :
            fatalError()
        }
        if Int(cell.dateLabel.text!)! < 1 {
          cell.isHidden = true
        }
        switch indexPath.row {
        case 0,6,7,13,14,20,21,27,28,34,35 :
            if Int(cell.dateLabel.text!)! > 0 {
                cell.dateLabel.textColor = UIColor.lightGray
            }
        default :
            break
        }
        if currentMonth == months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath
            .row + 1 - blankDaysAtStart == day {
            cell.dateLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        return cell
    }
}

