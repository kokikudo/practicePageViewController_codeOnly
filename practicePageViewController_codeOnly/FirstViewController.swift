//
//  FirstViewController.swift
//  practicePageViewController_codeOnly
//
//  Created by kudo koki on 2021/06/03.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let labal = UILabel()
        let screenWidth: CGFloat = view.frame.size.width
        let screenHeight: CGFloat = view.frame.size.height
        labal.frame.size = CGSize(width: 100, height: 100)
        labal.center = CGPoint(x: screenWidth/2, y: screenHeight/2)
        
        labal.text = "1"
        labal.textAlignment = NSTextAlignment.center
        self.view.addSubview(labal)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
