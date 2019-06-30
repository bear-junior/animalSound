//
//  WalkThroughCollectionViewCell.swift
//  AnimalSounds
//
//  Created by Natalia on 25/06/2019.
//  Copyright © 2019 Natalia Muryn. All rights reserved.
//

import UIKit

class WalkThroughCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var carouselView: UIView!
    @IBOutlet weak var imgWalkthrough: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            let width: CGFloat = 250
            let height: CGFloat = 400
            let shadowSize: CGFloat = 10
            let shadowDistance: CGFloat = 20
            let contactRect = CGRect(x: shadowSize, y: height - (shadowSize * 0.4) + shadowDistance, width: width, height: shadowSize)
            
            self.carouselView.layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
            self.carouselView.layer.shadowRadius = 5
            self.carouselView.layer.shadowOpacity = 0.2
            self.carouselView.layer.shadowColor = UIColor(red: 48.0/255.0, green: 51.0/255.0, blue: 107.0/255.0, alpha: 1.0).cgColor
            self.carouselView.layer.cornerRadius = 15.0
            self.imgWalkthrough.layer.cornerRadius = max(self.imgWalkthrough.frame.size.width / 2, self.imgWalkthrough.frame.size.height) / 2
            self.imgWalkthrough.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 190.0/255.0, blue: 118.0/255.0, alpha: 1.0).cgColor
            self.customButton.layer.cornerRadius = 10.0
        }
    }
}
