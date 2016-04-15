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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   
    let meetupAPIKey = "54b105038523dd287127805f797637"
    let textCellIdentifier = "cellIdentifier"
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var meetupResultsTableView: UITableView!
    var arrayResponse = []
    var userZipCode = "12345"

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        meetupResultsTableView.delegate = self
        meetupResultsTableView.dataSource = self
        getJSONData()
        
        // Register custom cell
        let nib = UINib(nibName: "MeetupCustomTableViewCell", bundle: nil)
        meetupResultsTableView.registerNib(nib, forCellReuseIdentifier: "cellIdentifier")
        
        self.navigationController?.navigationBar.topItem?.title = "Meetups"
                
    }
    
    
    func getJSONData() {
        
        Alamofire.request(.GET, "https://api.meetup.com/2/open_events?&sign=true&photo-host=public&zip=\(userZipCode)&text=women+in+tech&category=34&radius=20&status=upcoming&page=20&key=\(meetupAPIKey)") .responseJSON {
            response in
            
            switch response.result {

                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        if let meetups = json["results"].arrayObject {
                            self.arrayResponse = meetups as! [[String:AnyObject]]
                            self.meetupResultsTableView.reloadData()
                        } else {
                            print("Parsing error")
                        }
                    }
                    
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        userZipCode = searchBar.text!
        getJSONData()
        self.meetupResultsTableView.reloadData()
    }
    


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

        if let meetupNameUnformatted = data["name"] as! String! {
            let meetupName = meetupNameUnformatted.capitalizedString
            cell.meetupNameLabel?.text = meetupName
        }
        
        let organizationName = data["group"]!!["name"]
        cell.organizationNameLabel?.text = organizationName as? String
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        let dateOfMeetupInSeconds = data["time"] as! Double
        let dateInNSDateFormat = NSDate(timeIntervalSince1970: dateOfMeetupInSeconds)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM, dd, yyyy hh:mma"
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.locale = NSLocale.currentLocale()
        let convertedDate = dateFormatter.stringFromDate(dateInNSDateFormat)
        cell.dateLabel?.text = String(convertedDate)
        
        return cell
    }
    

}