//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Jeff Kang on 6/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var bookController: BookController?
    var book: Book?

    @IBOutlet weak var detailTitle: UITextField!
    @IBOutlet weak var detailReasonToRead: UITextView!
    @IBAction func detailSaveAction(_ sender: UIBarButtonItem) {
        guard let title = detailTitle.text, !title.isEmpty,
            let reasonToRead = detailReasonToRead.text, !reasonToRead.isEmpty else { return }
        if let book = book {
            bookController?.updateBookProperties(for: book, title: title, reasonToRead: reasonToRead)
        } else {
            bookController?.createBook(title: title, reasonToRead: reasonToRead)
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    private func updateViews() {
        if let book = book {
            detailTitle.text = book.title
            detailReasonToRead.text = book.reasonToRead
            self.title = book.title
        } else {
            self.title = "Add a new book"
        }
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
