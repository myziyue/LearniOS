//
//  NoteBL.h
//  MyNotes
//
//  Created by MyZiyue on 2018/12/29.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoteBL : NSObject
-(NSMutableArray*)createNote:(Note*)model;
-(NSMutableArray*)remove:(Note*)model;
-(NSMutableArray*)findAll;
@end

NS_ASSUME_NONNULL_END
