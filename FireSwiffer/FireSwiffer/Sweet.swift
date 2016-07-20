//
//  Sweet.swift
//  FireSwiffer
//
//  Created by Training on 01/07/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Sweet {
    
    var key:String = ""
    var  content:String = ""
    var addedByUser:String = ""
    var itemRef:FIRDatabaseReference?
    
    init (content:String, addedByUser:String, key:String = "") {
        self.key = key
        self.content = content
        self.addedByUser = addedByUser
        self.itemRef = nil
    }
    
    init (snapshot:FIRDataSnapshot) {
        key = snapshot.key
        itemRef = snapshot.ref
        
        if let value = snapshot.value {
            
            if let sweetContent = value["content"] as? String {
                content = sweetContent
            } else {
                content = ""
            }
            
            if let sweetUser = value["addedByUser"] as? String {
                
                addedByUser = sweetUser
            } else {
                
                addedByUser = ""
            }
            
        } else {
            
            print("I couldn't unwrap the value")
        }
        
//        if let sweetContent = snapshot.value!["content"] as? String {
//            content = sweetContent
//        }else {
//            content = ""
//        }
        
//        if let sweetUser = snapshot.value!["addedByUser"] as? String {
//            addedByUser = sweetUser
//        }else {
//            addedByUser = ""
//        }
        
    }
    
    func toAnyObject() -> AnyObject {
        return ["content":content, "addedByUser":addedByUser]
    }
    
}