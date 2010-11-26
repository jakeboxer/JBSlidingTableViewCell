//
//  LetsSlideViewController.m
//  LetsSlide
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

#import "LetsSlideViewController.h"
#import "RegularSlidingTableViewCell.h"

@interface LetsSlideViewController ()

@property (nonatomic, copy) NSArray* regularCellStrings;

@end

@implementation LetsSlideViewController

@synthesize regularCellStrings = regularCellStrings_;
@synthesize tableView = tableView_;

#pragma mark -
#pragma mark Creation/Removal Methods

- (id)initWithCoder:(NSCoder*)aDecoder {
  self = [super initWithCoder:aDecoder];

  if (nil != self) {
    self.regularCellStrings = [NSArray arrayWithObjects:@"First default cell", @"Second default cell", nil];
  }

  return self;
}

- (void)dealloc {
  [tableView_ release];

  tableView_ = nil;

  [super dealloc];
}

#pragma mark -
#pragma mark UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
  return 1;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  static NSString* CellIdentifier = @"Identifier";
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

  if (nil == cell) {
    cell = [[[RegularSlidingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:CellIdentifier] autorelease];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  }

  ((RegularSlidingTableViewCell*)cell).titleLabel.text = [self.regularCellStrings objectAtIndex:indexPath.row];

  return cell;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.regularCellStrings count];
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
  return @"Regular cells (select to slide)";
}

#pragma mark -
#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
  RegularSlidingTableViewCell* cell = (RegularSlidingTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
  [cell openDrawer];
}

@end
