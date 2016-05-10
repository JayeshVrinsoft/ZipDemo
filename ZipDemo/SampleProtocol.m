//
//  SampleProtocol.m
//  ZipDemo
//
//  Created by Jayesh Patel on 26/04/16.
//  Copyright © 2016 Jayesh Patel. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SampleProtocol.h"
#import "defines.h"

@implementation SampleProtocol 

+ (SampleProtocol *) SampleProtocolClass
{
    SampleProtocol *sampleProtocol;
    
    if (sampleProtocol == nil) {
        sampleProtocol = [[SampleProtocol alloc] init];
    }
    
    return sampleProtocol;
}

- (void) startSampleProcessMethod
{
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self.delegate selector:@selector(processCompletedMethod) userInfo:nil repeats:NO];
}

- (void) callLoginWS : (NSString *) strURL
{
    NSString *str = [NSString stringWithFormat:@"%@Login?%@",MAINURL,strURL];
    [[WebService getInstance:self] callWebService:str dictionarywithdata:nil withType:@"get" webServiceName:@"Login"];
}

- (void) processCompletedMethod
{
    NSLog(@"Start Protocol Method Call");
}

+ (void) startOptionalProcessMethod
{
    NSLog(@"Start Optional Protocol Method Call");
}

- (void) webServiceResponce:(NSMutableArray *)arrResponse method:(NSString *)method webServiceName: (NSString *) strWebServiceName;
{
    [_delegate webServiceResponce:arrResponse method:method webServiceName:strWebServiceName];
}

- (void) webServiceFailure:(NSError *)error method:(NSString *)method
{
    
}

@end
