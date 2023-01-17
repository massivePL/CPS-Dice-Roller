import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "diceSound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if motion == .motionShake {
                
                if !player.isPlaying {
                    playSound()
                    rollDice(dice: 0, vibStyle: .heavy)
                    rollDice(dice: 1)
                }
            }
        }
    
    @IBAction func logoTouched(_ sender: UIButton) {
        
        UIApplication.shared.open(URL(string: "https://copy-paste.software")!)
        
    }
    
    @IBAction func diceTouched(_ sender: UIButton) {
        
        if !player.isPlaying {
            
            playSound()
            let diceNumber = Int(sender.accessibilityLabel!) ?? 0
            rollDice(dice: diceNumber, vibStyle: .medium)
            
        }
    }
    
    func rollDice(dice: Int, vibStyle: UIImpactFeedbackGenerator.FeedbackStyle? = nil) {
        
        if vibStyle != nil {
            
            UIImpactFeedbackGenerator(style: vibStyle!).impactOccurred()
            
        }
        
        let diceArray = [ UIImage(imageLiteralResourceName: "DiceOne"), UIImage(imageLiteralResourceName: "DiceTwo"), UIImage(imageLiteralResourceName: "DiceThree"), UIImage(imageLiteralResourceName: "DiceFour"), UIImage(imageLiteralResourceName: "DiceFive"), UIImage(imageLiteralResourceName: "DiceSix") ]
        
        let diceNumber = [diceImageView1, diceImageView2]
       
        diceNumber[dice]!.image = diceArray.randomElement()
        
    }
    
    func playSound () {
        
                player.play()
                
    }
}
