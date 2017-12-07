# CZHAddressPickerView

![addressPickerView.gif](http://upload-images.jianshu.io/upload_images/6709174-e0b04a7c59f4b245.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#好用的地址选择器,支持省份，省市，省市区，也支持打开显示上一次选择的地址


###用法很简单，如果需要下次打开是之前选中的只要把上一次选中的地址传进去就行了，具体用法如下:
````
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
````
[博客地址](http://blog.csdn.net/hurryupcheng)
[简书地址](http://www.jianshu.com/u/2add458bf239)


