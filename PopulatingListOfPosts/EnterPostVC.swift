//
//  EnterPostVC.swift
//  PopulatingListOfPosts
//
//  Created by Kwaku Dapaah on 3/11/23.
//

import UIKit

protocol PostAdditionDelegate: AnyObject {
    func addPost(name: String, post: String)
}

class EnterPostVC: UIViewController {
    
    let nameTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Enter Name here"
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        return txtField
    }()
    
    let postTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Enter Name here"
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        return txtField
    }()
    
    
    
    let addPostButton: UIBarButtonItem = {
        let btn = UIBarButtonItem(title: "Add Post", style: .plain, target: self, action: #selector(createPost))
       
        
        return btn
    }()
    
    let cancelPostButton: UIBarButtonItem = {
        let btn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPost))
       
        btn.tintColor = .systemRed
        
        return btn
    }()
    
        
    weak var delegate: PostAdditionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = addPostButton
        navigationItem.leftBarButtonItem = cancelPostButton
        

        setupTextFields()
        nameTextField.becomeFirstResponder()
    }
    
    override func viewDidLayoutSubviews() {
        nameTextField.frame = CGRect(x: 20, y: 100, width: 300, height: 80)
        postTextField.frame = CGRect(x: 20, y: 200, width: 300, height: 80)
        
    }
    
    
    func setupTextFields() {
        view.backgroundColor = .systemBackground
        view.addSubview(nameTextField)
        view.addSubview(postTextField)
    }
    
    
    @objc func createPost() {
        
        
        if nameTextField.text?.isEmpty == false && postTextField.text?.isEmpty == false {
            delegate?.addPost(name: nameTextField.text!, post: postTextField.text!)
            print("Post has been created")
            
            dismiss(animated: true)
        }
 
    }
   
    
    @objc func cancelPost() {
        print("Post has been canceled")
        dismiss(animated: true)
    }

}

