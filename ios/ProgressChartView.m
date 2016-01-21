//
//  ProgressChartView.m
//  GymLog
//
//  Created by Feifan Zhou on 1/20/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "ProgressChartView.h"
@import CoreGraphics;

@interface ProgressChartView()
@property (strong, nonatomic) NSArray *data;

- (void)drawData:(NSArray *)data;
- (float)maxDataValue;
- (float)minDataValue;
@end

@implementation ProgressChartView
+ (id)progressChartForData:(NSArray *)progressData {
  ProgressChartView *chartView;
  if (!(chartView = [[self alloc] init]))
    return nil;
  
  chartView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.95];
  [chartView drawData:progressData];
  return chartView;
}

- (void)drawData:(NSArray *)data {
  self.data = data;
  [self setNeedsDisplay];
}

#define TOP_MARGIN 20
#define RIGHT_MARGIN 20
#define BOTTOM_MARGIN TOP_MARGIN
#define LEFT_MARGIN RIGHT_MARGIN
#define DAYS_TO_RENDER 30
#define SECONDS_TO_RENDER (DAYS_TO_RENDER * 24 * 3600)

- (void)drawRect:(CGRect)rect {
  CGFloat textColumnWidth = 20;
  CGFloat contentHeight = self.bounds.size.height - TOP_MARGIN - BOTTOM_MARGIN;
  CGFloat contentWidth = self.bounds.size.width - LEFT_MARGIN - RIGHT_MARGIN - textColumnWidth;
  
  UIColor *orange = [UIColor colorWithRed:0.9843137255 green:0.3215686275 blue:0.2 alpha:1.0];
  
  int graphFloor = (int)floor([self minDataValue]) / 10 * 10;
  int graphCeil = ((int)ceil([self maxDataValue]) / 10 + 1) * 10;
  if (graphCeil - graphFloor < 10)
    graphFloor = graphCeil - 10;
  int steps = (graphCeil - graphFloor) / 5;
  if (steps > 4)
    steps = (graphCeil - graphFloor) / 10;
  CGFloat lineGap = contentHeight / steps;
  CGFloat currentLineY = TOP_MARGIN;
  NSDictionary *gridlineLabelAttributes = @{
                                            NSFontAttributeName: [UIFont systemFontOfSize:10],
                                            NSForegroundColorAttributeName: [UIColor colorWithWhite:0 alpha:0.4]
                                            };
  UIBezierPath *gridLines = [UIBezierPath bezierPath];
  for (int i = 0; i <= steps; i++) {
    if (i == 0) {
      // Draw ceil label
      [[NSString stringWithFormat:@"%d", graphCeil] drawAtPoint:CGPointMake(LEFT_MARGIN, currentLineY - 6) withAttributes:gridlineLabelAttributes];
    }
    if (i == steps) {
      // Draw floor label
      [[NSString stringWithFormat:@"%d", graphFloor] drawAtPoint:CGPointMake(LEFT_MARGIN, currentLineY - 6) withAttributes:gridlineLabelAttributes];
    }
    [gridLines moveToPoint:CGPointMake(LEFT_MARGIN + textColumnWidth, currentLineY)];
    [gridLines addLineToPoint:CGPointMake(self.bounds.size.width - RIGHT_MARGIN, currentLineY)];
    currentLineY += lineGap;
  }
  [[UIColor colorWithWhite:0.5 alpha:0.1] setStroke];
  gridLines.lineWidth = 1.0;
  [gridLines stroke];
  
  NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
  NSTimeInterval cutoff = now - SECONDS_TO_RENDER;
  UIBezierPath *graphLine = [UIBezierPath bezierPath];
  BOOL lineStarted = NO;
  [orange setFill];
  for (NSDictionary *point in self.data) {
    NSTimeInterval pointTime = [point[@"createdAt"] floatValue];
    if (pointTime < cutoff)
      continue;
    CGFloat pointX = (pointTime - cutoff) / SECONDS_TO_RENDER * contentWidth + LEFT_MARGIN + textColumnWidth;
    float pointValue = [point[@"value"] floatValue];
    CGFloat pointY = self.bounds.size.height - BOTTOM_MARGIN - ((pointValue - graphFloor) / (graphCeil - graphFloor) * contentHeight);
    CGPoint graphPoint = CGPointMake(pointX, pointY);
    if (lineStarted)
      [graphLine addLineToPoint:graphPoint];
    else {
      [graphLine moveToPoint:graphPoint];
      lineStarted = YES;
    }
    
    [[UIBezierPath bezierPathWithOvalInRect:CGRectMake(graphPoint.x - 2.5, graphPoint.y - 2.5, 5, 5)] fill];
  }
  [orange setStroke];
  graphLine.lineWidth = 1.0;
  [graphLine stroke];
}

- (float)maxDataValue {
  float maxValue = FLT_MIN;
  for (NSDictionary *point in self.data) {
    float pointValue = [point[@"value"] floatValue];
    if (pointValue > maxValue)
      maxValue = pointValue;
  }
  return maxValue;
}

- (float)minDataValue {
  float minValue = FLT_MAX;
  for (NSDictionary *point in self.data) {
    float pointValue = [point[@"value"] floatValue];
    if (pointValue < minValue)
      minValue = pointValue;
  }
  return minValue;
}
@end
