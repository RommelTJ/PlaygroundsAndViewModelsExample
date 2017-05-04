//: Playground - noun: a place where people can play

import UIKit
import GridViewUI
import PlaygroundSupport

let grid = GridView()
grid.backgroundColor = .lightGray
grid.rowCount = 4
grid.columnCount = 3
grid.lineColor = .red
grid.lineWidth = 5

grid.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
PlaygroundPage.current.liveView = grid
