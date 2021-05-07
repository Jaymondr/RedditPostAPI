//
//  PostDetailViewController.swift
//  RedditAPIWithDetail
//
//  Created by Jaymond Richardson on 5/6/21.
//

import UIKit

class PostDetailViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var subredditLabel: UILabel!
    @IBOutlet weak var upsLabel: UILabel!
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

    }
    
    
    //MARK: - Properties
    var post: Post?
    
    //MARK: - Functions
    func updateViews() {
        guard let post = post else {return}
        postTitleLabel.text = post.title
        subredditLabel.text = "S/R: \(post.subreddit)"
        authorLabel.text = "Author: \(post.author_fullname)"
        upsLabel.text = "Ups: \(post.ups)"
    
        PostController.fetchThumbnail(post: post) { result in
            DispatchQueue.main.async {
                switch result {
                
                case .success(let image):
                    self.postImageView.image = image
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
        view.backgroundColor = .lightGray
    
    
//        PostController.fetchPosts { result in
//            DispatchQueue.main.async {
//                
//                switch result {
//                case .success(let thumbnail):
//                    self.postImageView.image = thumbnail
//                }
//            }
//        }
        
    }
}
