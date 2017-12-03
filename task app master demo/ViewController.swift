//
//  ViewController.swift
//  task app master demo
//
//  Created by Dilraj Devgun on 12/2/17.
//  Copyright © 2017 Dilraj Devgun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var taskManager:TaskManager = TaskManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        //make navigation bar clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.getNumberOfTasks()
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = taskManager.getTaskAtIndex(index: indexPath.row)
        let customView = TaskTableViewCell(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80), name: task!.getName(), time: task!.getDate())
        cell.addSubview(customView)
        return cell
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "addVC")
        (vc as! AddTaskViewController).taskManager = self.taskManager
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

