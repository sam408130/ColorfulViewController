# ColorfulViewController
Instagram animated background color with CAGradientLayer

###Demo
![](https://github.com/sam408130/ColorfulViewController/blob/master/giphy.gif)


###Basic

```

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
```
        
        
add 4 gradientLayer to the 4 corners

