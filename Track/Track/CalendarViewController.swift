//
//  ViewController.swift
//  Track
//
//  Created by Daniel Williams on 11/7/21.
//  Copyright © 2021 Daniel Williams. All rights reserved.
//

import UIKit
import Parse

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var totalSquares = [String]()
    var loadedTasks = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
    }
    
    func setCellsView() {
        let width = (CollectionView.frame.size.width - 2) / 8
        let height = (CollectionView.frame.size.height - 2) / 8
        
        let flowLayout = CollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }

    func setMonthView() {
        totalSquares.removeAll()
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        
        var count: Int = 1
        
        while (count <= 42){
            if (count <= startingSpaces || count - startingSpaces > daysInMonth){
                totalSquares.append("")
            } else {
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
        }
        
        monthLabel.text = CalendarHelper().monthString(date: selectedDate)+" "+CalendarHelper().yearString(date: selectedDate)
        CollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        
        cell.dayOfMonth.text = totalSquares[indexPath.item]
        if(totalSquares[indexPath.item] == "16"){
            cell.taskCircle.isHidden = false
        }
        else {
            cell.taskCircle.isHidden = true
        }

        // TODO Make circles appear for proper months and not for every month
//        let query = PFQuery(className: "Task")
//        query.whereKey("dateNum", equalTo: totalSquares[indexPath.item])
//
//        do{
//            let results = try query.findObjects()
//
//            if(results.count > 0){
//                print("a")
//            }
//        }
//        catch{
//            print(Error.self)
//        }

        return cell
    }
    
    @IBAction func prevMonth(_ sender: Any) {
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        setMonthView()
    }
    
    @IBAction func nextMonth(_ sender: Any) {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
}

