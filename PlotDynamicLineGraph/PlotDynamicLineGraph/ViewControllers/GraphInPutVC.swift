//
//  GraphInPutVC.swift
//  PlotDynamicLineGraph
//
//  Created by LaxmiPrasad Sahu on 26/03/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

class GraphInPutVC: UIViewController {

    @IBOutlet weak var txt_XaxisLineNumber: UITextField!
    @IBOutlet weak var txt_YaxisLineNumber: UITextField!
    @IBOutlet weak var txt_XaxisValue: UITextField!
    @IBOutlet weak var txt_YaxisValue: UITextField!
    @IBOutlet weak var tableView_axis: UITableView!

    var coordinates: [Coordinates] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView_axis.tableFooterView = UIView()
        
//         self.coordinates.append(Coordinates.init(_xAxis: 0, _yAxis: 0))
//        self.coordinates.append(Coordinates.init(_xAxis: 1, _yAxis: 4))
//        self.coordinates.append(Coordinates.init(_xAxis: 2, _yAxis: 9))
//        self.coordinates.append(Coordinates.init(_xAxis: 3, _yAxis: 19))
//        self.coordinates.append(Coordinates.init(_xAxis: 4, _yAxis: 30))
//        self.coordinates.append(Coordinates.init(_xAxis: 5, _yAxis: 39))
//        self.coordinates.append(Coordinates.init(_xAxis: 6, _yAxis: 46))
        
    }
    @IBAction func insertButtonTapped(_ sender: UIButton) {
        guard txt_XaxisValue.text != "" && txt_XaxisValue.text != "." else { return }
        guard txt_YaxisValue.text != "" && txt_YaxisValue.text != "." else { return }
        self.view.endEditing(true)
    
        self.coordinates.append(Coordinates.init(_xAxis: Double(txt_XaxisValue.text!) ?? 0, _yAxis: Double(txt_YaxisValue.text!) ?? 0))
        self.tableView_axis.reloadData()
    }
    
    @IBAction func showButtonTapped(_ sender: UIBarButtonItem) {
        guard txt_XaxisLineNumber.text != "" && txt_XaxisLineNumber.text != "." else { return }
        guard txt_YaxisLineNumber.text != "" && txt_YaxisLineNumber.text != "." else { return }
        guard let graphVc = storyboard?.instantiateViewController(withIdentifier: "GraphVC") as? GraphVC else {
            return
        }
        graphVc.coordinates = coordinates
        graphVc.numberOfLinesForXaxis = Int(txt_XaxisLineNumber.text!)
        graphVc.numberOfLinesForYaxis = Int(txt_YaxisLineNumber.text!)
        self.navigationController?.pushViewController(graphVc, animated: true)
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        self.coordinates.removeAll()
        self.tableView_axis.reloadData()
    }
    
}

extension GraphInPutVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coordinates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CoordinateCell else {
            return UITableViewCell()
        }
        let coordinate = self.coordinates[indexPath.row]
        cell.lbl_Xaxis.text = "X Value: \(coordinate.xAxis)"
        cell.lbl_Yaxis.text = "Y Value: \(coordinate.yAxis)"
        return cell
    }
    
    
}
