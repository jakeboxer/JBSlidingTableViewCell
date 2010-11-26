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

#import <QuartzCore/QuartzCore.h>
#import "JBSlidingTableViewCell.h"

@implementation JBSlidingTableViewCell

@synthesize bottomDrawer = _bottomDrawer;
@synthesize topDrawer = _topDrawer;

#pragma mark -
#pragma mark Creation/Removal Methods

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
  self = [super initWithStyle:style reuseIdentifier:identifier];

  if (nil != self) {
    _bottomDrawer = nil;

    // Top drawer
    self.topDrawer = [[[UIView alloc] init] autorelease];
    [self.contentView addSubview:self.topDrawer];
  }

  return self;
}

- (void)dealloc {
  [_bottomDrawer release];
  [_topDrawer release];

  _bottomDrawer = nil;
  _topDrawer = nil;

  [super dealloc];
}

#pragma mark -
#pragma mark Sliding Drawer Methods

- (void)closeDrawer {
  if (self.topDrawer.hidden) {
    CATransition* animation = [CATransition animation];
    animation.delegate = self;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromLeft;
    animation.duration = 0.2f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.contentView.layer addAnimation:animation forKey:nil];
    self.contentView.hidden = NO;
    self.topDrawer.hidden = NO;
  }
}

- (void)openDrawer {
  self.bottomDrawer = [[[UIView alloc] initWithFrame:self.bounds] autorelease];
  [self insertSubview:self.bottomDrawer belowSubview:self.contentView];

  [self bottomDrawerWillAppear];

  CATransition* animation = [CATransition animation];
  animation.delegate = self;
  animation.type = kCATransitionPush;
  animation.subtype = kCATransitionFromRight;
  animation.duration = 0.2f;
  animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [self.contentView.layer addAnimation:animation forKey:nil];
  self.topDrawer.hidden = YES;
  self.contentView.hidden = YES;
}

#pragma mark -
#pragma mark Callbacks

- (void)bottomDrawerDidDisappear {
  // Can be overridden by subclasses.
}

- (void)bottomDrawerWillAppear {
  // Can be overridden by subclasses.
}

#pragma mark -
#pragma mark UIView Methods

- (void)layoutSubviews {
  [super layoutSubviews];
  self.topDrawer.frame = self.contentView.bounds;
}

#pragma mark -
#pragma mark CAAnimation Delegate Methods

- (void)animationDidStop:(CAAnimation*)anim finished:(BOOL)flag {
  [self bottomDrawerDidDisappear];
  [self.bottomDrawer removeFromSuperview];
  self.bottomDrawer = nil;
}

@end
