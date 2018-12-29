//
//  Note.h
//  MyNotes
//
//  Created by MyZiyue on 2018/12/29.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Note : NSObject

@property (nonatomic, strong) NSDate* date;
@property (nonatomic, strong) NSString* content;

-(instancetype)initWithDate:(NSDate*)date content:(NSString*)content;
-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
