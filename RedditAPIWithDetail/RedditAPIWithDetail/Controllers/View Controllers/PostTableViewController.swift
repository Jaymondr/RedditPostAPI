//
//  PostTableViewController.swift
//  RedditAPIWithDetail
//
//  Created by Jaymond Richardson on 5/5/21.
//

import UIKit

class PostTableViewController: UITableViewController {
    //MARK: - Outlets
    
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPostsForTableView()
        
    }

    //MARK: - Properties
    var posts: [Post] = []
//    var post: Post?
    
    
    //MARK: - Functions
    
    func fetchPostsForTableView() {
        PostController.fetchPosts { (result) in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let posts):
                    self.posts = posts
                    self.tableView.reloadData()
                    
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                    
                }
            }
        }
    }
        // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? PostTableViewCell
        
        let post = posts[indexPath.row]
        cell?.post = post


        return cell ?? PostTableViewCell()
    }

   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
//                  let post = post,
                  let destinationVC = segue.destination as? PostDetailViewController else {return}
            let selectedPost = posts[indexPath.row]
            destinationVC.post = selectedPost
            
        }
    }

}
