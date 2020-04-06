import UIKit
import LightboxV2

class ViewController: UIViewController {
  
  lazy var showButton: UIButton = { [unowned self] in
    let button = UIButton()
    button.addTarget(self, action: #selector(showLightbox), for: .touchUpInside)
    button.setTitle("Show me the lightbox", for: UIControl.State())
    button.setTitleColor(UIColor(red:0.47, green:0.6, blue:0.13, alpha:1), for: UIControl.State())
    button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 30)
    button.frame = UIScreen.main.bounds
    button.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    view.backgroundColor = UIColor.white
    view.addSubview(showButton)
  }
  
  // MARK: - Action methods
  
  @objc func showLightbox() {
    let images = [
      LightboxImage(imageURL: URL(string: "https://cdn.arstechnica.net/2011/10/05/iphone4s_sample_apple-4e8c706-intro.jpg")!),
      LightboxImage(
        image: UIImage(named: "photo1")!,
        text: "Photography is the science, art, application and practice of creating durable images by recording light or other electromagnetic radiation, either electronically by means of an image sensor, or chemically by means of a light-sensitive material such as photographic film"
      ),
      LightboxImage(
        image: UIImage(named: "photo2")!,
        text: "Emoji 😍 (/ɪˈmoʊdʒi/; singular emoji, plural emoji or emojis;[4] from the Japanese 絵文字えもじ, pronounced [emodʑi]) are ideograms and smileys used in electronic messages and web pages. Emoji are used much like emoticons and exist in various genres, including facial expressions, common objects, places and types of weather 🌅☔️💦, and animals 🐶🐱",
        videoURL: URL(string: "https://dev1rockjrcmobstgape.blob.core.windows.net/attachments-a0d91f06-9f03-42c2-a9b0-5c5dec5ddd94/d9377862-73cb-4e94-9e06-8393285f6e20.mp4?sv=2017-04-17&sr=b&si=readonly&sig=GcwKZRjF2FuGaX3O1cA2SSDKC%2FdttbC7MwJIJ8Scc2s%3D&se=2020-01-20T09%3A36%3A53Z"), isEditable: false
      ),
      LightboxImage(
        image: UIImage(named: "photo3")!,
        text: "A lightbox is a translucent surface illuminated from behind, used for situations where a shape laid upon the surface needs to be seen with high contrast."
      ),
      LightboxImage.init(text: "PDF",otherFileURL:URL(string: "https://gahp.net/wp-content/uploads/2017/09/sample.pdf"), isEditable: false)
    ]
    
    LightboxConfig.DeleteButton.enabled = true
    LightboxConfig.EditButton.enabled = true
    
    let controller = LightboxController(images: images)
    controller.dynamicBackground = true
    controller.actionDelegate = self
    controller.modalPresentationStyle = .fullScreen
    present(controller, animated: true, completion: nil)
  }
}

extension ViewController:LightboxControllerActionDelegate{
    func lightboxController(_ controller: LightboxController, didEdit image: LightboxImage, at index: Int) {
        
    }
    
    func lightboxController(_ controller: LightboxController, didDelete image: LightboxImage, at index: Int) {
        
    }
    
    
}
