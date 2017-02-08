//
//  ChannelTableViewCell.swift
//  Linder
//
//  Created by 박종훈 on 2017. 2. 7..
//  Copyright © 2017년 Linder. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "channelCell"
let channelTableViewCellPadding: CGFloat = 10.0

class ChannelTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var channelCollectionView: UICollectionView!
    var channels: [Channel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        channelCollectionView.dataSource = self
        channelCollectionView.delegate = self
        channelCollectionView.register(UINib.init(nibName: "ChannelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
        channelCollectionView.allowsMultipleSelection = true
        channelCollectionView.contentInset = UIEdgeInsets(top: 0, left: 8.0, bottom: 0, right: 8.0)
    }
    
    // MARK: - CollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channels.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ChannelCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! ChannelCollectionViewCell
        // Configure the cell
        cell.title.text = channels[indexPath.item].title
        cell.thumbnailView.image = channels[indexPath.item].thumbnail
        
        return cell
    }
    
    // MARK: - Collection View Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell: ChannelCollectionViewCell = collectionView.cellForItem(at: indexPath) as? ChannelCollectionViewCell {
            if let channel = cell.title.text {
                cell.setSelected()
                print(channel)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell: ChannelCollectionViewCell = collectionView.cellForItem(at: indexPath) as? ChannelCollectionViewCell {
            cell.setDeSelected()
            print(cell.title.text ?? "nothing", " deselected")
        }
    }
}
