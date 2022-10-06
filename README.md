# AutoControlZoom
This Project is for AutoControlZoom for older Persons to be able to enjoy ZoomMeetings without any Actions.

I started this Project for my Father in Law, that he could join the Meetings of Jehovas Witnesses by Zoom.
He is 90 Years old, and has only some Computer Knowledge, and is not longer able to leave his House.

But to give him the ability to join the Zoom Meetings, Zoom has to be started without any Action by him.

# Requirements
Software

To use this script you need Autoit > https://www.autoitscript.com/site/autoit/downloads/
- Just open the .au3 file with the AutoIt Editor. 
- Complete the file with your Login Credentials and compile it.
- Comment the not needed lines for your Setting
You could run the .exe File on the Computer you want to autostart with zoom.
You could place a shortcut on the desktop for user with basic experience.

The script runs also a Command-Line after starting Zoom, to ShutDown the PC after 9000 Seconds (150 Minutes or 2.5 Hours).

And a freeware is used to lock Keyboard and Mouse, to prevent the User from klicking around and switching Microphone on and off...  :-)
If you want to use that as well, you need to download it from here > https://keyfreeze.com/ and install it.

Hardware

If you want to run the script unattended, the PC should be started automatically by the Bios. Most Bios has the option to run a Machine by user Spezified Time.
Put the created .exe File into autostart, it will run everytime you start the PC.
The check at the beginning will only run the file is the weekday and time are correct to start the Zoom Meeting.

Questions / Bugs / Suggestions

If you have any Questions, Bugs or Suggestions please send a mail to b (dot) kohberg (a t) gmail (d ot) com
