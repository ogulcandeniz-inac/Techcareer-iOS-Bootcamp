import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Beyaz arka plan rengi
        UITabBar.appearance().barTintColor = UIColor.white
        // Seçili öğe için beyaz renk
        UITabBar.appearance().tintColor = UIColor.white
        // Seçili olmayan öğeler için siyah renk
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        // Seçili öğeler için beyaz renk
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)

        if let items = tabBar.items {
            for item in items {
                if let image = item.image {
                    item.image = image.withRenderingMode(.alwaysOriginal)
                }
                // Seçili olmayan öğeler için siyah renkli ikonlar
                if let selectedImage = item.selectedImage {
                    item.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
                }
            }
        }
    }
}
