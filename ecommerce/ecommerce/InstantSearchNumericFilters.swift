//
//  InstantSearchNumericFilters.swift
//  ecommerce
//
//  Created by Guy Daher on 20/02/2017.
//  Copyright © 2017 Guy Daher. All rights reserved.
//

import Foundation
import InstantSearchCore
import UIKit

protocol InstantSearchNumericFilter {
    var filterName: String? { get set }
    var inclusive: Bool { get set }
}

class InstantSearchSlider : UISlider, InstantSearchNumericFilter {
    var filterName: String?
    var op: NumericRefinement.Operator?
    var inclusive: Bool = true
}

class InstantSearchStepper : UIStepper, InstantSearchNumericFilter {
    var filterName: String?
    var op: NumericRefinement.Operator?
    var inclusive: Bool = true
}

class InstantSearchSwitch : UISwitch, InstantSearchNumericFilter {
    var filterName: String?
    var inclusive: Bool = true
}

class InstantSearchSegmentedControl : UISegmentedControl, InstantSearchNumericFilter {
    var filterName: String?
    var op: NumericRefinement.Operator?
    var inclusive: Bool = true
}

class InstantSearchDatePicker : UIDatePicker, InstantSearchNumericFilter {
    var filterName: String?
    var op: NumericRefinement.Operator?
    var inclusive: Bool = true
}


extension InstantSearch {
    
    func addWidget(numericFilter: UIControl, forRefinement name: String) {
        numericFilter.addTarget(self, action: #selector(numericFilterValueChanged(sender:)), for: .valueChanged)
        reloadAllWidgets()
    }
    
    // TODO: Change the filter value and trigger a search! 
    internal func numericFilterValueChanged(sender: UIControl) {
        switch sender {
        case let slider as InstantSearchSlider:
            print(slider.value)
        case let mySwitch as InstantSearchSwitch:
            print(mySwitch.isOn)
        case let stepper as InstantSearchStepper:
            print(stepper.value)
        case let segmentedControl as InstantSearchSegmentedControl:
            print(segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!)
        case let datePicker as InstantSearchDatePicker:
            print(datePicker.date.timeIntervalSince1970)
        default: print("none!")
        }

    }
    // TODO: Need to have setValueForWidget...
}
