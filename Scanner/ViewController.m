//
//  ViewController.m
//  Scanner
//
//  Created by 王朝 on 14-11-18.
//  Copyright (c) 2014年 张荣武. All rights reserved.
//

#import "ViewController.h"
#define manScanWidth [UIScreen mainScreen].bounds.size.width
#define manScanHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *bu = [UIButton buttonWithType:UIButtonTypeSystem];
    bu.frame = CGRectMake(100, 300, 100, 100);
    [self.view addSubview:bu];
    [bu addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [bu setTitle:@"扫描二维码" forState:UIControlStateNormal];
    bu.backgroundColor = [UIColor  redColor];
    bu.titleLabel.textColor = [UIColor yellowColor];
    
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, manScanWidth, 300)];
    self.imageV.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.imageV];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 400, manScanWidth, 40)];
    [self.view addSubview:self.label];
    self.label.backgroundColor = [UIColor yellowColor];

}



- (void) readerControllerDidFailToRead: (ZBarReaderController*) reader
                             withRetry: (BOOL) retry
{
    UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"错误信息" message:@"" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"", nil];
    [al show];
    
}
- (void)buttonAction
{
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    ZBarImageScanner *scanner = reader.scanner;
    [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
    reader.showsZBarControls = YES;
    [self presentViewController:reader animated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    id<NSFastEnumeration> results = [info objectForKey:ZBarReaderControllerResults];
    ZBarSymbol *symbol;
    for (symbol in results) {
        _imageV.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [picker dismissViewControllerAnimated:YES completion:nil];
        _label.text = symbol.data;
        break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
