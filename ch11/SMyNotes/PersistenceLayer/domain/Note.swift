//
//  Note.swift
//  SMyNotes
//
//  Created by MyZiyue on 2018/12/29.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import Foundation

class Note {
    var date: NSDate!
    var content: NSString!
    
    init(date: NSDate, content: NSString) {
        self.date = date
        self.content = content
    }
    
    init() {
        self.date = NSDate()
        self.content = ""
    }
}
