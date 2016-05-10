//
//  SampleProtocol.h
//  ZipDemo
//
//  Created by Jayesh Patel on 26/04/16.
//  Copyright © 2016 Jayesh Patel. All rights reserved.
//

@protocol SampleProtocolDelegate <NSObject>

@required

- (void) webServiceResponce:(NSMutableArray *)arrResponse method:(NSString *)method webServiceName: (NSString *) strWebServiceName;
- (void) webServiceFailure:(NSError *)error method:(NSString *)method;

@optional
- (void) optionalCompletedMethod;

@end

#import <Foundation/Foundation.h>
#import "WebService.h"

@class SampleProtocol;

@interface SampleProtocol : NSObject <WebServiceDelegate>
{
    id <SampleProtocolDelegate> _delegate;
}

@property (nonatomic, strong) id delegate;

- (void) callLoginWS : (NSString *) strURL;
- (void) startSampleProcessMethod;
+ (void) startOptionalProcessMethod;
+ (SampleProtocol *) SampleProtocolClass;

@end
