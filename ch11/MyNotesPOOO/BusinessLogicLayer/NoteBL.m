//
//  NoteBL.m
//  MyNotes
//
//  Created by MyZiyue on 2018/12/29.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "NoteBL.h"

@implementation NoteBL

-(NSMutableArray*)createNote:(Note*)model{
    NoteDAO* dao = [NoteDAO sharedInstance];
    [dao create:model];
    return [dao findAll];
}

-(NSMutableArray*)remove:(Note*)model{
    NoteDAO* dao = [NoteDAO sharedInstance];
    [dao remove:model];
    return [dao findAll];
}

-(NSMutableArray*)findAll{
    NoteDAO* dao = [NoteDAO sharedInstance];
    return [dao findAll];
}

@end
