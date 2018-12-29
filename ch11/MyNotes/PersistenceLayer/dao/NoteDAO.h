//
//  NoteDAO.h
//  MyNotes
//
//  Created by MyZiyue on 2018/12/29.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@interface NoteDAO : NSObject

@property (nonatomic, strong) NSMutableArray* listData;

+(NoteDAO*)sharedInstance;

-(int)create:(Note*)model;

-(int)remove:(Note*)model;

-(int)modify:(Note*)model;

-(NSMutableArray*)findAll;

-(Note*)findById:(Note*)model;

@end

