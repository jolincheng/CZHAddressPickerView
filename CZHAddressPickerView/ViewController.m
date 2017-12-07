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

/**
 * 只显示省份一级
 * provinceBlock : 回调省份
 */
- (IBAction)provinceWithoutInput:(id)sender {
    
 
    [CZHAddressPickerView provincePickerViewWithProvinceBlock:^(NSString *province) {

        [sender setTitle:[NSString stringWithFormat:@"%@",province] forState:UIControlStateNormal];
    }];
    
    
}
/**
 * 只显示省份一级
 * province : 传入了省份自动滚动到省份，没有传或者找不到默认选中第一个
 * provinceBlock : 回调省份
 */
- (IBAction)provinceWithInput:(id)sender {
    
    CZHWeakSelf(self);
    [CZHAddressPickerView provincePickerViewWithProvince:self.province provinceBlock:^(NSString *province) {
        CZHStrongSelf(self);
        self.province = province;
        
        [sender setTitle:[NSString stringWithFormat:@"%@",province] forState:UIControlStateNormal];
    }];
    
}

/**
 * 显示省份和市级
 * cityBlock : 回调省份和城市
 */
- (IBAction)cityWithoutInput:(id)sender {
    
    [CZHAddressPickerView cityPickerViewWithCityBlock:^(NSString *province, NSString *city) {
        [sender setTitle:[NSString stringWithFormat:@"%@%@",province,city] forState:UIControlStateNormal];
    }];
    
}
/**
 * 显示省份和市级
 * province,city : 传入了省份和城市自动滚动到选中的，没有传或者找不到默认选中第一个
 * cityBlock : 回调省份和城市
 */
- (IBAction)cityWithInput:(id)sender {
    CZHWeakSelf(self);
    [CZHAddressPickerView cityPickerViewWithProvince:self.province city:self.city cityBlock:^(NSString *province, NSString *city) {
        CZHStrongSelf(self);
        self.province = province;
        self.city = city;
        
        [sender setTitle:[NSString stringWithFormat:@"%@%@",province,city] forState:UIControlStateNormal];
    }];
}

/**
 * 显示省份和市级和区域
 * areaBlock : 回调省份城市和区域
 */
- (IBAction)areaWithoutInput:(id)sender {
    
    [CZHAddressPickerView areaPickerViewWithAreaBlock:^(NSString *province, NSString *city, NSString *area) {
        [sender setTitle:[NSString stringWithFormat:@"%@%@%@",province,city,area] forState:UIControlStateNormal];
    }];
}
/**
 * 显示省份和市级和区域
 * province,city : 传入了省份和城市和区域自动滚动到选中的，没有传或者找不到默认选中第一个
 * areaBlock : 回调省份城市和区域
 */
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
