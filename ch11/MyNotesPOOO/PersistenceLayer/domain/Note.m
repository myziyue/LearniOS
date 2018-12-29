//
//  Note.m
//  MyNotes
//
//  Created by MyZiyue on 2018/12/29.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "Note.h"

@implementation Note

-(instancetype)initWithDate:(NSDate *)date content:(NSString *)content {
    self = [super init];
    if(self) {
        self.date = date;
        self.content = content;
    }
    return self;
}

-(instancetype)init {
    self = [super init];
    if(self) {
        self.date = [[NSData alloc] init];
        self.content = @"";
    }
    
    return self;
}
@end
