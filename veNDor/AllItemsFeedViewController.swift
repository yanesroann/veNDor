//
//  AllItemsFeedViewController.swift
//  
//
//  Created by West   on 4/24/18.
//

import UIKit
import Firebase
import SwiftyJSON

class AllItemsFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var posts = [Post]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
            // download posts
        Database.database().reference().child("posts").observe(.childAdded) { (snapshot) in //child added to database
             //snapshot is now a dictionary
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
                print(snapshot)
                 for data in snapshot{
                    if data is Post{
                        //TODO
                    }
                    }
                    
                }
                //self.posts.append(newPost)
                self.tableView.reloadData()
            }
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as! PhotoTableViewCell
        let post = self.posts[indexPath.row]
        
        cell.post = post
        
        return cell
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
