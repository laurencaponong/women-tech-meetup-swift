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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let meetupAPIKey = "54b105038523dd287127805f797637"
    let textCellIdentifier = "cellIdentifier"
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var meetupResultsTableView: UITableView!
    var arrayResponse = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        meetupResultsTableView.delegate = self
        meetupResultsTableView.dataSource = self

        Alamofire.request(.GET, "https://api.meetup.com/2/open_events.json?zip=10012&time=-1d,&status=past&key=\(meetupAPIKey)") .responseJSON {
            response in
            
            switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
    
                        if let meetups = json["results"].arrayObject {
                            self.arrayResponse = meetups as! [[String:AnyObject]]
                            var nameOfMeetup = self.arrayResponse[0]["name"]!
                            print(nameOfMeetup)
                            print("array response: ", self.arrayResponse)
                            
                        } else {
                            print("Parsing error")
                        }
                    }
                
                case .Failure(let error):
                    print(error)
            }
            
        }
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = words[row]
        return cell
    
    }

}

