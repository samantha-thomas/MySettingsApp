//
//  ViewController.swift
//  MySettingsApp
//
//  Created by Samantha Thomas on 10/25/19.
//  Copyright © 2019 Samantha Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    //Outlets
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZipcode: UITextField!
    @IBOutlet weak var dateSelector: UIDatePicker!
    
    //Actions
    @IBAction func btnSave(_ sender: Any)
    {
        //Updated from exercise.
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(self.txtFullName.text, forKey: "fullname")
        defaults.set(self.txtAddress.text, forKey: "address")
        
        //Added.
        defaults.set(self.txtCity.text, forKey: "city")
        defaults.set(self.txtState.text, forKey: "state")
        defaults.set(self.txtZipcode.text, forKey: "zipcode")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from:dateSelector.date) //pass Date here
        defaults.set(newDate, forKey: "bdate")
        print(dateSelector.date.description)
        defaults.synchronize()
        clear()
    }
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Updated from execise.
        let defaults: UserDefaults = UserDefaults.standard
        if defaults.string(forKey: "fullname") != nil
        {
              txtFullName.text = defaults.string(forKey: "fullname")
        }
        if defaults.string(forKey: "address") != nil
        {
            txtAddress.text = defaults.string(forKey: "address")
        }
        if defaults.string(forKey: "bdate") != nil
        {
            let bdate  = defaults.string(forKey: "bdate")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
            let date = dateFormatter.date(from: bdate!) //according to date format your date string
            dateSelector.setDate(date!, animated: true)
        }
        
        //Added.
        if defaults.string(forKey: "city") != nil
        {
            txtCity.text = defaults.string(forKey: "city")
        }
        if defaults.string(forKey: "state") != nil
        {
            txtState.text = defaults.string(forKey: "state")
        }
        if defaults.string(forKey: "zipcode") != nil
        {
            txtZipcode.text = defaults.string(forKey: "zipcode")
        }
    }
    
    //Gotten from exercise assignment.
    func clear()
    {
        //Updated from exercise.
        txtFullName.resignFirstResponder()
        txtAddress.resignFirstResponder()
        
        //Added.
        txtCity.resignFirstResponder()
        txtState.resignFirstResponder()
        txtZipcode.resignFirstResponder()
     }
}
