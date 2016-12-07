//
//  BMKMapController.m
//  MapDemo
//
//  Created by Agenric on 16/7/6.
//  Copyright © 2016年 Lecarx. All rights reserved.
//

#import "BMKMapController.h"

@interface BMKMapController ()
<
BMKMapViewDelegate
>
@property (weak, nonatomic) IBOutlet BMKMapView *myMapView;
@end

@implementation BMKMapController
- (void)viewDidLoad {
    self.myMapView.delegate = self;
    
    BMKPointAnnotation *bmkPointAnnotation = [BMKPointAnnotation new];
    bmkPointAnnotation.coordinate = self.annotationCoordinate;
    [self.myMapView addAnnotation:bmkPointAnnotation];
    
    [self.myMapView setZoomLevel:18];
    [self.myMapView setCenterCoordinate:self.annotationCoordinate];
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    BMKPinAnnotationView *bmkPinAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    return bmkPinAnnotationView;
}
@end
