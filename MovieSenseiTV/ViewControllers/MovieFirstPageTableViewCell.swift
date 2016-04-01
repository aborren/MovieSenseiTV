//
//  MovieFirstPageTableViewCell.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 12/12/15.
//  Copyright © 2015 dna. All rights reserved.
//

import UIKit

class MovieFirstPageTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCollectionViewDataSourceDelegate
        <D: protocol<UICollectionViewDataSource, UICollectionViewDelegate>>
        (dataSourceDelegate: D, forRow row: Int) {
            collectionView.delegate = dataSourceDelegate
            collectionView.dataSource = dataSourceDelegate
            collectionView.tag = row
            collectionView.reloadData()
    }

}
