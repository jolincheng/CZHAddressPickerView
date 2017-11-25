//
//  ViewController.m
//  CZHAddressPickerView
//
//  Created by 程召华 on 2017/11/24.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import "ViewController.h"
#import "CZHAddressPickerView.h"
#import "AddressPickerHeader.h"
@interface ViewController ()

@property (nonatomic, copy) NSString *province;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, copy) NSString *area;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//省份，
- (IBAction)provinceWithoutInput:(id)sender {
    
 
    [CZHAddressPickerView provincePickerViewWithProvinceBlock:^(NSString *province) {

        [sender setTitle:[NSString stringWithFormat:@"%@",province] forState:UIControlStateNormal];
    }];
    
    
}

- (IBAction)provinceWithInput:(id)sender {
    
    CZHWeakSelf(self);
    [CZHAddressPickerView provincePickerViewWithProvince:self.province provinceBlock:^(NSString *province) {
        CZHStrongSelf(self);
        self.province = province;
        
        
        [sender setTitle:[NSString stringWithFormat:@"%@",province] forState:UIControlStateNormal];
    }];
    
}


- (IBAction)cityWithoutInput:(id)sender {
    
    [CZHAddressPickerView cityPickerViewWithCityBlock:^(NSString *province, NSString *city) {
        [sender setTitle:[NSString stringWithFormat:@"%@%@",province,city] forState:UIControlStateNormal];
    }];
    
}

- (IBAction)cityWithInput:(id)sender {
    CZHWeakSelf(self);
    [CZHAddressPickerView cityPickerViewWithProvince:self.province city:self.city cityBlock:^(NSString *province, NSString *city) {
        CZHStrongSelf(self);
        self.province = province;
        self.city = city;
        
        [sender setTitle:[NSString stringWithFormat:@"%@%@",province,city] forState:UIControlStateNormal];
    }];
}

- (IBAction)areaWithoutInput:(id)sender {
    
    [CZHAddressPickerView areaPickerViewWithAreaBlock:^(NSString *province, NSString *city, NSString *area) {
        [sender setTitle:[NSString stringWithFormat:@"%@%@%@",province,city,area] forState:UIControlStateNormal];
    }];
}

- (IBAction)areaWithInput:(id)sender {
    CZHWeakSelf(self);
    [CZHAddressPickerView areaPickerViewWithProvince:self.province city:self.city area:self.area areaBlock:^(NSString *province, NSString *city, NSString *area) {
        CZHStrongSelf(self);
        self.province = province;
        self.city = city;
        self.area = area;
        
        [sender setTitle:[NSString stringWithFormat:@"%@%@%@",province,city,area] forState:UIControlStateNormal];
    }];
}





@end
