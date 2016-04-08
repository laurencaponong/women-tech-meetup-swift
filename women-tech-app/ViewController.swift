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

        Alamofire.request(.GET, "https://api.meetup.com/2/open_events.json?zip=\(userZipCode)&time=-1d,&status=past&key=\(meetupAPIKey)") .responseJSON {
            response in
            
            switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
    
                        if let meetups = json["results"].arrayObject {
                            
                            self.arrayResponse = meetups as! [[String:AnyObject]]
                            
                            for i in 1...5 {
                                if let nameOfMeetup = self.arrayResponse[i]["name"]! {
                                    print(i, nameOfMeetup)
                                }
                            }
                            
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
        print("User's zip code: \(searchBar.text!)")
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayResponse.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = self.arrayResponse[row] as? String
        return cell
    }

}

