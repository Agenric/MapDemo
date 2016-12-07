//
//  GMSMapController.m
//  MapDemo
//
//  Created by Agenric on 16/7/6.
//  Copyright © 2016年 Lecarx. All rights reserved.
//

#import "GMSMapController.h"

@interface GMSMapController ()
<
GMSMapViewDelegate
>
@property (weak, nonatomic) IBOutlet GMSMapView *myMapView;
@end

@implementation GMSMapController
- (void)viewDidLoad {
    self.myMapView.delegate = self;
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = self.annotationCoordinate;
    marker.map = self.myMapView;
    
    [self.myMapView setCamera:[GMSCameraPosition cameraWithTarget:self.annotationCoordinate zoom:18]];
}
@end
