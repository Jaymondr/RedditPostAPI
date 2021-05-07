//
//  PostTableViewCell.swift
//  RedditAPIWithDetail
//
//  Created by Jaymond Richardson on 5/5/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {

//MARK: - Outlets
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var postUpsLabel: UILabel!
    //MARK: - Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    //MARK: - Functions
    func updateViews() {
        guard let post = post else {return}
        postTitleLabel.text = post.title
        postUpsLabel.text = "Upvotes: \(post.ups)"
        
        PostController.fetchThumbnail(post: post) { (result) in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let thumbnail):
                    self.postImageView.image = thumbnail
                    
                case .failure(let error):
                    self.postImageView.image = UIImage(named: "noImage")
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                    
                }
                
            }
        }
    }
  
}
