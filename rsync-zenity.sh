#!/bin/bash
# Nautilus script to sync specified folder to another destination via rsync.
# Put this to ~/.gnome2/nautilus-scripts 
# Written by Anton Keks
#!/bin/bash
# Nautilus script to sync specified folder to another destination via rsync.
# Put this to ~/.gnome2/nautilus-scripts
# Written by Stephen Piuk based on script  by Anton Keks

paths_file=$(readlink -f $0).paths
slash="/"
date_file=$(pwd)$slash.lastrun


#pw_dir= `pwd`
locations=`cat $paths_file`
sources=`cat $paths_file | awk -F'|' '{print $1}'`

#note this last part is so the script doesn't need to be run more than once a day needs fixing tip try putting the string
#in the dialog then run via crontab then you see it is not right ... didn't need to fix used anacron to launch it :)

datestr=`more  $date_file`

#if [ $datestr = `date +"%D"` ]; then
#exit;
#fi


echo "last date of back up was completed on the "$datestr
#export authorisation so that you can display on this monitor
export XAUTHORITY=/home/youruser888/.Xauthority
#DISPLAY=:0.0 zenity --question --text "Backup time .. is HDD connected?"

# normalize and remove trailing /


#source=`readlink -f "$source"`
#source=${source%/}

if  [ -f "$source" ]; then


DISPLAY=:0.0  zenity --error --text="$source is not a directory it is a file or invalid directory exiting script."; exit 2
fi

if [ $2 ]; then
  # TODO: support multiple sources
 DISPLAY=:0.0 zenity --warning --text="Only one directory can be synced, using $source"
fi



DISPLAY=:0.0 zenity --warning --text="Time for backing up your system . Please minimise any user tasks for a minute or so while this process occurs to avoid errors and a slow down of the archive activity you will be notified of completion by a window like this one, thanks for your patience and reading this huge dialog window, don't forget to connect any back up external drives to the USB port if you have set up those as your preferred storage device. The home (source) directory is /home/youruser888/Downloads,Pictures,Documents,Desktop,Music etc to the destination directories /mnt/D210AE5D10AE47F5 and /media/youruser888/D210AE5D10AE47F5 you can edit these paths in the Bash script file that this was run from. Last back up was performed on the date "`date +%D`". Script programming help follows "$date_file"present working directory is "`pwd`

# chage the yourUser888 to your user name and D210AE5D10AE47F5 to your backup devices string
# check your devices with ls /media

rsync -vrlptD "/home/youruser888/Backupscripts" "/media/youruser888/D210AE5D10AE47F5/youruser888"
rsync -vrlptD "/home/youruser888/Downloads" "/media/youruser888/D210AE5D10AE47F5/youruser888"
rsync -vrlptD "/home/youruser888/Pictures" "/media/youruser888/D210AE5D10AE47F5/youruser888"
rsync -vrlptD "/home/youruser888/Documents" "/media/youruser888/D210AE5D10AE47F5/youruser888"
rsync -vrlptD "/home/youruser888/Desktop" "/media/youruser888/D210AE5D10AE47F5/youruser888"
rsync -vrlptD "/home/youruser888/Music" "/media/youruser888/D210AE5D10AE47F5/youruser888"

# system sometimes mounts them on /mnt instead of /media

rsync -vrlptD "/home/youruser888/Backupscripts" "/mnt/D210AE5D10AE47F5/youruser888"
rsync -vrlptD "/home/youruser888/Downloads" "/mnt/D210AE5D10AE47F5/youruser888"
rsync -vrlptD "/home/youruser888/Pictures" "/mnt/D210AE5D10AE47F5/youruser888"
rsync -vrlptD "/home/youruser888/Documents" "/mnt/D210AE5D10AE47F5/youruser888"
rsync -vrlptD "/home/youruser888/Desktop" "/mnt/D210AE5D10AE47F5/youruser888"
rsync -vrlptD "/home/youruser888/Music" "/mnt/D210AE5D10AE47F5/youruser888"

#date +"%D" > .lastrun
date  > .lastrun
DISPLAY=:0.0 zenity --warning --text="Completed back up, you can go back to watching TV now."


