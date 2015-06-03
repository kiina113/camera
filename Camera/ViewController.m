//
//  ViewController.m
//  Camera
//
//  Created by KINARI NISHIYAMA on 2015/06/03.
//  Copyright (c) 2015年 KINARI NISHIYAMA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
    //画像の縦横の比率が変わらないようにする
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    
}


-(IBAction)takePhoto{
    //画像の取得先をカメラに設定
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    //フォトライブラリーが使用可能かどうか
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]){
        
        //UIImagePickerController を初期化・生成
        //init意味調べる
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        //画像の取得先
        picker.sourceType = sourceType;
        //デリゲートを設定
        picker.delegate = self;
        //フォトライブラリーをモーダルビューとして表示
        //意味調べる
        [self presentViewController:picker animated:YES completion:nil];
        
    }
}



-(IBAction)openLibrary{
    
    UIImagePickerControllerSourceType souceType = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([UIImagePickerController isSourceTypeAvailable:souceType]){
        UIImagePickerController *picker =[[UIImagePickerController alloc]init];
        picker.sourceType = souceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
    
    
}


-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    //UIViewに撮った写真を表示
    imageView.image = image;
    [[picker presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
    //カメラモードの場合
    if (picker.sourceType ==UIImagePickerControllerSourceTypeCamera){
        
        //渡されてきた画像を表示
        UIImageWriteToSavedPhotosAlbum(image,
                                       self,
                                       @selector(targetImage:didFinishSavingWithError:contextInfo:),
                                       NULL);
}
}


-(void)targetImage:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)context{

        
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [[picker presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}
    
    
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
