//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by 홍현주 on 09/07/2019.
//  Copyright © 2019 홍현주. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {
    
    var param : MemoData?

    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = formatter.string(from: (param?.regdata)!)
        
        self.navigationItem.title = dateString
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
