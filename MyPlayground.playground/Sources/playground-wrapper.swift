import UIKit

public let aVeryLongString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent et nulla porttitor elit fermentum finibus eget id massa. Nam ac eleifend velit, vel tincidunt massa. Phasellus eget dolor laoreet, congue metus pharetra, euismod turpis. Donec commodo bibendum velit gravida dignissim. Vestibulum eleifend sodales ex, at aliquam dolor sagittis ac. Etiam non lorem suscipit, viverra magna non, sagittis arcu. In ultrices, nunc ac convallis vestibulum."

public enum Device {
  case phone4inch
  case phone4_7inch
  case phone5_5inch
  case pad
}

public enum Orientation {
  case portrait
  case landscape
}

/**
 Creates a controller that represents a specific device, orientation with specific traits.

 - parameter device:           The device the controller should represent.
 - parameter orientation:      The orientation of the device.
 - parameter child:            An optional controller to put inside the parent controller. If omitted
 a blank controller will be used.
 - parameter additionalTraits: An optional set of traits that will also be applied. Traits in this collection
 will trump any traits derived from the device/orientation comboe specified.

 - returns: Two controllers: a root controller that can be set to the playground's live view, and a content
 controller which should have UI elements added to it
 */
public func playgroundWrapper(child: UIViewController,
                              device: Device = .phone4_7inch,
                              orientation: Orientation = .portrait,
                              contentSizeCategory: UIContentSizeCategory = .large,
                              additionalTraits: UITraitCollection = .init())
  -> UIViewController {

    let parent = UIViewController()
    parent.addChildViewController(child)

    let traits: UITraitCollection
    let parentSize: CGSize
    switch (device, orientation) {
    case (.phone4inch, .portrait):
      parentSize = .init(width: 320, height: 575)
      traits = .init(traitsFrom: [
        .init(horizontalSizeClass: .compact),
        .init(verticalSizeClass: .regular),
        .init(userInterfaceIdiom: .phone)
        ])
    case (.phone4inch, .landscape):
      parentSize = .init(width: 575, height: 320)
      traits = .init(traitsFrom: [
        .init(horizontalSizeClass: .compact),
        .init(verticalSizeClass: .compact),
        .init(userInterfaceIdiom: .phone)
        ])
    case (.phone4_7inch, .portrait):
      parentSize = .init(width: 375, height: 667)
      traits = .init(traitsFrom: [
        .init(horizontalSizeClass: .compact),
        .init(verticalSizeClass: .regular),
        .init(userInterfaceIdiom: .phone)
        ])
    case (.phone4_7inch, .landscape):
      parentSize = .init(width: 667, height: 375)
      traits = .init(traitsFrom: [
        .init(horizontalSizeClass: .compact),
        .init(verticalSizeClass: .compact),
        .init(userInterfaceIdiom: .phone)
        ])
    case (.phone5_5inch, .portrait):
      parentSize = .init(width: 414, height: 736)
      traits = .init(traitsFrom: [
        .init(horizontalSizeClass: .compact),
        .init(verticalSizeClass: .regular),
        .init(userInterfaceIdiom: .phone)
        ])
    case (.phone5_5inch, .landscape):
      parentSize = .init(width: 736, height: 414)
      traits = .init(traitsFrom: [
        .init(horizontalSizeClass: .regular),
        .init(verticalSizeClass: .compact),
        .init(userInterfaceIdiom: .phone)
        ])
    case (.pad, .portrait):
      parentSize = .init(width: 768, height: 1024)
      traits = .init(traitsFrom: [
        .init(horizontalSizeClass: .regular),
        .init(verticalSizeClass: .regular),
        .init(userInterfaceIdiom: .pad)
        ])
    case (.pad, .landscape):
      parentSize = .init(width: 1024, height: 768)
      traits = .init(traitsFrom: [
        .init(horizontalSizeClass: .regular),
        .init(verticalSizeClass: .regular),
        .init(userInterfaceIdiom: .pad)
        ])
    }

    let allTraits = UITraitCollection(traitsFrom: [
      traits,
      additionalTraits,
      .init(preferredContentSizeCategory: contentSizeCategory)
      ])
    parent.setOverrideTraitCollection(allTraits, forChildViewController: child)

    parent.view.addSubview(child.view)
    child.view.translatesAutoresizingMaskIntoConstraints = false

    parent.view.frame.size = parentSize
    parent.preferredContentSize = parentSize
    parent.view.backgroundColor = .white
    child.view.backgroundColor = .white

    parent.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      child.view.leadingAnchor.constraint(equalTo: parent.view.leadingAnchor),
      child.view.trailingAnchor.constraint(equalTo: parent.view.trailingAnchor),
      child.view.bottomAnchor.constraint(equalTo: parent.view.bottomAnchor),
      child.view.topAnchor.constraint(equalTo: parent.view.topAnchor),
      ])
    
    return parent
}
