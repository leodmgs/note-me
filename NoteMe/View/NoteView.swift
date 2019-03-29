//
//  NoteView.swift
//  NoteMe
//
//  Created by Leonardo Domingues on 3/15/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import Foundation
import UIKit

class NoteView: UIView {
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title"
        return textField
    }()
    
    let titleTextFieldBottomLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let searchCategoryTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search category"
        return textField
    }()
    
    let searchCategoryTextFieldBottomLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let categoryCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let contentsTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .noteLightGray
        textView.text = "Write something here!"
        textView.textColor = .lightGray
        textView.layer.cornerRadius = 5
        textView.clipsToBounds = true
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func setupView() {
        titleTextField.addSubview(titleTextFieldBottomLine)
        searchCategoryTextField.addSubview(searchCategoryTextFieldBottomLine)
        addSubview(titleTextField)
        addSubview(searchCategoryTextField)
        addSubview(categoryCollection)
        addSubview(contentsTextView)
        activateRegularConstraints()
    }
    
    func showAlertForNote(
        title: String,
        message: String,
        options: [UIAlertAction]?) -> UIAlertController? {
        
        guard let _ = options else {
            /* In case that any options is defined, a simple alert is displayed
            presenting a single option, "OK". The action after this event
            needs to be handled by the caller. */
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return alert
        }
        // TODO: handle alert with options
        return nil
    }
    
    private func activateRegularConstraints() {
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(
                equalTo: self.topAnchor, constant: 28),
            titleTextField.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: 8),
            titleTextField.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -8),
            
            titleTextFieldBottomLine.topAnchor.constraint(
                equalTo: titleTextField.bottomAnchor, constant: 2),
            titleTextFieldBottomLine.leadingAnchor.constraint(
                equalTo: titleTextField.leadingAnchor),
            titleTextFieldBottomLine.trailingAnchor.constraint(
                equalTo: titleTextField.trailingAnchor),
            titleTextFieldBottomLine.heightAnchor.constraint(equalToConstant: 0.5),
            
            searchCategoryTextField.topAnchor.constraint(
                equalTo: titleTextFieldBottomLine.bottomAnchor, constant: 18),
            searchCategoryTextField.leadingAnchor.constraint(
                equalTo: titleTextField.leadingAnchor),
            searchCategoryTextField.trailingAnchor.constraint(
                equalTo: titleTextField.trailingAnchor),
//            searchTagTextField.heightAnchor.constraint(equalToConstant: 28),
            
            searchCategoryTextFieldBottomLine.topAnchor.constraint(
                equalTo: searchCategoryTextField.bottomAnchor, constant: 2),
            searchCategoryTextFieldBottomLine.leadingAnchor.constraint(
                equalTo: searchCategoryTextField.leadingAnchor),
            searchCategoryTextFieldBottomLine.trailingAnchor.constraint(
                equalTo: searchCategoryTextField.trailingAnchor),
            searchCategoryTextFieldBottomLine.heightAnchor.constraint(equalToConstant: 0.5),
            
            categoryCollection.topAnchor.constraint(
                equalTo: searchCategoryTextField.bottomAnchor, constant: 3),
            categoryCollection.leadingAnchor.constraint(
                equalTo: searchCategoryTextField.leadingAnchor),
            categoryCollection.trailingAnchor.constraint(
                equalTo: searchCategoryTextField.trailingAnchor),
            categoryCollection.heightAnchor.constraint(equalToConstant: 30),
            
            contentsTextView.topAnchor.constraint(
                equalTo: categoryCollection.bottomAnchor, constant: 12),
            contentsTextView.leadingAnchor.constraint(
                equalTo: titleTextField.leadingAnchor),
            contentsTextView.trailingAnchor.constraint(
                equalTo: titleTextField.trailingAnchor),
            contentsTextView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor, constant: -72)
            ])
    }
}
