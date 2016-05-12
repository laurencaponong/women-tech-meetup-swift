//
//  ViewController.swift
//  women-tech-app
//
//  Created by Caponong, Lauren on 4/6/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

<<<<<<< HEAD
private var meetupAPIKey = "54b105038523dd287127805f797637"
let textCellIdentifier = "cellIdentifier"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

=======
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   
    let meetupAPIKey = "54b105038523dd287127805f797637"
    let textCellIdentifier = "cellIdentifier"
>>>>>>> 4036506a6dc891229f5ed258682d7bbed4d999d8
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var meetupResultsTableView: UITableView!
    var arrayResponse = []
    var userZipCode = "10016"

<<<<<<< HEAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateAndDSource()
=======
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        meetupResultsTableView.delegate = self
        meetupResultsTableView.dataSource = self
>>>>>>> 4036506a6dc891229f5ed258682d7bbed4d999d8
        getJSONData()
        
        // Register custom cell
        let nib = UINib(nibName: "MeetupCustomTableViewCell", bundle: nil)
        meetupResultsTableView.registerNib(nib, forCellReuseIdentifier: "cellIdentifier")
        
        self.navigationController?.navigationBar.topItem?.title = "Meetups"
<<<<<<< HEAD
    }
    
    
    func setDelegateAndDSource() {
        searchBar.delegate = self
        meetupResultsTableView.delegate = self
        meetupResultsTableView.dataSource = self
=======
                
    }
    
    
    func getJSONData() {
        
            Alamofire.request(.GET, "https://api.meetup.com/2/open_events?&sign=true&photo-host=public&zip=\(userZipCode)&text_format=plain&text=women+woman+girls+girl&category=34&page=20&desc=true&key=\(meetupAPIKey)") .responseJSON {
                response in
            
            switch response.result {

                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        if let meetups = json["results"].arrayObject {
                            self.arrayResponse = meetups as! [[String:AnyObject]]
//                            print(self.arrayResponse)
                            self.meetupResultsTableView.reloadData()
                        } else {
                            print("Parsing error")
                        }
                    }
                    
                case .Failure(let error):
                    print(error)
                }
        }
>>>>>>> 4036506a6dc891229f5ed258682d7bbed4d999d8
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        userZipCode = searchBar.text!
        getJSONData()
        self.meetupResultsTableView.reloadData()
    }
    
<<<<<<< HEAD
    
//# MARK: - Networking
    
    func getJSONData() {
        Alamofire.request(.GET, "https://api.meetup.com/2/open_events?&sign=true&photo-host=public&zip=\(userZipCode)&text_format=plain&text=women+woman+girls+girl&category=34&page=20&desc=true&key=\(meetupAPIKey)") .responseJSON {
            response in
            
            switch response.result {
                
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    if let meetups = json["results"].arrayObject {
                        self.arrayResponse = meetups as! [[String:AnyObject]]
                    } else {
                        print("Parsing error")
                    }
                }
                
            case .Failure(let error):
                print(error)
            }
        }
    }


    
    
=======


>>>>>>> 4036506a6dc891229f5ed258682d7bbed4d999d8
//# MARK: - Table view methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayResponse.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as! MeetupCustomTableViewCell
        
        let data = self.arrayResponse[indexPath.row]

        //meetup name
        if let meetupNameUnformatted = data["name"] as! String! {
            let meetupName = meetupNameUnformatted.capitalizedString
            cell.meetupNameLabel?.text = meetupName
        }
        
        //organization name
        let organizationName = data["group"]!!["name"]
        cell.organizationNameLabel?.text = organizationName as? String
        
        //date of meetup
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM-dd-yyyyy HH:mm:ss Z"
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.locale = NSLocale.currentLocale()
        formatter.timeStyle = .LongStyle
        
        let timeAsInt = data["time"] as! Int
<<<<<<< HEAD
        
        let timeAsInterval: NSTimeInterval = Double(timeAsInt)/10000
        let convertedDate = NSDate(timeIntervalSinceReferenceDate:timeAsInterval)
        
        cell.dateLabel?.text = String(convertedDate)
        
=======
        print("epoch time is: \(timeAsInt)")
        
        let timeAsInterval: NSTimeInterval = Double(timeAsInt)/10000
        let convertedDate = NSDate(timeIntervalSinceReferenceDate:timeAsInterval)
        print("converted date :\(convertedDate) \n")
        
//        let dateInNSDateFormat = NSDate(timeIntervalSinceNow: dateOfMeetupInSeconds)
//        print("ns formatted date: \(dateInNSDateFormat) \n")
        
//        let convertedDate = formatter.stringFromDate(dateInNSDateFormat)
        cell.dateLabel?.text = String(convertedDate)
>>>>>>> 4036506a6dc891229f5ed258682d7bbed4d999d8
        return cell
    }
    

}