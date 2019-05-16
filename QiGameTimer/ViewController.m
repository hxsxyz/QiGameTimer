//
//  ViewController.m
//  QiGameTimer
//
//  Created by huangxianshuai on 2019/5/15.
//  Copyright © 2019年 QiShare. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak) IBOutlet NSTextField *secondsField;
@property (weak) IBOutlet NSButton *controlButton;
@property (strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)viewDidAppear {
    
    [super viewDidAppear];
    
    NSTextView *textView = (NSTextView *)_secondsField.currentEditor;
    [textView setInsertionPointColor:[NSColor whiteColor]];
}

- (IBAction)controlButtonClicked:(id)sender {
    
    if (!_timer.valid) {
        [self startTimer];
    } else {
        [self stopTimer];
    }
}

- (void)startTimer {
    
    _secondsField.editable = NO;
    _controlButton.title = @"停止计时";
    _controlButton.alignment = NSTextAlignmentRight;
    
    _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(countNumbers) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    // _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countNumbers) userInfo:nil repeats:YES];
}

- (void)stopTimer {
    
    _secondsField.editable = YES;
    _controlButton.title = @"开始计时";
    _controlButton.alignment = NSTextAlignmentLeft;
    [_timer invalidate];
    _timer = nil;
}

- (void)countNumbers {
    
    if (_secondsField.integerValue <= 0) {
        return [self stopTimer];
    }
    
    --_secondsField.integerValue;
    
    if (_secondsField.integerValue <= 30) {
        _secondsField.textColor = [NSColor redColor];
    }
    else if (_secondsField.integerValue <= 60) {
        _secondsField.textColor = [NSColor orangeColor];
    }
    else {
        _secondsField.textColor = [NSColor blackColor];
    }
}

@end
