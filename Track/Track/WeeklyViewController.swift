//
//  ViewController.swift
//  Track
//
//  Created by Daniel Williams on 11/7/21.
//  Copyright © 2021 Daniel Williams. All rights reserved.
//

import UIKit
import Parse

var selectedDate = Date()

class WeeklyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var eventsView: UITableView!
    
    var totalSquares = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsList = []
        let query = PFQuery(className:"Task")
        query.findObjectsInBackground { (results: [PFObject]?, error: Error?) in
            for result in results ?? []{
                let newEvent = Event()
                
                newEvent.id = eventsList.count
                newEvent.name = result["taskDeliverable"] as! String
                newEvent.date = result["dueDate"] as! Date
                eventsList.append(newEvent)
            }
        }
        setCellsView()
        setWeekView()
    }
    
    func setCellsView() {
        let width = (CollectionView.frame.size.width - 2) / 8
        let height = (CollectionView.frame.size.height - 2)
        
        let flowLayout = CollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }

    func setWeekView() {
        totalSquares.removeAll()
        
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        
        while (current < nextSunday){
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        
        monthLabel.text = CalendarHelper().monthString(date: selectedDate)+" "+CalendarHelper().yearString(date: selectedDate)
        CollectionView.reloadData()
        eventsView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        
        let date = totalSquares[indexPath.item]
        cell.dayOfMonth.text = String(CalendarHelper().dayOfMonth(date: date))
        if(String(CalendarHelper().dayOfMonth(date: date)) == "16"){
            cell.taskCircle.isHidden = false
        }
        else {
            cell.taskCircle.isHidden = true
        }
        
        if (date == selectedDate){
            cell.backgroundColor = UIColor.systemOrange
        }
        else {
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = totalSquares[indexPath.item]
        collectionView.reloadData()
        eventsView.reloadData()
    }
    
    @IBAction func prevWeek(_ sender: Any) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)
        setWeekView()
    }
    
    @IBAction func nextWeek(_ sender: Any) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setWeekView()
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event().eventsForDate(date: selectedDate).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! EventTableViewCell
        let event = Event().eventsForDate(date: selectedDate)[indexPath.row]
        cell.eventLabel.text = event.name+" "+CalendarHelper().timeString(date: event.date)
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        eventsView.reloadData()
    }
}

