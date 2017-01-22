import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
   // var nsTimerObject = Timer.scheduledTimer(timeInterval: 5, target: self, selector: "goToNext()", userInfo: nil, repeats: false)

    func fade() {
        image.alpha = 1
        UIView.animate(withDuration: 3, animations: {
            self.image.alpha = 0
            self.nameLabel.alpha = 0
        }, completion: { finished in
            self.performSegue(withIdentifier: "toCompany", sender: self)
        })
    }
    
    func goToNext() {
        
    }
    
    var number = 1
    var isAnimating = false
    
    func animate () {
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   nsTimerObject.fire()
        fade()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
