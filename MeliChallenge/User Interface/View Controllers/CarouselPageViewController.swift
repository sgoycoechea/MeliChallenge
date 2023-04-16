//
//  CarouselPageViewController.swift
//  MeliChallenge
//
//  Created by Santiago Goycoechea on 16/4/23.
//

import UIKit

class CarouselPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pictureUrls: [String] = []
    private var items: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        populateItems()
        decoratePageControl()
        if let firstViewController = items.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - Private methods
    
    private func decoratePageControl() {
        let pc = UIPageControl.appearance(whenContainedInInstancesOf: [CarouselPageViewController.self])
        pc.currentPageIndicatorTintColor = .darkGray
        pc.pageIndicatorTintColor = .lightGray
    }
    
    private func populateItems() {
        for url in pictureUrls {
            let imageView = UIImageView()
            imageView.downloaded(from: url)
            imageView.contentMode = .scaleAspectFit
            let viewController = UIViewController()
            viewController.view = imageView
            items.append(viewController)
        }
    }
    
    // MARK: - DataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = items.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return items.last }
        guard items.count > previousIndex else { return nil }
        return items[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = items.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        guard items.count != nextIndex else { return items.first }
        guard items.count > nextIndex else { return nil }
        return items[nextIndex]
    }
    
    func presentationCount(for _: UIPageViewController) -> Int {
        return items.count
    }
        
    func presentationIndex(for _: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
              let firstViewControllerIndex = items.firstIndex(of: firstViewController) else { return 0 }
        
        return firstViewControllerIndex
    }
}
