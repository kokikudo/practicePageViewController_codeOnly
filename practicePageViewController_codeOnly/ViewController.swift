//
//  ViewController.swift
//  practicePageViewController_codeOnly
//
//  Created by kudo koki on 2021/06/03.
//

import UIKit

class ViewController: UIViewController {

    
    private var pageViewController: UIPageViewController!
    private var controllers = [FirstViewController(), SecondViewController(), ThirdViewController()]
    //
    private var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPageViewController()
        
        //
        self.setPageControl()
    }
    
    
    private func initPageViewController() {
        
        
        // PageViewControllerの定義
        self.pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.setViewControllers([self.controllers[0]], direction: .forward, animated: true, completion: nil)
        self.pageViewController.dataSource = self
        
        //
        self.pageViewController.delegate = self
        
        // このビューにコントローラーとそのViewをそれぞれ追加
        self.addChild(self.pageViewController)
        self.view.addSubview(self.pageViewController.view!)
    }
    
    private func setPageControl() {
        //
        self.pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 100, width: UIScreen.main.bounds.width, height: 50))
        //
        self.pageControl.numberOfPages = self.controllers.count
        //
        self.pageControl.currentPage = 0
        //
        self.pageControl.pageIndicatorTintColor = .gray
        //
        self.pageControl.currentPageIndicatorTintColor = .red
        
        self.view.addSubview(self.pageControl)
    }
    
}

extension ViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        self.controllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let nowViewIndex = self.controllers.firstIndex(of: viewController),
           nowViewIndex < self.controllers.count - 1 {
            return self.controllers[nowViewIndex + 1]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let nowViewIndex = self.controllers.firstIndex(of: viewController),
           nowViewIndex > 0 {
            return self.controllers[nowViewIndex - 1]
        } else {
            return nil
        }
    }

}

extension ViewController: UIPageViewControllerDelegate {
    //
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            let currentPage = pageViewController.viewControllers![0]
            self.pageControl.currentPage = self.controllers.firstIndex(of: currentPage)!
        }

}
