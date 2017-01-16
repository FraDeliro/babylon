//
//  PostsTableViewController.swift
//  babylon
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {

    private let postCellID = "PostTableViewCell"
    var posts = [Post]()

    //MARK: - Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: postCellID, bundle: .main), forCellReuseIdentifier: postCellID)

        //gradient background
        let gradientView = GradientView(frame: tableView.frame)
        gradientView.startLocation = 0.0
        gradientView.endLocation = 1.0
        self.tableView.backgroundView = gradientView

        //refresh control
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = Color.white
        refreshControl.addTarget(self, action: #selector(fetchData), for: UIControlEvents.valueChanged)
        self.tableView.refreshControl = refreshControl

        //load data
        self.fetchData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //check if posts array is empty to show empty cells
        if self.posts.count == 0 {
            self.tableView.reloadData()
            EmptyDataLoader.addEmptyDataLoaderToTableView(table: self.tableView)
        }
    }

    //MARK: - Actions
    func fetchData() {

        let queue = DispatchQueue(label: "com.babylon.dispatchgroup", attributes: .concurrent, target: .main)
        let group = DispatchGroup()

        group.enter()
        queue.async (group: group) {
            ApiEngine.shared.getPosts("posts", succedeedBlock: { (response) in
                print(response)
                if let posts = response as? [Post] {
                    self.posts = posts
                }
                group.leave()
            }) { (error) in
                print(error)
                DispatchQueue.main.async {
                    self.endRefreshing()
                    self.showHeaderWithError(error.localizedDescription)
                }
            }
        }

        group.enter()
        queue.async (group: group) {
            ApiEngine.shared.getPostsAuthors("users", succedeedBlock: { (response) in
                print(response)
                if let users = response as? [User] {
                    for index in 0..<self.posts.count {
                        let postAuthors = users.filter({ (user) -> Bool in
                            self.posts[index].userId == user.id
                        })
                        if postAuthors.count > 0 {
                            self.posts[index].users = postAuthors
                        }
                    }
                }
                group.leave()
            }) { (error) in
                print(error)
                DispatchQueue.main.async {
                    self.endRefreshing()
                    self.showHeaderWithError(error.localizedDescription)
                }
            }
        }

        group.enter()
        queue.async (group: group) {
            ApiEngine.shared.getCommentsForPosts("comments", succedeedBlock: { (response) in
                print(response)
                if let comments = response as? [Comment] {
                    for index in 0..<self.posts.count {
                        let postComments = comments.filter({ (comment) -> Bool in
                            self.posts[index].id == comment.postId
                        })
                        self.posts[index].comments = postComments
                    }
                }
                group.leave()
            }) { (error) in
                print(error)
                DispatchQueue.main.async {
                    self.endRefreshing()
                    self.showHeaderWithError(error.localizedDescription)
                }
            }
        }

        group.notify(queue: DispatchQueue.main) {
            print("completed")
            //Update UI
            DispatchQueue.main.async {
                self.endRefreshing()
                self.tableView.tableHeaderView = nil
                self.tableView.reloadData()
                EmptyDataLoader.removeEmptyDataLoaderFromTableView(table: self.tableView)
            }
        }
    }

    func endRefreshing() {
        if self.tableView.refreshControl?.isRefreshing == true {
            self.tableView.refreshControl?.endRefreshing()
        }
    }

    func showHeaderWithError(_ error: String) {
        if self.tableView.tableHeaderView == nil {
            let header = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 30.0))
            let noConnectionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
            noConnectionLabel.backgroundColor = Color.materialRed.darken1
            noConnectionLabel.font = UIFont.boldSystemFont(ofSize: 14)
            noConnectionLabel.text = error
            noConnectionLabel.textColor = Color.white
            noConnectionLabel.textAlignment = .center
            header.addSubview(noConnectionLabel)
            self.tableView.tableHeaderView = header
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if posts.count > 0 {
            return posts.count
        } else {
            return Int(tableView.bounds.height / 280.0)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postCellID, for: indexPath) as! PostTableViewCell
        // Configure the cell...
        if posts.count > 0 {
            let post = posts[indexPath.row]
            cell.configureWithPost(post)
        }
        return cell
    }

    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if posts.count > 0 {
            return UITableViewAutomaticDimension
        } else {
            return 280.0
        }
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        footer.backgroundColor = .clear
        return footer
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if posts.count > 0 {
            self.performSegue(withIdentifier: "showDetail", sender: indexPath)
        }
    }

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = sender as! IndexPath
        let post = posts[indexPath.row]
        let detailVC = segue.destination as! DetailViewController
        detailVC.postDescription = post.body
        if let postAuthor = post.users.first {
            detailVC.userFullName = postAuthor.name
        }
        detailVC.numberOfComments = "\(post.comments.count) - Comments"
    }
}
