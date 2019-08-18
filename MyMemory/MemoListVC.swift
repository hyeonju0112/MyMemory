//
//  MemoListVC.swift
//  MyMemory
//
//  Created by 홍현주 on 09/07/2019.
//  Copyright © 2019 홍현주. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.memolist.count
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.appDelegate.memolist[indexPath.row]
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd HH:mm:ss"
        
        cell.regdate.text = formatter.string(from: row.regdata!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let row = self.appDelegate.memolist[indexPath.row]
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else{
            return
        }
   
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
