//
//  MAMapController.m
//  MapDemo
//
//  Created by Agenric on 16/7/6.
//  Copyright © 2016年 Lecarx. All rights reserved.
//

#import "MAMapController.h"

@interface Coordinate : NSObject
@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *lng;
@end

@implementation Coordinate
@end


@interface Station : NSObject
@property (nonatomic, copy) NSString *stationId;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@end

@implementation Station
@end


@interface MAMapController ()
<
MAMapViewDelegate
>
@property (weak, nonatomic) IBOutlet MAMapView *myMapView;
@end

@implementation MAMapController
- (void)viewDidLoad {
    self.myMapView.delegate = self;
    
    MAPointAnnotation *maPointAnnotation = [MAPointAnnotation new];
    maPointAnnotation.coordinate = self.annotationCoordinate;
    [self.myMapView addAnnotation:maPointAnnotation];
    
    [self.myMapView setZoomLevel:21];
    [self.myMapView setCenterCoordinate:self.annotationCoordinate];
    
    [self method];
}

-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {
    MAPinAnnotationView *maPinAnnotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    return maPinAnnotationView;
}

- (void)method {
    NSString *list = @"{\"Result\":[\
    {\"stationId\":\"7\",\"coordinate\":{\"lat\":\"39.935453\",\"lng\":\"116.492279\"}},\
    {\"stationId\":\"2363\",\"coordinate\":{\"lat\":\"39.922677\",\"lng\":\"116.516823\"}},\
    {\"stationId\":\"2364\",\"coordinate\":{\"lat\":\"39.911865\",\"lng\":\"116.482203\"}},\
    {\"stationId\":\"2365\",\"coordinate\":{\"lat\":\"39.906486\",\"lng\":\"116.476875\"}},\
    {\"stationId\":\"2366\",\"coordinate\":{\"lat\":\"39.911856\",\"lng\":\"116.471402\"}},\
    {\"stationId\":\"2367\",\"coordinate\":{\"lat\":\"39.938169\",\"lng\":\"116.508943\"}},\
    {\"stationId\":\"2368\",\"coordinate\":{\"lat\":\"39.917048\",\"lng\":\"116.532302\"}},\
    {\"stationId\":\"2369\",\"coordinate\":{\"lat\":\"39.917004\",\"lng\":\"116.534679\"}},\
    {\"stationId\":\"2370\",\"coordinate\":{\"lat\":\"39.935405\",\"lng\":\"116.494325\"}},\
    {\"stationId\":\"2371\",\"coordinate\":{\"lat\":\"39.956067\",\"lng\":\"116.462852\"}},\
    {\"stationId\":\"2372\",\"coordinate\":{\"lat\":\"39.935405\",\"lng\":\"116.494325\"}},\
    {\"stationId\":\"2373\",\"coordinate\":{\"lat\":\"39.905189\",\"lng\":\"116.459238\"}},\
    {\"stationId\":\"2374\",\"coordinate\":{\"lat\":\"39.936382\",\"lng\":\"116.499507\"}},\
    {\"stationId\":\"2375\",\"coordinate\":{\"lat\":\"39.788673\",\"lng\":\"116.324217\"}},\
    {\"stationId\":\"2376\",\"coordinate\":{\"lat\":\"39.791077\",\"lng\":\"116.340774\"}},\
    {\"stationId\":\"2377\",\"coordinate\":{\"lat\":\"39.935405\",\"lng\":\"116.494325\"}},\
    {\"stationId\":\"2378\",\"coordinate\":{\"lat\":\"39.817940\",\"lng\":\"116.290973\"}},\
    {\"stationId\":\"2379\",\"coordinate\":{\"lat\":\"39.935405\",\"lng\":\"116.494325\"}},\
    {\"stationId\":\"2380\",\"coordinate\":{\"lat\":\"39.958064\",\"lng\":\"116.289158\"}},\
    {\"stationId\":\"2381\",\"coordinate\":{\"lat\":\"39.958005\",\"lng\":\"116.287512\"}},\
    {\"stationId\":\"2382\",\"coordinate\":{\"lat\":\"39.935405\",\"lng\":\"116.494325\"}},\
    {\"stationId\":\"2383\",\"coordinate\":{\"lat\":\"39.983637\",\"lng\":\"116.309963\"}},\
    {\"stationId\":\"2384\",\"coordinate\":{\"lat\":\"39.975512\",\"lng\":\"116.491510\"}},\
    {\"stationId\":\"2385\",\"coordinate\":{\"lat\":\"39.988626\",\"lng\":\"116.477166\"}},\
    {\"stationId\":\"2386\",\"coordinate\":{\"lat\":\"39.996471\",\"lng\":\"116.482005\"}},\
    {\"stationId\":\"2387\",\"coordinate\":{\"lat\":\"39.997639\",\"lng\":\"116.480357\"}},\
    {\"stationId\":\"2388\",\"coordinate\":{\"lat\":\"40.001251\",\"lng\":\"116.463393\"}},\
    {\"stationId\":\"2389\",\"coordinate\":{\"lat\":\"40.001326\",\"lng\":\"116.462624\"}},\
    {\"stationId\":\"2390\",\"coordinate\":{\"lat\":\"39.976508\",\"lng\":\"116.318439\"}},\
    {\"stationId\":\"2391\",\"coordinate\":{\"lat\":\"39.988047\",\"lng\":\"116.333451\"}},\
    {\"stationId\":\"2392\",\"coordinate\":{\"lat\":\"40.026451\",\"lng\":\"116.309785\"}},\
    {\"stationId\":\"2393\",\"coordinate\":{\"lat\":\"40.040201\",\"lng\":\"116.307419\"}},\
    {\"stationId\":\"2394\",\"coordinate\":{\"lat\":\"39.943698\",\"lng\":\"116.308334\"}},\
    {\"stationId\":\"2395\",\"coordinate\":{\"lat\":\"39.952856\",\"lng\":\"116.323347\"}},\
    {\"stationId\":\"2396\",\"coordinate\":{\"lat\":\"39.911833\",\"lng\":\"116.476637\"}},\
    {\"stationId\":\"2397\",\"coordinate\":{\"lat\":\"39.910294\",\"lng\":\"116.476510\"}},\
    {\"stationId\":\"2398\",\"coordinate\":{\"lat\":\"40.043922\",\"lng\":\"116.303180\"}},\
    {\"stationId\":\"2399\",\"coordinate\":{\"lat\":\"39.960690\",\"lng\":\"116.297096\"}},\
    {\"stationId\":\"2400\",\"coordinate\":{\"lat\":\"39.978302\",\"lng\":\"116.460937\"}},\
    {\"stationId\":\"2401\",\"coordinate\":{\"lat\":\"40.052654\",\"lng\":\"116.301478\"}},\
    {\"stationId\":\"2402\",\"coordinate\":{\"lat\":\"39.988247\",\"lng\":\"116.340326\"}},\
    {\"stationId\":\"2403\",\"coordinate\":{\"lat\":\"39.931679\",\"lng\":\"116.453770\"}},\
    {\"stationId\":\"2404\",\"coordinate\":{\"lat\":\"39.929399\",\"lng\":\"116.460674\"}},\
    {\"stationId\":\"2405\",\"coordinate\":{\"lat\":\"39.948347\",\"lng\":\"116.424438\"}},\
    {\"stationId\":\"2406\",\"coordinate\":{\"lat\":\"39.936742\",\"lng\":\"116.431205\"}},\
    {\"stationId\":\"2407\",\"coordinate\":{\"lat\":\"39.922858\",\"lng\":\"116.432371\"}},\
    {\"stationId\":\"2408\",\"coordinate\":{\"lat\":\"39.919855\",\"lng\":\"116.454779\"}},\
    {\"stationId\":\"2409\",\"coordinate\":{\"lat\":\"39.983958\",\"lng\":\"116.304780\"}},\
    {\"stationId\":\"2410\",\"coordinate\":{\"lat\":\"39.971752\",\"lng\":\"116.306530\"}},\
    {\"stationId\":\"2411\",\"coordinate\":{\"lat\":\"40.000232\",\"lng\":\"116.352370\"}},\
    {\"stationId\":\"2412\",\"coordinate\":{\"lat\":\"39.922583\",\"lng\":\"116.442623\"}},\
    {\"stationId\":\"2413\",\"coordinate\":{\"lat\":\"39.923203\",\"lng\":\"116.444445\"}},\
    {\"stationId\":\"2414\",\"coordinate\":{\"lat\":\"39.885448\",\"lng\":\"116.461852\"}},\
    {\"stationId\":\"2415\",\"coordinate\":{\"lat\":\"39.923762\",\"lng\":\"116.450871\"}},\
    {\"stationId\":\"2416\",\"coordinate\":{\"lat\":\"39.933858\",\"lng\":\"116.439313\"}},\
    {\"stationId\":\"2417\",\"coordinate\":{\"lat\":\"39.993712\",\"lng\":\"116.470149\"}},\
    {\"stationId\":\"2418\",\"coordinate\":{\"lat\":\"39.896390\",\"lng\":\"116.461931\"}},\
    {\"stationId\":\"2419\",\"coordinate\":{\"lat\":\"39.918895\",\"lng\":\"116.451206\"}},\
    {\"stationId\":\"2420\",\"coordinate\":{\"lat\":\"39.936382\",\"lng\":\"116.499507\"}},\
    {\"stationId\":\"2421\",\"coordinate\":{\"lat\":\"39.940829\",\"lng\":\"116.435842\"}},\
    {\"stationId\":\"2422\",\"coordinate\":{\"lat\":\"39.959776\",\"lng\":\"116.291062\"}},\
    {\"stationId\":\"2425\",\"coordinate\":{\"lat\":\"39.938630\",\"lng\":\"116.493322\"}},\
    {\"stationId\":\"2427\",\"coordinate\":{\"lat\":\"40.002111\",\"lng\":\"116.468375\"}},\
    {\"stationId\":\"2430\",\"coordinate\":{\"lat\":\"39.980092\",\"lng\":\"116.490469\"}},\
    {\"stationId\":\"2431\",\"coordinate\":{\"lat\":\"39.985252\",\"lng\":\"116.458920\"}},\
    {\"stationId\":\"2434\",\"coordinate\":{\"lat\":\"40.002961\",\"lng\":\"116.406762\"}},\
    {\"stationId\":\"2436\",\"coordinate\":{\"lat\":\"39.890832\",\"lng\":\"116.467505\"}},\
    {\"stationId\":\"2438\",\"coordinate\":{\"lat\":\"39.897480\",\"lng\":\"116.319639\"}},\
    {\"stationId\":\"2439\",\"coordinate\":{\"lat\":\"39.923899\",\"lng\":\"116.354757\"}},\
    {\"stationId\":\"2442\",\"coordinate\":{\"lat\":\"39.938630\",\"lng\":\"116.492721\"}},\
    ]}";
    
    NSData *JSONData = [list dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *JSONDictionary = nil;
    
    JSONDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    NSMutableArray *JSONArray = [NSMutableArray arrayWithArray:[JSONDictionary valueForKey:@"Result"]];
    __block NSMutableArray *stationList = [NSMutableArray array];
    [JSONArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Station *station = [[Station alloc] init];
        station.stationId = [obj valueForKey:@"stationId"];
        station.coordinate = CLLocationCoordinate2DMake([[[obj valueForKey:@"coordinate"] valueForKey:@"lat"] doubleValue], [[[obj valueForKey:@"coordinate"] valueForKey:@"lng"] doubleValue]);
        [stationList addObject:station];
    }];
    
    [stationList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Station *station = (Station *)obj;
        CLLocationDistance distance = Distance2Points(MapPointForLatitude_longitude(station.coordinate.latitude, station.coordinate.longitude), MapPointForLatitude_longitude(self.annotationCoordinate.latitude, self.annotationCoordinate.longitude));
        NSLog(@"%f", distance);
    }];
    
    
    
    
    
    
    NSLog(@"%@", JSONDictionary);
}

#pragma static method
/*!
 *  @brief  计算两个投影点的距离
 *
 *  @param point1 投影点
 *  @param point2 投影点
 *
 *  @return 两点间的距离
 */
static inline CLLocationDistance Distance2Points(MAMapPoint point1, MAMapPoint point2) {
    return MAMetersBetweenMapPoints(point1, point2);
}


/*!
 *  @brief  将经纬度合成高德地图点－MAMapPoint
 *
 *  @param latitude  纬度
 *  @param longitude 经度
 *
 *  @return 对应的高德地图的点
 */
static inline MAMapPoint MapPointForLatitude_longitude(CLLocationDegrees latitude, CLLocationDegrees longitude) {
    return MAMapPointForCoordinate(CLLocationCoordinate2DMake(latitude, longitude));
}

@end
