//
//  NoteDAO.swift
//  SMyNotes
//
//  Created by MyZiyue on 2018/12/29.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import Foundation

class NoteDAO {
    var listData: NSMutableArray!
    static let sharedInstance: NoteDAO = {
        let instance = NoteDAO()
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-DD HH:mm:ss"
        let date1: NSDate = dateFormatter.date(from: "2016-01-01 16:01:03") as! NSDate
        let note1: Note = Note(date: date1, content: "Welcome to MyNote.")
        
        let date2: NSDate = dateFormatter.date(from: "2016-01-02 08:01:03") as! NSDate
        let note2: Note = Note(date: date2, content: "欢迎使用MyNote。")
        
        instance.listData = NSMutableArray()
        instance.listData.addObjects(note1)
        instance.listData.addObjects(note2)
        
        return instance
    }()
    
    func create(model: Note) -> Int {
        self.listData.addObjects(model)
        return 0
    }
    
    func remove(model: Note) -> Int {
        for note in self.listData {
            var note2 = note as! Note
            // 比较日期主键是否相等
            if note2.date == model.date {
                self.listData.removeObject(note2)
                break
            }
        }
        return 0
    }
    
    func modify(model: Note) -> Int {
        for note in self.listData {
            var note2 = note as! Note
            if note2.date == model.date {
                note2.content = model.content
                break
            }
        }
        return 0
    }
    
    func findAll() -> NSMutableArray {
        return self.listData
    }
    
    func findById(model: Note) -> Note? {
        for note in self.listData {
            var note2 = note as Note
            if note2.date == model.date {
                return note2
            }
        }
        return nil
    }
}
