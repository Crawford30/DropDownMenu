//
//  ViewController.swift
//  DropDownMenu
//https://stackoverflow.com/questions/5615806/disable-uitextfield-keyboard
//
//  Created by JOEL CRAWFORD on 6/9/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    private let myCategoryArray: Array = ["Agri Business","Animal Care","Beauty", "Bussiness Support", "cleaning", "compound"]
    
    private let myServicesArray: Array = ["Farm Management", "Gardeneing", "Irrigation", "Pest Control", "Poultry Keeping", "Soil Sampling", "Animal Farm Management", "Animal shelter Construction", "Dog Training", "Pet Care", "Vertenary Services", "Zoo Keeper", "Agri Business","Animal Care","Beauty", "Bussiness Support", "cleaning", "compound","Agri Business","Animal Care","Beauty", "Bussiness Support", "cleaning", "compound"]
    
    //private var myTableView: UITableView!
    
    @IBOutlet weak var naVBar: UINavigationBar!
    
    @IBOutlet weak var serviceCategory: UITextField!
    
    @IBOutlet weak var servicesUnderCategory: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        serviceCategory.delegate = self
//        servicesUnderCategory.delegate = self
        
        
        
        
        // Do any additional setup after loading the view.
        
        //serviceCategory.isUserInteractionEnabled = false
//
//        if (serviceCategory.text! == "")  {
//
//            serviceCategory.isUserInteractionEnabled = false
//
//
//        } else {
//            serviceCategory.isUserInteractionEnabled = true
//
//        }
        
        
        
    }
    
    
    
    
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//
//        if textField == serviceCategory && textField == servicesUnderCategory {
//
//            prepDropDownMenu()
//
//
//        }
//        return false
//    }
    
    
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
////        if (serviceCategory.text! != "" && servicesUnderCategory.text! != "") {
////
////           serviceCategory.isUserInteractionEnabled = true
////           servicesUnderCategory.isUserInteractionEnabled = true
////
////
////        } else {
////
////
////            serviceCategory.isUserInteractionEnabled = false
////            servicesUnderCategory.isUserInteractionEnabled = false
////
////        }
//
//    }
    
    
     
    
    @IBAction func submitDataAction(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func serviceCategoryAction(_ sender: UITextField) {
        
       
        
        self.serviceCategory.tintColor = UIColor.clear
        
        serviceCategory.inputView = UIView() //disable the keyboard from appearing
        
        prepDropDownMenu()
        
        
        
    }
    
    
    @IBAction func servicesUnderCatAction(_ sender: UITextField) {
        
        self.servicesUnderCategory.tintColor = UIColor.clear
        
        servicesUnderCategory.inputView = UIView() //disable the keyboard from appearing
        
        prepDropDownMenu()
        
        
    }
    
    
    
    
    
    
    func prepDropDownMenu() {
        
        let tempView: UIView     = UIView.init()    // Fill screen with invisible view to disable taps in back
        tempView.tag             = 1000
        tempView.frame           = self.view.frame
        tempView.backgroundColor = UIColor.clear
        self.view.addSubview( tempView )
        
        var myTableView: UITableView!
        
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 0 , width: Int(tempView.frame.size.width), height: Int(tempView.frame.size.height)))
        
        
        //Display the table view below the servicecategory textfield when its tapped or else under the servicesUnderCategory textfield
        if (serviceCategory.isEditing) {
            
//            serviceCategory.delegate = self
//
//            serviceCategory.resignFirstResponder()
            
            myTableView.frame.origin.x = tempView.frame.origin.x + serviceCategory.frame.origin.x
            
            myTableView.frame.origin.y = tempView.frame.origin.y + serviceCategory.frame.origin.y + serviceCategory.frame.size.height
            
        } else {
            
//            servicesUnderCategory.delegate = self
//
//            servicesUnderCategory.resignFirstResponder()
            
            myTableView.frame.origin.x = tempView.frame.origin.x + servicesUnderCategory.frame.origin.x
            
            myTableView.frame.origin.y = tempView.frame.origin.y + servicesUnderCategory.frame.origin.y + servicesUnderCategory.frame.size.height
            
        }
        
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
        
        
        tempView.addSubview(myTableView)
        
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myServicesArray[indexPath.row])")
        
        if serviceCategory.isEditing {
        
            serviceCategory.text! = myServicesArray[indexPath.row]
            
        } else {
            
            servicesUnderCategory.text! =  myServicesArray[indexPath.row]
        }
        
        self.view.viewWithTag(1000)?.removeFromSuperview()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myServicesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myServicesArray[indexPath.row])"
        return cell
    }
    
    
    
    
}

