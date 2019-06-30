//
//  ViewController.swift
//  AnimalSounds
//
//  Created by Natalia on 25/06/2019.
//  Copyright © 2019 Natalia Muryn. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var audioPlayer : AVAudioPlayer!
    var selectedSoundFileName = ""
    
    @IBOutlet weak var walkThroughCollectionView: UICollectionView!
    @IBOutlet weak var decoBottomLine: UIView!
    @IBOutlet weak var decoTopLine: UIView!
    @IBOutlet weak var pageTitle: UILabel!
    
    
    fileprivate var items = [Animal]()
    fileprivate var currentPage: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        walkThroughCollectionView.register(UINib.init(nibName: "WalkThroughCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "walkThroughIdentifier")
        
        self.items = self.createItems()
        
        let flowLayout = UPCarouselFlowLayout()
        
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 120, height: walkThroughCollectionView.frame.size.height - 100)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.spacingMode = .fixed(spacing: 1.0)
        
        walkThroughCollectionView.delegate = self
        walkThroughCollectionView.dataSource = self
        walkThroughCollectionView.showsHorizontalScrollIndicator = false
        walkThroughCollectionView.collectionViewLayout = flowLayout
        
        self.decoBottomLine.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 190.0/255.0, blue: 118.0/255.0, alpha: 1.0).cgColor
        self.decoBottomLine.layer.cornerRadius = 5.0
        self.decoBottomLine.center.x = -UIScreen.main.bounds.size.width / 2
        
        self.decoTopLine.layer.backgroundColor = UIColor(red: 186.0/255.0, green: 220.0/255.0, blue: 88.0/255.0, alpha: 1.0).cgColor
        self.decoTopLine.layer.cornerRadius = 5.0
        self.decoTopLine.center.x = UIScreen.main.bounds.size.width * 2
        
        self.pageTitle.alpha = 0
        
        UIView.animate(withDuration: 1.0, delay: 0.3, options: [], animations: {
            self.decoBottomLine.center.x += UIScreen.main.bounds.size.width
            self.decoTopLine.center.x -= UIScreen.main.bounds.size.width * 1.5
            self.pageTitle.alpha = 1
          },
            completion: nil
        )
    }
    
    
    fileprivate func createItems() -> [Animal] {
        let characters: [Animal] = [
            Animal(animalName: "Bear", sound: "bear"),
            Animal(animalName: "Cat", sound: "cat"),
            Animal(animalName: "Dog", sound: "dog"),
            Animal(animalName: "Frog", sound: "frog"),
            Animal(animalName: "Lion", sound: "lion"),
            Animal(animalName: "Sheep", sound: "sheep"),
            Animal(animalName: "Pig", sound: "pig"),
            Animal(animalName: "Wolf", sound: "wolf"),
            Animal(animalName: "Cow", sound: "cow")
        ]
        return characters
    }
    
    //MARK:- UICollectionView Delegates and DataSources
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = walkThroughCollectionView.dequeueReusableCell(withReuseIdentifier: "walkThroughIdentifier", for: indexPath) as! WalkThroughCollectionViewCell
        let animal = items[(indexPath as NSIndexPath).row]

        cell.labelTitle.text = animal.animalName
        cell.customButton.setTitle("Play Sound",  for: .normal)
        cell.customButton.tag = indexPath.row
        cell.customButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        cell.imgWalkthrough.image = UIImage(named: animal.sound)
        
        return cell
    }
    
    @objc func playSound(_ sender: UIButton!){
        let soundURL = Bundle.main.url(forResource: items[sender.tag].sound, withExtension: "wav")

        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)

        audioPlayer.play()
    }
}

