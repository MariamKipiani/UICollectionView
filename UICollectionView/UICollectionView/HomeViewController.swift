//
//  HomeViewController.swift
//  UICollectionView
//
//  Created by user on 11/3/23.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    let collectionView = UICollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "movieCell")
      
        
        view.addSubview(collectionView)
    }

    class MovieCell: UICollectionViewCell {
        let titleLabel = UILabel()
        let favoriteButton = UIButton()

        @objc func favoriteButtonTapped() {
            
        }
        

      

         
        

       

       
        }

    }


