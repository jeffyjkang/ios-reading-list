//
//  BookController.swift
//  Reading List
//
//  Created by Jeff Kang on 6/7/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    init() {
        loadFromPersistentStore()
    }
    
    var books: [Book] = []
    
    var readBooks: [Book] {
        return books.filter{ $0.hasBeenRead }
    }
    
    var unreadBooks: [Book] {
        return books.filter{ !$0.hasBeenRead }
    }
    
    private var readingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("ReadingList.plist")
    }
    
    private func saveToPersistentStore() {
        guard let readingListURL = readingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let booksData = try encoder.encode(books)
            try booksData.write(to: readingListURL)
        } catch {
            print("Error saving books: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let readingListURL = readingListURL, fm.fileExists(atPath: readingListURL.path) else { return }
        print(readingListURL)
        do {
            let decoder = PropertyListDecoder()
            let booksData = try Data(contentsOf: readingListURL)
            let decodedBooks = try decoder.decode([Book].self, from: booksData)
            self.books = decodedBooks
        } catch {
            print("Error loading books from plist: \(error)")
        }
    }
    
    // create book
    func createBook(title: String, reasonToRead: String) {
        let book = Book(title: title, reasonToRead: reasonToRead)
        books.append(book)
        saveToPersistentStore()
    }
    
    // delete book
    func deleteBook(book: Book) {
        guard let index = books.index(of: book) else { return }
        books.remove(at: index)
        saveToPersistentStore()
    }
    
    // update has been read
    func updateHasBeenRead(for book: Book) {
        guard let index = books.index(of: book) else { return }
        books[index].hasBeenRead = !books[index].hasBeenRead
        saveToPersistentStore()
    }
    
    // update book properties
    func updateBookProperties(for book: Book, title: String, reasonToRead: String) {
        guard let index = books.index(of: book) else { return }
        
        books[index].title = title
        books[index].reasonToRead = reasonToRead
        
        saveToPersistentStore()
        
    }
}
