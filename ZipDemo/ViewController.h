//
//  ViewController.h
//  ZipDemo
//
//  Created by Jayesh Patel on 23/04/16.
//  Copyright © 2016 Jayesh Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleProtocol.h"

@class ViewController;

@interface ViewController : UIViewController <SampleProtocolDelegate>
{
    IBOutlet UIButton *btnForZip;
    SampleProtocol *mSampleProtocol;
}

typedef void(^myCompletion)(BOOL);

- (IBAction) btnUnzipClicked:(id)sender;
- (IBAction) btnClearDirectoryClicked:(id)sender;
- (IBAction) btnListOfFileClicked:(id)sender;

@end

