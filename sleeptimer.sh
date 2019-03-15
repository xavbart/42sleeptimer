# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    sleeptimer.command                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xbarthe <yesthereshouldbeamailhere>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/09/08 11:12:27 by xbarthe           #+#    #+#              #
#    Updated: 2019/03/15 16:29:45 by xbarthe          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# 42sleeptimer
# This shell script fires a terminal shell timer which sleeps the Mac 
# and pings you with IFTTT or mail before you lose your spot.
# It would ping you twice every 10 minutes and then 7 minutes and 3 minutes before log off.
#
#
# add this file to, for instance, your ~/bin folder 
# (if you were not adding your ~/bin to your shell env, 
# add "export PATH=$PATH:$HOME/bin" to your .zshrc)
# chmod 755 the file so that it runs on click.
#
# # restart terminal so the command gets added
# run it by typing 'sleeptimer.sh' in your terminal
#
#########################
# Settings
#########################
# If you want to use mail
USE_MAIL=true

# If you want to use IFTTT to send notifs
USE_IFTTT=false

# replace the below key by your IFTTT webhook key as in webhooks / settings
MYKEY="ENTER_YOUR_IFTTT_WEBHOOK_KEY" 

# you need to have created a webhook applet with adequate title and body value
# here value1 and value2
MYEVENT="notif_iphone" # name of your event

#########################
# start of the script
#########################

clear
date
echo "\nIn 35 minutes I shall ping you."

if [ "$USE_IFTTT" = true ]; then
	curl --silent --show-error -X POST -H "Content-Type: application/json" \
		--data '{"value1": "Timer: Started!", "value2":"See you in 40 mins. Max."}' \
        https://maker.ifttt.com/trigger/$MYEVENT/with/key/$MYKEY
	echo "Check your notifications for the first ping now."
fi
if [ "$USE_MAIL" = true ]; then
	echo "Going to sleep. See you in 42 minutes." | mail -s 'Sleeping for 42 minutes' $LOGNAME@student.42.fr
	echo "Check your mail."
fi

sleep 1
echo "Going to sleep in 3s. [ctl]+c to stop me."
printf " 3 \033[0K\r"
sleep 1
printf " 2 \033[0K\r"
sleep 1
printf " 1 \033[0K\r"
sleep 1
clear

echo "Display sleep activated..."
pmset displaysleepnow
echo "[ctrl]+c to stop me."

# start a timer 
# sleep 10s
sleep 600
if [ "$USE_IFTTT" = true ]; then
	curl --silent --show-error -X POST -H "Content-Type: application/json" --data '{"value1": "Timer: 10 mins passed.", "value2":"32 mins left."}' \
        https://maker.ifttt.com/trigger/$MYEVENT/with/key/$MYKEY

fi
if [ "$USE_MAIL" = true ]; then
	echo "Sending mail +10min." | mail -s '10 mins passed. Remaining: 32 mins' $LOGNAME@student.42.fr
	echo "Sending mail +10min."
fi
echo "\n-- 10 min elapsed."

# 10 mins
sleep 600
if [ "$USE_IFTTT" = true ]; then
	curl --silent --show-error -X POST -H "Content-Type: application/json" --data '{"value1": "Timer: 20 mins passed.", "value2":"20 mins left."}' \
        https://maker.ifttt.com/trigger/$MYEVENT/with/key/$MYKEY
fi
if [ "$USE_MAIL" = true ]; then
	echo "Sending mail +20min." | mail -s '20 mins passed. Remaining: 22 mins' $LOGNAME@student.42.fr
	echo "Sending mail +20min."
fi
echo "\n-- 20 min elapsed."
sleep 600
echo "\n-- 30 min elapsed."
sleep 300

# send me a notif or mail  in 35 min
echo "\n-- 35 minutes! Ping + mail\n"
if [ "$USE_IFTTT" = true ]; then
	curl --silent --show-error -X POST -H "Content-Type: application/json" \
		--data '{"value1": "Timer: 35 mins passed!", "value2":"You have SEVEN left to keep your place."}' \
        https://maker.ifttt.com/trigger/notif_iphone/with/key/bwNiivzvCfGXn0B44GT6hn
fi
if [ "$USE_MAIL" = true ]; then
	echo "Sending mail +35mins." | mail -s '35 mins passed. Remaining: 7 mins' $LOGNAME@student.42.fr
fi
# send me a notif or mail in 39 min
sleep 240
echo "\n-- 39 minutes ! Ping\n"
if [ "$USE_IFTTT" = true ]; then
	curl --silent --show-error -X POST -H "Content-Type: application/json" \
		--data '{"value1": "Timer: 39 mins passed.", "value2":"Quick! 3 mins left."}' \
        https://maker.ifttt.com/trigger/$MYEVENT/with/key/$MYKEY
fi
if [ "$USE_MAIL" = true ]; then
	echo "RUN, FORREST, RUN!" | mail -s '39 mins passed. Remaining: THREE mins' $LOGNAME@student.42.fr
fi