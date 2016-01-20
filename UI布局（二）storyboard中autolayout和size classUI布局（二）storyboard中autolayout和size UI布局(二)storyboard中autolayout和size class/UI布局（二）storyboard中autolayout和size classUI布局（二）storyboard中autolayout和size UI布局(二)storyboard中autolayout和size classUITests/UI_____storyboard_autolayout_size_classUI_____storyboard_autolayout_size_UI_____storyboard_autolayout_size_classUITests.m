//
//  UI_____storyboard_autolayout_size_classUI_____storyboard_autolayout_size_UI_____storyboard_autolayout_size_classUITests.m
//  UI布局（二）storyboard中autolayout和size classUI布局（二）storyboard中autolayout和size UI布局(二)storyboard中autolayout和size classUITests
//
//  Created by huangchengdu on 16/1/20.
//  Copyright © 2016年 huangchengdu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UI_____storyboard_autolayout_size_classUI_____storyboard_autolayout_size_UI_____storyboard_autolayout_size_classUITests : XCTestCase

@end

@implementation UI_____storyboard_autolayout_size_classUI_____storyboard_autolayout_size_UI_____storyboard_autolayout_size_classUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
