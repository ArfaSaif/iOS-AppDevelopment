//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    var messagesArray : [Message] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = K.appName
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()

    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
              do {
                try Auth.auth().signOut()
                navigationController?.popToRootViewController(animated: true)
                
              } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
              }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data:
                [K.FStore.senderField: messageSender,
                 K.FStore.bodyField: messageBody,
                 K.FStore.dateField: Date().timeIntervalSince1970]) { (error) in
                    if let e = error {
                        print("An error has occurred \(e)")
                    }
                    else {
                        print("Added data to the firebase server")
                        
                        DispatchQueue.main.async {
                            self.messageTextfield.text = ""
                        }
                    }
            }
            
        }
        
        
        
          
    }
    func loadMessages() {
    //    let db = Firestore.firestore()
//        db.collection(K.collectionName).
        
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener {
            (querySnapshot, error) in
            self.messagesArray = []
            if let e = error {
                print ("Error in retrieving data \(e)")
            }
            else{
                if let qsDocuments = querySnapshot?.documents{
                for documents in qsDocuments {
                    
                    if let messageSender = documents.data() [K.FStore.senderField] as? String, let messageBody = documents.data()[K.FStore.bodyField] as? String {
                        let message = Message(sender: messageSender, body: messageBody )
                        self.messagesArray.append(message)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            let indexPath = IndexPath(row: (self.messagesArray.count - 1), section: 0)
                            self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                        }
                        
                }
                }
                }
            }
        }
        
        
    }

}


extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messagesArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.Label.text = message.body
        if(Auth.auth().currentUser?.email == message.sender)
        {
            cell.MessageBubble.backgroundColor = UIColor(named: K.BrandColors.lighBlue)
            cell.Label.textColor = UIColor(named: K.BrandColors.purple)
            cell.LeftImage.isHidden = true
            cell.RightImage.isHidden = false
            
        }
        else {
            cell.MessageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.Label.textColor = UIColor(named: K.BrandColors.lighBlue)
            cell.LeftImage.isHidden = false
            cell.RightImage.isHidden = true
                       
        }
        
        return cell
    }
    
    
    
}
