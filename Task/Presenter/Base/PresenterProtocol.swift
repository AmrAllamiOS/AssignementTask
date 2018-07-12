//
//  PresenterProtocol.swift
//  Task
//
//  Created by Amr Mohamed Allam on 7/12/18.
//  Copyright © 2018 Amr Mohamed Allam. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterProtocol: class {
    
    /**
     * Set or attach the view to this presenter
     */
    func attachView(view: UIViewController)
    
    /**
     * Get the attached view. You should always call {@link #isViewAttached()} to check if the view
     * is
     * attached to avoid NullPointerExceptions
     */
    func getView() -> UIViewController?
    
    /**
     * Checks if a view is attached to this presenter. You should always call this method before
     */
    func isViewAttached() -> Bool
    
    /**
     * Will be called if the view controller has been destroyed. Typically this method will be invoked from
     */
    func detachView()
    
    /**
     * Load the data. Typically invokes the service method to load the desired data.
     */
    func loadViewData()
    
}
