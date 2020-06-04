# GoPro_Letter
v .1

Tracks GoPro serial numbers and assigned camera letters.

### I rebuilt this script in Swift as a macOS menu bar application. It has improved performance, added functionality, and a UI for managing cameras. You can download it at www.dhurd.com.

The PKG installer found under the "Releases" tab is the easiest way to  install the script. The main script and launch agent are available on Github for viewing, but the PKG will automatically put both files in the correct locations.

The installer creates two files on your system. One is the main script (GoPro_Letter.sh), which is located at /Library/DevTools/. The other is a launch agent, located at ~/Library/LaunchAgents/.

The launch agent listens for a disk mount. When it detects one, it runs the script. An issue with launch agents is they  only run a script every 10 seconds. If you connect multiple cards one after another, it’ll be 10 seconds between each identification dialog popup.

TO ADD YOUR OWN SERIAL NUMBERS AND LETTERS, open GoPro_Letter.sh in a text editor. Your Library folder might be hidden, so you can navigate there by opening a Finder window, pressing CMD-SHIFT-G, and typing “/Library/DevTools” in the box. Near the top of the script you’ll see a variable called “camera_list”. That’s the array that holds the letter/number combinations. It’s populated with dummy numbers. The camera letter precedes the serial number with which it’s associated. Change the letters and serial numbers to match your project’s serial numbers and assigned letters, being sure to keep the formatting as it appears in the script. You can add or remove letter/number combinations, just follow the established pattern, paying attention to proper quotes and spaces.

TO FIND YOUR GOPRO’S SERIAL NUMBER, format a card in the camera. The GoPro creates a “version.txt” file that contains some camera-specific information. You can find the serial number there.


Feel free to reach out with questions, problems, or feature requests. I'm planning to add functionality and ease-of-use as I have time to develop this script. Use at your own risk!


David Hurd
davidleehurd@gmail.com
