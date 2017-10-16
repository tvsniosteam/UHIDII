//
//  PageRootViewController.swift
//  UHIDII
//
//  Created by Radhakrishnan on 10/9/17.
//  Copyright © 2017 BLT0003IMAC. All rights reserved.
//

import UIKit

class PageRootViewController: UIViewController,UIPageViewControllerDataSource {
    
    @IBOutlet weak var pageControl: UIPageControl?
    @IBOutlet weak var btnNext: UIButton?
    
    var pageViewController : UIPageViewController?
    // let pageControl = UIPageControl.appearance() as UIPageControl
    var demoTitles : Array<String> = ["UPLOAD RECORDS", "FIND DOCTORS", "INVITE YOUR FRIEND"]
    var demoImages : Array<String> = ["UploadRecords", "FindDoctors", "InviteYourFriend"]
    var demoDescriptions : Array<String> = ["Lorem ipsum dolor sit amet,Consecteture adipiscing elit.Proin porttitor mattis consequat", "Lorem ipsum dolor sit amet,Consecteture adipiscing elit.Proin porttitor mattis consequat", "Lorem ipsum dolor sit amet,Consecteture adipiscing elit.Proin porttitor mattis consequat"]
    var currentPage : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? UIPageViewController
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController!.dataSource = self
        
        let startingViewController: DemoViewController = viewControllerAtIndex(index: 0)!
        let viewControllers = [startingViewController]
        pageViewController!.setViewControllers(viewControllers , direction: .forward, animated: false, completion: nil)
        pageViewController!.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height-60);
        
        pageControl?.pageIndicatorTintColor = UIColor.UHIDII_COLOR.lightBlue
        pageControl?.currentPageIndicatorTintColor = UIColor.UHIDII_COLOR.orange
        pageControl?.backgroundColor = UIColor.clear
        pageControl?.currentPage = 0
        
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- IBActions
    @IBAction func next (_ sender: UIButton)   {
        if currentPage == 0  {
            self.nextVC(currentIndex: currentPage)
            btnNext?.isHidden = false
        } else if currentPage == 1  {
            self.nextVC(currentIndex: currentPage)
            btnNext?.isHidden = true
        }
    }
    
    @IBAction func skip(_ sender: UIButton)  {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "Migrated")
        let vc : HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func nextVC(currentIndex:Int)  {
        let nextVC: DemoViewController? = self.viewControllerAtIndex(index:currentIndex+1)
        let viewControllers = [nextVC]
        pageViewController?.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true) { _ in }
        pageControl?.currentPage = currentIndex + 1
        currentPage = currentIndex + 1
    }
    
    func hideNextButton(currentIndex:Int)   {
        if currentIndex == 2  {
            btnNext?.isHidden = true
        }  else  {
            btnNext?.isHidden = false
        }
    }
    
    //MARK: PageVC Delegates
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! DemoViewController).pageIndex
        pageControl?.currentPage = index
        currentPage = index
        self.hideNextButton(currentIndex: index)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index -= 1
        return viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! DemoViewController).pageIndex
        
        if index == NSNotFound {
            return nil
        }
        pageControl?.currentPage = index
        currentPage = index
        self.hideNextButton(currentIndex: index)
        index += 1
        
        if (index == self.demoTitles.count) {
            return nil
        }
        return viewControllerAtIndex(index: index)
    }
    
    func viewControllerAtIndex(index: Int) -> DemoViewController?
    {
        if self.demoTitles.count == 0 || index >= self.demoTitles.count
        {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "DemoViewController") as? DemoViewController
        pageContentViewController?.strImgName = demoImages[index]
        pageContentViewController?.strTitle = demoTitles[index]
        pageContentViewController?.strDecription  = demoDescriptions[index]
        pageContentViewController?.pageIndex = index
        return pageContentViewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.demoTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
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
