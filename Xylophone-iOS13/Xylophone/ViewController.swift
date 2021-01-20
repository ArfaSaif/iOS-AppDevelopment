import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
//        print("arfa")
//        print(sender)
        
        var ifa: String = sender.currentTitle!
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            sender.alpha = 1
        }
        
        playSound(a:ifa)
    }
    
    
    func playSound(a: String) {
        let url = Bundle.main.url(forResource: a, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
