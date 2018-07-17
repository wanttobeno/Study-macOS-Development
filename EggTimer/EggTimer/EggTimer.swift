/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

protocol EggTimerProtocol {
  func timeRemainingOnTimer(_ timer: EggTimer, timeRemaining: TimeInterval)
  func timerHasFinished(_ timer: EggTimer)
}

class EggTimer {

  var timer: Timer? = nil
  var startTime: Date?
  var duration: TimeInterval = 360      // default = 6 minutes
  var elapsedTime: TimeInterval = 0

  var isStopped: Bool {
    return timer == nil && elapsedTime == 0
  }
  var isPaused: Bool {
    return timer == nil && elapsedTime > 0
  }

  var delegate: EggTimerProtocol?

  dynamic func timerAction() {
    guard let startTime = startTime else {
      return
    }

    elapsedTime = -startTime.timeIntervalSinceNow

    let secondsRemaining = (duration - elapsedTime).rounded()

    if secondsRemaining <= 0 {
      resetTimer()
      delegate?.timerHasFinished(self)
    } else {
      delegate?.timeRemainingOnTimer(self, timeRemaining: secondsRemaining)
    }
  }

  func startTimer() {
    startTime = Date()
    elapsedTime = 0

    timer = Timer.scheduledTimer(timeInterval: 1,
                                 target: self,
                                 selector: #selector(timerAction),
                                 userInfo: nil,
                                 repeats: true)
    timerAction()
  }

  func resumeTimer() {
    startTime = Date(timeIntervalSinceNow: -elapsedTime)

    timer = Timer.scheduledTimer(timeInterval: 1,
                                 target: self,
                                 selector: #selector(timerAction),
                                 userInfo: nil,
                                 repeats: true)
    timerAction()
  }

  func stopTimer() {
    // really just pauses the timer
    timer?.invalidate()
    timer = nil

    timerAction()
  }

  func resetTimer() {
    // stop the timer & reset back to start
    timer?.invalidate()
    timer = nil

    startTime = nil
    duration = 360
    elapsedTime = 0
    
    timerAction()
  }
  
}
