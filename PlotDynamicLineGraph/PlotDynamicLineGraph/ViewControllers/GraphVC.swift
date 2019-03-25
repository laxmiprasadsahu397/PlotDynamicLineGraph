//
//  GraphVC.swift
//  PlotDynamicLineGraph
//
//  Created by LaxmiPrasad Sahu on 26/03/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

class GraphVC: UIViewController {

    @IBOutlet weak var lineGraph: LineGraph!
    var coordinates: [Coordinates]!
    var numberOfLinesForXaxis: Int?
    var numberOfLinesForYaxis: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Graph"
        
        
        let xMax = coordinates.max(by: { (a, b) -> Bool in
            return a.xAxis < b.xAxis
        })
        let yMax = coordinates.max(by: { (a, b) -> Bool in
            return a.yAxis < b.yAxis
        })
        guard let numberOfLinesForXaxis = numberOfLinesForXaxis else { return  }
        let deltaX = CGFloat(Int(xMax?.xAxis ?? 0) / numberOfLinesForXaxis)
        guard let numberOfLinesForYaxis = numberOfLinesForYaxis else { return  }
        let deltaY = CGFloat(Int(yMax?.yAxis ?? 0) / numberOfLinesForYaxis)
        
        var points: [CGPoint] = []
        for coordinate in coordinates {
         let point = CGPoint(x: coordinate.xAxis, y: coordinate.yAxis)
            points.append(point)
        }
        if deltaX != 0 {
         lineGraph.deltaX = deltaX
        }
        if deltaY != 0 {
         lineGraph.deltaY = deltaY
        }
        lineGraph.plot(points)
    }

}
