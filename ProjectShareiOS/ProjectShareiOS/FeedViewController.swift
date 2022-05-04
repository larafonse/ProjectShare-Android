//
//  FeedViewController.swift
//  ProjectShareiOS
//
//  Created by Nicolas Lara on 4/12/22.
//

import UIKit
import AlamofireImage
import Parse

class ResultsVC:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {

   
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: ResultsVC())
    
    
    var projects = [PFObject]()
    var filteredProjects = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 250;

        // Do any additional setup after loading the view.
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        filteredProjects = []
        
        if text == "" {
            filteredProjects = projects
        }
        for p in projects{
            let s = p["title"] as! String
            if s.uppercased().contains(text.uppercased()){
                filteredProjects.append(p)
            }
        }
        tableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Project")
        query.limit = 20
        
        query.findObjectsInBackground{
                (projects,error) in
                    if projects != nil{
                        self.projects = projects!
                        self.filteredProjects = projects!
                        self.tableView.reloadData()
                    }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredProjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let project = filteredProjects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell") as! ProjectCell
        
        cell.title.text = project["title"] as! String
        cell.username.text = project["username"] as! String
        cell.about.text = project["description"] as! String
        
        cell.about.text = project["description"] as! String
        cell.technologies.text = project["tech_stack"] as! String
        
        let imageFile = project["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.projectLogo.af.setImage(withURL: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: nil)
        
    }
    
    @IBAction func goToProfile(_ sender: Any) {
        self.performSegue(withIdentifier: "profile", sender: nil)
    }
    
    @IBAction func toCompose(_ sender: Any) {
        self.performSegue(withIdentifier: "compose", sender: nil)
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
