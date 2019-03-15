# 42sleeptimer
## For *42born2code* only, hey. Fires a terminal shell timer, which sleeps the Mac and pings you (with IFTTT or mail) before you lose your spot.

### Problem: 
Sessions on a Mac at 42 accept a stand-by time of 42 minutes before one gets automatically disconnnected. 

This should not be a problem in terms of zork in progress, as you duely commits all your work in progress with Git every now and then. So you are safe, you lose no code. Good. (You DO commit your work right ? Good.)
But when the seats are scarce and many students compete for Macs to get work done, it is frustrating to forget the time because you had this very interesting conversation about refactoring all your code to do all the tests in bitwise, and then you find that you have been disconnected. No work lost obviously, but, fair is fair, someone has pushed your stuff aside and is now working at your previous place.

### Solution:
A gentle reminder that tells you that time flies and pings you every so often to tell you how much time remains, and alerts you when it is time to come back and get back to work.
This is not preventing the disconnect, mind you. It is the equialent to starting a alarm or a timer on your phone. But if you use it, you actually put your Mac to sleep with it and the timer starts. So one command to run and you're good to go for coffee.

## What it doesn't do
It won't fetch a coffee for you. It will not make your Mac believe you are sitting at the chair. It will not take your messages and organise dinner for two at a difficult to book restaurant. It will not fall fould of the Staff_SI because it is just an improved timer

## What it does
This is a simple shell script that runs on your Mac. 

You can either run it as a `.command` file by clicking it, or as a `.sh` shell script from your `~/bin` folder.

* It first sends you an initial ping or mail, so that you feel confident it is working, 
* It will count down from 3 so that you may stop it in case you started it by mistake,
* Then it sets the Mac to sleep using `pmset displaysleepnow`, the terminal equivalent to  your beloved `ctrl`+`shift`+`eject`. 
* It will afterwards, while the screen is locked, starts couting and sends a reminder after 10 mins, 20 mins, 35 mins and, finally, THREE minutes before the end of the 42 minute period.

### Installing and running
Just drop the **sleeptimer.sh** file in your `~/bin` folder, `chmod 755` the script so that you can run it directly. 

You may want to add this `~/bin` folder to your shell ENV: 
do so by adding "`export PATH=$PATH:$HOME/bin`" to your `.[|z|k|c]shrc` file.

If you want to run it as a command (like, something you may double-click, as a app, with the thingie they call a mouse, for the GUI-inclined), you can use the **sleeptimer.command** file : it will open terminal and actually execute the `~/bin/sleeptimer.sh` shell script. This can be put, for instance, in your dock. Rename it as will. (Make sure it is also `chmod 755` so that it runs on opening.)

### Set-up:
Open **sleeptimer.sh** and make sure the options you want (mail or IFTTT) are set to `true`

### Mail: 
This uses the mail command from terminal, you need to ensure your mail is set up correctly on your Mac. _(Remember your Day 0 of Piscine C, Chapter III exercise 0)._

### IFTTT: 
This uses "Webhooks" service [from IFTTT](https://ifttt.com/maker_webhooks). You need to get your unique key for the service. You need to create an applet with the service. This is left as an exercise for the reader (I'll come back and extrapolate on this once I remember how to do it).

## DISCLAIMER
This is a really crude and horrendous script, I wrote it during my *Piscine c* because I was too stupid to watch time during my breaks, breaks I was spending drining too much coffee, trying to understand the basics of c and discussing with many various and interesting fellows piscineux. 

Not enough sleep, no idea of what I was doing, but at least I had my computer do some work for me. 

**Use at your own risk**, and don't complain if you came back too late on tuesday at 11am during another piscine and the E1 was so full that somebody jumped at your PC as soon as the login screen appeared.