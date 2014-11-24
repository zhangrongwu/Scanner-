//
//  ViewController.h
//  Scanner
//
//  Created by 王朝 on 14-11-18.
//  Copyright (c) 2014年 张荣武. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"
@interface ViewController : UIViewController<ZBarReaderDelegate>


@property (strong, nonatomic)UILabel *label;
@property (strong, nonatomic)UIImageView *imageV;
@end

