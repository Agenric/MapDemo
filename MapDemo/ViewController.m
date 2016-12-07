//
//  ViewController.m
//  MapDemo
//
//  Created by Agenric on 16/7/5.
//  Copyright © 2016年 Lecarx. All rights reserved.
//

#import "ViewController.h"
#import "MAMapController.h"
#import "BMKMapController.h"
#import "QMapController.h"
#import "GMSMapController.h"

const double x_pi = 3.14159265358979324 * 3000.0 / 180.0;
@interface ViewController ()
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.coordinate = CLLocationCoordinate2DMake(39.913102, 116.462032);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"mamap"]) {
        MAMapController *maMapController = segue.destinationViewController;
        maMapController.annotationCoordinate = self.coordinate;
    } else if ([segue.identifier isEqualToString:@"bmkmap"]) {
        BMKMapController *bmkMapController = segue.destinationViewController;
        bmkMapController.annotationCoordinate = [self convertToBaiDuMapCoordinateSystemWithCoordinate:self.coordinate];
//        bmkMapController.annotationCoordinate = self.coordinate;
    } else if ([segue.identifier isEqualToString:@"qmap"]) {
        QMapController *qMapController = segue.destinationViewController;
        qMapController.annotationCoordinate = self.coordinate;
    } else if ([segue.identifier isEqualToString:@"gmsmap"]) {
        GMSMapController *gmsMapController = segue.destinationViewController;
        gmsMapController.annotationCoordinate = self.coordinate;
    }
}

- (CLLocationCoordinate2D)convertToBaiDuMapCoordinateSystemWithCoordinate:(CLLocationCoordinate2D)coordinate {
    double x = coordinate.longitude;
    double y = coordinate.latitude;
    
    double z = sqrt(x * x + y * y) + 0.00002 * sin(y * x_pi);
    double theta = atan2(y, x) + 0.000003 * cos(x * x_pi);
    
    double baidu_lon = z * cos(theta) + 0.0065;
    double baidu_lat = z * sin(theta) + 0.006;
    
    return CLLocationCoordinate2DMake(baidu_lat, baidu_lon);
    
    //    double gaode_lon = coordinate.latitude - 0.0065;
    //    double gaode_lng = coordinate.longitude - 0.006;
    //    double z = sqrt(gaode_lon * gaode_lon + gaode_lng * gaode_lng) - 0.00002 * sin(gaode_lng * x_pi);
    //    double theta = atan2(gaode_lng, gaode_lon) - 0.000003 * cos(gaode_lon * x_pi);
    //    double tencent_lon = z * cos(theta);
    //    double tencent_lat = z * sin(theta);
    //    return CLLocationCoordinate2DMake(tencent_lat, tencent_lon);
}
@end
