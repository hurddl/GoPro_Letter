#!/usr/bin/env bash

#CREATED BY DAVID HURD | DAVIDLEEHURD@GMAIL.COM | 323-445-0792

#launch agent com.gopro.letter starts this script when a drive is mounted

#manually populate this array with GoPro camera letters and corresponding serial numbers
camera_list=("A" "C3161354573174" "B" "C3161385557862" "C" "C3162325151167")

serial_number=''
gopro_camera_letter=''

#get path of last mounted drive
gopro_drive_name=$(mount)
gopro_drive_name=${gopro_drive_name##*/} #remove everything before drive name
gopro_drive_name=${gopro_drive_name%" ("*} #remove everything after drive name

version_file_path="/Volumes/$gopro_drive_name/MISC/version.txt"

#if a GoPro version.txt file exists in the correct location
#get the camera's serial number
if [ -f "$version_file_path" ]
  then
    file_contents=$(cat "$version_file_path")
    serial_number=${file_contents#*"camera serial number\":\""} #remove everything before serial number
    serial_number=${serial_number%\"*} #remove everything after serial number

    #search serial number array, get camera letter
    for i in ${!camera_list[@]}; do
      if [ ${camera_list[$i]} = $serial_number ]; then
        gopro_camera_letter=${camera_list[$i - 1]}
      fi
    done

    #display dialog with camera letter, or notify user of unrecognized serial number
    if [[ "$gopro_camera_letter" = '' ]]
      then
        osascript -e 'display dialog "This GoPro is not recognized." buttons {"OK"} default button "OK"'
      else
        osascript -e 'display dialog "This card is from GoPro camera '"$gopro_camera_letter"'." buttons {"OK"} default button "OK"'
    fi

fi
