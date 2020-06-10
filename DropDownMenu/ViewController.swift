//
//  ViewController.swift
//  DropDownMenu
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
        // Do any additional setup after loading the view.
        
        
    }
    
    
    
    @IBAction func submitDataAction(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func serviceCategoryAction(_ sender: UITextField) {
        
        prepDropDownMenu()
        
        
        
    }
    
    
    @IBAction func servicesUnderCatAction(_ sender: UITextField) {
        
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
            
            myTableView.frame.origin.x = tempView.frame.origin.x + serviceCategory.frame.origin.x
            
            myTableView.frame.origin.y = tempView.frame.origin.y + serviceCategory.frame.origin.y + serviceCategory.frame.size.height
            
        } else {
            
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
        
        serviceCategory.text! = myServicesArray[indexPath.row]
        
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
