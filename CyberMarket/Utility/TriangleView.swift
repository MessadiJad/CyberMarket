//
//  TriangleView.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//
import UIKit

class TriangleView : UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mark)

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private let mark : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.textAlignment = .center
        lbl.numberOfLines = 1
        lbl.text = "!"
        return lbl
    }()
    override func draw(_ rect: CGRect) {

        let path = UIBezierPath.init()

        // top left
        path.move(to: .init(x: 0, y: 0))

        // top right
        path.addLine(to: CGPoint(x: bounds.size.width,
                                 y: 0))

        // bottom left offset
        path.addLine(to: CGPoint(x: bounds.size.width * 0.1,
                                 y: bounds.size.height))

        
        // bottom left
        path.addLine(to: CGPoint(x: 0,
                                 y: bounds.size.height))

        // top left
        path.close()
        // change fill color here.
        UIColor.red.setFill()
        path.fill()
    }
}
