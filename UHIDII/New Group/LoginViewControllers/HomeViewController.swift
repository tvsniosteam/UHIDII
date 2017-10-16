//
//  HomeViewController.swift
//  UHIDII
//
//  Created by Radhakrishnan on 10/11/17.
//  Copyright © 2017 BLT0003IMAC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var btnContinue: UIButton?
    @IBOutlet weak var btnDoctor: UIButton?
    @IBOutlet weak var btnPatient: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- IBActions
    
    @IBAction func doctor(_ sender: UIButton)  {
        
        if btnDoctor?.isSelected == false  {
            btnDoctor?.isSelected = true
            btnPatient?.isSelected = false
            btnDoctor?.setBackgroundImage(UIImage(named: "DoctorSelect"), for: UIControlState.normal)
            btnPatient?.setBackgroundImage(UIImage(named: "PatientUnselect"), for: UIControlState.normal)
            UserInstance.userInstance.userLoginDefaultId = 1
            
        }  else  {
            btnDoctor?.isSelected = false
            btnPatient?.isSelected = false
            btnDoctor?.setBackgroundImage(UIImage(named: "DoctorUnselect"), for: UIControlState.normal)
            UserInstance.userInstance.userLoginDefaultId = 0
        }
    }
    
    @IBAction func patient(_ sender: UIButton)  {
        
        if btnPatient?.isSelected == false  {
            btnPatient?.isSelected = true
            btnDoctor?.isSelected = false
            btnPatient?.setBackgroundImage(UIImage(named: "PatientSelect"), for: UIControlState.normal)
            btnDoctor?.setBackgroundImage(UIImage(named: "DoctorUnselect"), for: UIControlState.normal)
            UserInstance.userInstance.userLoginDefaultId = 2
            
        }  else  {
            btnPatient?.isSelected = false
            btnDoctor?.isSelected = false
            btnPatient?.setBackgroundImage(UIImage(named: "PatientUnselect"), for: UIControlState.normal)
            UserInstance.userInstance.userLoginDefaultId = 0
        }
    }
    
    @IBAction func tappedContinue( _ sender: UIButton)  {
        
        if UserInstance.userInstance.userLoginDefaultId == 0  {
            
        }  else {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
