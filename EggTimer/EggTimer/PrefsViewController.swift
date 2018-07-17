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

import Cocoa

class PrefsViewController: NSViewController {

  @IBOutlet weak var presetsPopup: NSPopUpButton!
  @IBOutlet weak var customSlider: NSSlider!
  @IBOutlet weak var customTextField: NSTextField!

  var prefs = Preferences()

  override func viewDidLoad() {
    super.viewDidLoad()
    showExistingPrefs()
  }

  func showExistingPrefs() {
    let selectedTimeInMinutes = Int(prefs.selectedTime) / 60

    presetsPopup.selectItem(withTitle: "Custom")
    customSlider.isEnabled = true

    for item in presetsPopup.itemArray {
      if item.tag == selectedTimeInMinutes {
        presetsPopup.select(item)
        customSlider.isEnabled = false
        break
      }
    }

    customSlider.integerValue = selectedTimeInMinutes
    showSliderValueAsText()
  }

  func showSliderValueAsText() {
    let newTimerDuration = customSlider.integerValue
    let minutesDescription = (newTimerDuration == 1) ? "minute" : "minutes"
    customTextField.stringValue = "\(newTimerDuration) \(minutesDescription)"
  }

  @IBAction func popupValueChanged(_ sender: NSPopUpButton) {
    if sender.selectedItem?.title == "Custom" {
      customSlider.isEnabled = true
      return
    }

    let newTimerDuration = sender.selectedTag()
    customSlider.integerValue = newTimerDuration
    showSliderValueAsText()
    customSlider.isEnabled = false
  }

  @IBAction func sliderValueChanged(_ sender: NSSlider) {
    showSliderValueAsText()
  }

  @IBAction func cancelButtonClicked(_ sender: Any) {
    view.window?.close()
  }

  @IBAction func okButtonClicked(_ sender: Any) {
    saveNewPrefs()
    view.window?.close()
  }

  func saveNewPrefs() {
    prefs.selectedTime = customSlider.doubleValue * 60
    NotificationCenter.default.post(name: Notification.Name(rawValue: "PrefsChanged"),
                                    object: nil)
  }
  
}
