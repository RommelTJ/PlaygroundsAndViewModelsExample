//
//  GridView.swift
//  PlaygroundsAndViewModelsExample
//
//  Created by Rommel Rico on 5/4/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import UIKit

@IBDesignable
public class GridView: UIView {
	@IBInspectable public var rowCount: Int = 1 { didSet { setNeedsDisplay() } }
	@IBInspectable public var columnCount: Int = 1 { didSet { setNeedsDisplay() } }
	@IBInspectable public var lineColor: UIColor = .red { didSet { setNeedsDisplay() } }
	@IBInspectable public var lineWidth: CGFloat = 1.0 { didSet { setNeedsDisplay() } }
	
	override public func draw(_ rect: CGRect) {
		lineColor.set()
		rowPath?.stroke()
		columnPath?.stroke()
	}
	
	private var rowPath: UIBezierPath? {
		guard rowCount > 0 else {
			return nil
		}
		
		let rowPath = UIBezierPath()
		rowPath.lineWidth = lineWidth
		let rowHeight = bounds.size.width / CGFloat(rowCount + 1)
		for row in 1...rowCount {
			let y = rowHeight * CGFloat(row)
			let startPoint = CGPoint(x: bounds.minX, y: y)
			let endPoint = CGPoint(x: bounds.maxX, y: y)
			rowPath.move(to: startPoint)
			rowPath.addLine(to: endPoint)
		}
		
		return rowPath
	}
	
	private var columnPath: UIBezierPath? {
		guard columnCount > 0 else {
			return nil
		}
		
		let columnPath = UIBezierPath()
		columnPath.lineWidth = lineWidth
		let columnWidth = bounds.size.width / CGFloat(columnCount + 1)
		for row in 1...columnCount {
			let x = columnWidth * CGFloat(row)
			let startPoint = CGPoint(x: x, y: bounds.minY)
			let endPoint = CGPoint(x: x, y: bounds.maxY)
			columnPath.move(to: startPoint)
			columnPath.addLine(to: endPoint)
		}
		
		return columnPath
	}
	
}
