//
//  QMapController.m
//  MapDemo
//
//  Created by Agenric on 16/7/6.
//  Copyright © 2016年 Lecarx. All rights reserved.
//

#import "QMapController.h"

@interface QMapController ()
<
QMapViewDelegate,
UIGestureRecognizerDelegate
>
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) QMapView *myMapView;
@end

@implementation QMapController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    self.myMapView = [[QMapView alloc] initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:self.myMapView];
    
    self.myMapView.delegate = self;
    
    QPointAnnotation *qPointAnnotation = [QPointAnnotation new];
    qPointAnnotation.coordinate = self.annotationCoordinate;
    [self.myMapView addAnnotation:qPointAnnotation];
    
    [self.myMapView setZoomLevel:18];
    [self.myMapView setCenterCoordinate:self.annotationCoordinate];
    
    //添加手势识别
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]
                                                 initWithTarget:self
                                                 action:@selector(gestureAction:)];
    [gestureRecognizer setDelegate:self];
    [self.myMapView addGestureRecognizer:gestureRecognizer];
}

#pragma mark - Delegate & DetaSouse
- (QAnnotationView *)mapView:(QMapView *)mapView viewForAnnotation:(id<QAnnotation>)annotation {
    QPinAnnotationView *qPinAnnotationView = [[QPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    return qPinAnnotationView;
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
//点击地图时的回调
-(void)gestureAction:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint point = [gestureRecognizer locationOfTouch:0 inView:self.myMapView];
    CLLocationCoordinate2D coordinate = [self.myMapView convertPoint:point toCoordinateFromView:self.myMapView];
    NSLog(@"TapPoint at:%f,%f", point.x, point.y);
    NSLog(@"TapCoordinate at:%f,%f", coordinate.latitude, coordinate.longitude);
}
#pragma mark - Event Response

#pragma mark - Private Methods

#pragma mark - UI_Config
- (void)UI_Config {
    
}

#pragma mark - NSNotification

#pragma mark - Getter & Setter
@end
