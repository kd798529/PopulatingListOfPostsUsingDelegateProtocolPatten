//
//  ViewController.swift
//  PopulatingListOfPosts
//
//  Created by Kwaku Dapaah on 3/11/23.
//

import UIKit

class PostListVC: UIViewController, PostAdditionDelegate {
    
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    let addPostBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        let largeImageConfiguration = UIImage.SymbolConfiguration(pointSize: 100, weight: .medium, scale: .large)
        let image = UIImage(systemName: "plus.circle.fill", withConfiguration: largeImageConfiguration)
        btn.setImage(image, for: .normal)
        btn.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        btn.addTarget(self, action: #selector(createNewPost), for: .touchUpInside)
        
        
        return btn
    }()
    
    var posts: [Post] = [Post(name: "test", text: "Test Post")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureTableView()
        configureButton()
    }
    
    func addPost(name: String, post: String) {
        let newPost = Post(name: name, text: post)
        
        posts.append(newPost)
        print(posts)
        tableView.reloadData()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
    func configureButton() {
        view.addSubview(addPostBtn)
        
        addPostBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100).isActive = true
        addPostBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        addPostBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        addPostBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
//        addPostBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func createNewPost() {
        print("navigate to create post screen")
        let rootVC = EnterPostVC()
        
        rootVC.delegate = self
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true)
    }
    
    

}


extension PostListVC: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(posts[indexPath.row].name) said: \(posts[indexPath.row].text)"
        return cell
    }
    
    
    
    
}

