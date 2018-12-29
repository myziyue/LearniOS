//
//  NoteDAO.m
//  MyNotes
//
//  Created by MyZiyue on 2018/12/29.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "NoteDAO.h"

@implementation NoteDAO

static NoteDAO *sharedSingleton = nil;

+(NoteDAO*)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton = [[self alloc] init];
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        NSDate* date1 = [dateFormatter dateFromString:@"2016-01-01 16:01:03"];
        Note* note1 = [[Note alloc] initWithDate:date1 content:@"Welcome to MyNote."];
        
        NSDate* date2 = [dateFormatter dateFromString:@"2016-01-02 08:01:03"];
        Note* note2 = [[Note alloc] initWithDate:date2 content:@"Welcome to MyNote."];
        
        sharedSingleton.listData = [[NSMutableArray alloc] init];
        [sharedSingleton.listData addObject:note1];
        [sharedSingleton.listData addObject:note2];
    });
    return sharedSingleton;
}

-(int)create:(Note*)model {
    [self.listData addObject:model];
    return 0;
}

-(int)remove:(Note*)model {
    for (Note* note in self.listData) {
        if([note.date isEqualToDate:model.date]) {
            [self.listData removeObject:note];
            break;
        }
    }
    return 0;
}

-(int) modify:(Note*)model {
    for (Note* note in self.listData) {
        //比较日期主键是否相等
        if ([note.date isEqualToDate:model.date]){
            note.content = model.content;
            break;
        }
    }
    return 0;
}

-(NSMutableArray*) findAll {
    return self.listData;
}

-(Note*) findById:(Note*)model {
    for (Note* note in self.listData) {
        //比较日期主键是否相等
        if ([note.date isEqualToDate:model.date]){
            return note;
        }
    }
    return nil;
}


@end
