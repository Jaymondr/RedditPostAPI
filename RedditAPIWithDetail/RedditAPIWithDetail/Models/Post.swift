//
//  Post.swift
//  RedditAPIWithDetail
//
//  Created by Jaymond Richardson on 5/5/21.
//

import Foundation

struct PostTopLevelDictionary: Codable {
    let data: PostSecondaryLevelDictionary
}

struct PostSecondaryLevelDictionary: Codable {
    let children: [PostThirdLevelDictionary]
}

struct PostThirdLevelDictionary: Codable {
    let data: Post
}

struct Post: Codable {
    let title: String
    let thumbnail: String
    let subreddit: String
    let author_fullname: String
    let ups: Int
}
