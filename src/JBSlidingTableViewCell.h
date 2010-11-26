//
//  JBSlidingTableViewCell.h
//
//  Copyright 2010 Jake Boxer
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import <UIKit/UIKit.h>

@interface JBSlidingTableViewCell : UITableViewCell {
@private
  UIView* bottomDrawer_;
  UIView* topDrawer_;
}

// Callback: Called when the bottom drawer is about to be shown. Add subviews here.
- (void)bottomDrawerWillAppear;

// Callback: Called when the bottom drawer has disappeared and is about to be released.
// Release subviews here.
- (void)bottomDrawerDidDisappear;

// Creates the bottom drawer, then opens the top drawer to reveal it.
- (void)openDrawer;

// Closes the top drawer over the bottom drawer, then releases the bottom drawer.
- (void)closeDrawer;

@property (nonatomic, retain) UIView* bottomDrawer;
@property (nonatomic, retain) UIView* topDrawer;

@end
