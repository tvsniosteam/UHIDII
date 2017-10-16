//
//  DemoViewController.swift
//  UHIDII
//
//  Created by Radhakrishnan on 10/9/17.
//  Copyright © 2017 BLT0003IMAC. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
    
    @IBOutlet weak var img_DemoImage: UIImageView!
    @IBOutlet weak var lbl_DemoTitle: UILabel!
    @IBOutlet weak var lbl_DemoDescription: UILabel!
    var pageIndex : Int = 0
    var strTitle : String = ""
    var strImgName : String = ""
    var strDecription : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        img_DemoImage.image = UIImage(named:strImgName)
        lbl_DemoTitle.text = strTitle
        lbl_DemoDescription.text = strDecription
        
        // Do any additional setup after loading the view.
    }
    
    func skip(sender: UIButton)  {
        
    }
    
   @IBAction func next(sender:UIButton)   {
       // let pageroot: PageRootViewController = PageRootViewController()
    //let page: PageRootViewController!
    
        //pageroot.viewDidLoad()
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
