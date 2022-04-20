//
//  FeedViewController.swift
//  ProjectShareiOS
//
//  Created by Nicolas Lara on 4/12/22.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    @IBOutlet weak var tableView: UITableView!
    
    
    var projects = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 250;

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Project")
        query.limit = 20
        
        query.findObjectsInBackground{
                (projects,error) in
                    if projects != nil{
                        self.projects = projects!
                        self.tableView.reloadData()
                    }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let project = projects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell") as! ProjectCell
        
        cell.title.text = project["title"] as! String
        cell.username.text = project["username"] as! String
        cell.about.text = project["description"] as! String
        
        cell.about.text = project["description"] as! String
        cell.technologies.text = project["tech_stack"] as! String

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: nil)
        
    }
    
    @IBAction func goToProfile(_ sender: Any) {
        self.performSegue(withIdentifier: "profile", sender: nil)
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
