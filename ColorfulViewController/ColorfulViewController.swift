//
//  ColorfulViewController.swift
//  ColorfulViewController
//
//  Created by Sam on 11/30/15.
//  Copyright © 2015 Ding Sai. All rights reserved.
//

import UIKit

class ColorfulViewController: UIViewController {
    
    let gradientLayer1 = CAGradientLayer();
    let gradientLayer2 = CAGradientLayer();
    let gradientLayer3 = CAGradientLayer();
    let gradientLayer4 = CAGradientLayer();
    let signTriangleLayer = CAShapeLayer();
    let loginTriangleLayer = CAShapeLayer();
    
    
    var TopLeftHue:CGFloat = 61;
    var TopRightHue:CGFloat = 42;
    var BottomLeftHue:CGFloat = 148;
    var BottomRightHue:CGFloat = 93;
    
    
    
    var step:CGFloat = 10.0;
    var count:CGFloat = 0;
    var addValue:CGFloat = 0;
    
    var timer:NSTimer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initGradientLayers()
        
        changeColor();
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "animation", userInfo: nil, repeats: true);
        
        // Do any additional setup after loading the view.
    }
    
    //初始化
    func initGradientLayers(){
        
        
        
        
        
        
        
        let gradientLocations = [0.0, 1.0]
        let frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
        
        gradientLayer1.locations = gradientLocations
        gradientLayer1.startPoint = CGPointMake(0.0, 0.0);
        gradientLayer1.endPoint = CGPointMake(0.25 , 0.25);
        gradientLayer1.frame = frame;
        
        
        gradientLayer2.locations = gradientLocations
        gradientLayer2.startPoint = CGPointMake(0.0, 1.0);
        gradientLayer2.endPoint = CGPointMake(1.0, 0.0);
        gradientLayer2.frame = frame;
        
        gradientLayer3.locations = gradientLocations
        gradientLayer3.startPoint = CGPointMake(0.0, 0.0);
        gradientLayer3.endPoint = CGPointMake(1.0, 1.0);
        gradientLayer3.frame = frame;
        
        gradientLayer4.locations = gradientLocations
        gradientLayer4.startPoint = CGPointMake(0.0, 1.0);
        gradientLayer4.endPoint = CGPointMake(1.0, 0.0);
        gradientLayer4.frame = frame;
        
        self.view.layer.insertSublayer(gradientLayer1, atIndex: 0);
        self.view.layer.insertSublayer(gradientLayer2, atIndex: 1);
        self.view.layer.insertSublayer(gradientLayer3, atIndex: 2);
        self.view.layer.insertSublayer(gradientLayer4, atIndex: 3);
        
        //        let titleLayer = CATextLayer();
        //        titleLayer.frame = CGRectMake(0, (self.view.frame.size.width/2) - 50, self.view.frame.size.width, 100);
        //        self.view.layer.insertSublayer(titleLayer, atIndex: 4);
        //        titleLayer.foregroundColor = UIColor.whiteColor().CGColor;
        //        titleLayer.alignmentMode = kCAAlignmentCenter;
        //        titleLayer.string = "Instagram";
        
        //标题
        let title = UILabel(frame: CGRectMake(0, (self.view.frame.size.width/2) - 100, self.view.frame.size.width, 100));
        title.font = UIFont(name: "Zapfino", size: 30);
        title.textColor = UIColor.whiteColor();
        title.textAlignment = NSTextAlignment.Center;
        title.text = "Instagram"
        self.view.addSubview(title);

        //副标题
        let subtitle = UILabel(frame: CGRectMake(0, (self.view.frame.size.width/2) + 10, self.view.frame.size.width, 50));
        subtitle.font = UIFont.systemFontOfSize(15);
        subtitle.textColor = UIColor.whiteColor();
        subtitle.textAlignment = NSTextAlignment.Center;
        subtitle.text = "登录就能查看好友的照片和视频";
        self.view.addSubview(subtitle);

        //注册按钮
        let signButton = UIButton(frame: CGRectMake(0, self.view.frame.size.width - 50, self.view.frame.size.width/2 ,50));

        signButton.setTitle("注册", forState: UIControlState.Normal);
        signButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
        signButton.addTarget(self, action: "signButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(signButton);
        let signTrianglePath = UIBezierPath();
        let point_x = self.view.frame.size.width / 4;
        let point_y = self.view.frame.size.width - 10;
        signTrianglePath.moveToPoint(CGPointMake(point_x, point_y));
        signTrianglePath.addLineToPoint(CGPointMake(point_x-7, point_y + 10));
        signTrianglePath.addLineToPoint(CGPointMake(point_x + 7, point_y + 10));
        signTriangleLayer.fillColor = UIColor.whiteColor().CGColor;
        signTriangleLayer.path = signTrianglePath.CGPath;
        self.view.layer.insertSublayer(signTriangleLayer, atIndex: 5);


        //登录按钮

        let loginButton = UIButton(frame: CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.width - 50, self.view.frame.size.width/2 ,50));

        loginButton.setTitle("登录", forState: UIControlState.Normal);
        loginButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
        loginButton.addTarget(self, action: "loginButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(loginButton);
        let loginTrianglePath = UIBezierPath();
        let point_x2 = self.view.frame.size.width*3 / 4;
        let point_y2 = self.view.frame.size.width - 10;
        loginTrianglePath.moveToPoint(CGPointMake(point_x2, point_y2));
        loginTrianglePath.addLineToPoint(CGPointMake(point_x2-7, point_y2 + 10));
        loginTrianglePath.addLineToPoint(CGPointMake(point_x2 + 7, point_y2 + 10));
        loginTrianglePath.addLineToPoint(CGPointMake(point_x2, point_y2));
        loginTriangleLayer.fillColor = UIColor.whiteColor().CGColor;
        loginTriangleLayer.path = loginTrianglePath.CGPath;
        loginTriangleLayer.opacity = 0;
        self.view.layer.insertSublayer(loginTriangleLayer, atIndex: 5);




    }
    
    
    
    
    

    func signButtonClicked(sender:AnyObject){

        signTriangleLayer.opacity = 1;
        loginTriangleLayer.opacity = 0;

    }

    func loginButtonClicked(sender:AnyObject){
        signTriangleLayer.opacity = 0;
        loginTriangleLayer.opacity = 1;
    }
    
    //颜色渐变
    func animation(){
        
        count += 1
        
        let yushu = Int(count / 20)
        if yushu%2 ==  0 {
            addValue += step
        }else{
            addValue -= step
        }
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(2)
        changeColor()
        CATransaction.commit()
        
    }
    
    
    //变换颜色
    func changeColor(){
        
        let red1:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let green1:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let blue1:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let color1 = UIColor.init(red: red1, green: green1, blue: blue1, alpha: 1.0).CGColor;
        
        
        let red2:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let green2:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let blue2:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let color2 = UIColor.init(red: red2, green: green2, blue: blue2, alpha: 1.0).CGColor;
        
        let red3:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let green3:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let blue3:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let color3 = UIColor.init(red: red3, green: green3, blue: blue3, alpha: 1.0).CGColor;
        
        let red4:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let green4:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let blue4:CGFloat = CGFloat(arc4random_uniform(UInt32(255))) / 255.0;
        let color4 = UIColor.init(red: red4, green: green4, blue: blue4, alpha: 1.0).CGColor;
        
        
        
        
        
        
        
//        let TopLeft = UIColor.init(hue: (TopLeftHue+addValue)/360.0, saturation: 0.99, brightness: 0.90, alpha: 1).CGColor;
//        let TopRight = UIColor.init(hue: (TopRightHue+addValue)/360.0, saturation: 0.99, brightness: 0.90, alpha: 1).CGColor;
//        let BottomLeft = UIColor.init(hue: (BottomLeftHue+addValue)/360.0, saturation: 0.98, brightness: 0.90, alpha: 1).CGColor;
//        let BottomRight = UIColor.init(hue: (BottomRightHue+addValue)/360.0, saturation: 0.95, brightness: 0.90, alpha: 1).CGColor;
        
        gradientLayer1.colors = [color1 , UIColor.clearColor().CGColor];
        gradientLayer2.colors = [color2 , UIColor.clearColor().CGColor];
        gradientLayer3.colors = [UIColor.clearColor().CGColor , color3];
        gradientLayer4.colors = [UIColor.clearColor().CGColor , color4];
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
