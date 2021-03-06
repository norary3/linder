//
//  CalendarTableViewCell.swift
//  Lindar
//
//  Created by 박종훈 on 2017. 1. 31..
//  Copyright © 2017년 Hidden Track. All rights reserved.
//

import UIKit
import Nuke

let calendarTableViewCellHeight: CGFloat = 160

class CalendarTableViewCell: EventSimpleTableViewCell {

    @IBOutlet weak var channelThumbnailView: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(channel: Channel, event: Event) {
        if let url =  channel.thumbnailURL {
            Nuke.loadImage(with: url, into: channelThumbnailView!)
        }
        else {
            // TODO : Defalt Channel Background Asset needed
            self.channelThumbnailView.image = #imageLiteral(resourceName: "channel")
        }
        channelNameLabel.text = channel.title
        followersCountLabel.text = String(channel.followersCount)
        super.set(event: event)
    }
    
}
