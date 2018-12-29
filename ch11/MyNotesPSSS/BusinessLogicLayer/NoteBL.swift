//
//  NoteBL.swift
//  SMyNotes
//
//  Created by MyZiyue on 2018/12/29.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import Foundation

class NoteBL {
    func createNote(model: Note) -> NSMutableArray {
        let dao: NoteDAO = NoteDAO.sharedInstance
        dao.create(model: model)
        return dao.findAll()
    }
    
    func remove(model: Note) -> NSMutableArray {
        let dao: NoteDAO = NoteDAO.sharedInstance
        dao.remove(model: model)
        return dao.findAll()
    }
    
    func findAll() -> NSMutableArray {
        let dao: NoteDAO = NoteDAO.sharedInstance
        return dao.findAll()
    }
}
