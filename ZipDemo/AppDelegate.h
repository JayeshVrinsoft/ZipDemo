//
//  AppDelegate.h
//  ZipDemo
//
//  Created by Jayesh Patel on 23/04/16.
//  Copyright © 2016 Jayesh Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleProtocol.h"
#import "WebService.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) WebService *webServiceObj;
@property (strong, nonatomic) SampleProtocol *sampleObj;
@property (strong, nonatomic) UIWindow *window;


@end

