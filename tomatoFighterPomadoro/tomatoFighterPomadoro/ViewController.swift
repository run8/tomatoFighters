

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    // StopWatch is our model class.  Create one instance of it here.
    var watch = StopWatch()
    // Timer is a builtin class which provides timer functionality, e.g. do something once per second
    var timer = Timer()
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions / Methods
    @IBAction func resetButton(_ sender: Any) {
        watch.reset()
        updateElapsedTime()
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        print("start button tapped")
        
        // only start the watch if the watch isn't running
        if watch.isRunning() == false {
            // call watch's start function
            watch.start()
            // set the timer to fire once per 0.1 seconds and call our updateElapsedTime() function
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateElapsedTime), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        print("stop button tapped")
        
        // only stop the watch if it is running
        if watch.isRunning() {
            // stop the watch
            watch.stop()
            // tell the timer to stop firing
            timer.invalidate()
        }
    }
    
    @objc func updateElapsedTime() {
        timeLabel.text = String(format: "%.1f", watch.elapsedTime())
        
        // just for fun, another way to display is below; it will print out minutes:seconds
        //        let seconds = Int(watch.elapsedTime()) % 60
        //        let minutes = Int(watch.elapsedTime()) / 60
        //        timeLabel.text = "\(minutes):\(seconds)"
        
    }
}

