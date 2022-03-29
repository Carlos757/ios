//
//  PageViewController.swift
//  AppTestLayout
//
//  Created by Carlos Rios on 28/03/22.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private var myControllers:[UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let myGreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcGreen")
        let myBlueVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcBlue")
        
        myControllers.append(contentsOf: [myGreenVC, myBlueVC])
        
        setViewControllers([myGreenVC], direction: .forward, animated: true, completion: nil)
        
        dataSource = self
        
    }
}
extension PageViewController:UIPageViewControllerDataSource {
    //Controlador anterior
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = myControllers.firstIndex(of: viewController)
        if index == 0 {
            return myControllers.last
        }
        return myControllers.first
    }
    //Controlador siguiente
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = myControllers.firstIndex(of: viewController)
        if index == 0 {
            return myControllers.last
        }
        return myControllers.first
    }
    
    
}
