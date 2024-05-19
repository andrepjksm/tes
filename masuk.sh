#!/bin/bash

# Function to display progress percentage with color and process name
progress() {
  case $3 in
    "red")
      COLOR="\033[0;31m"
      ;;
    "green")
      COLOR="\033[0;32m"
      ;;
    "yellow")
      COLOR="\033[0;33m"
      ;;
    "blue")
      COLOR="\033[0;34m"
      ;;
    "magenta")
      COLOR="\033[0;35m"
      ;;
    "cyan")
      COLOR="\033[0;36m"
      ;;
    *)
      COLOR="\033[0m"
      ;;
  esac
  RESET="\033[0m"
  echo -e "${COLOR}${1} - Progress: ${2}%${RESET}"
}

# Path to the XML file
XML_FILE="/data/data/com.mobile.legends/shared_prefs/com.mobile.legends.v2.playerprefs.xml"

# Path to the backup file
BACKUP_FILE="/data/data/com.mobile.legends/shared_prefs/com.mobile.legends.v2.playerprefs.xml.bak"

# Ask user for the new value for JsonDeviceID
echo "Masukkan JsonDeviceID: Akun Unpack"
read NEW_JSON_DEVICE_ID

# Replace the old value with the new one in the XML file
echo -e "\033[0;31mMengganti Akun Via JsonDeviceID...\033[0m"
sed -i "s/<string name=\"JsonDeviceID\">.*<\/string>/<string name=\"JsonDeviceID\">$NEW_JSON_DEVICE_ID<\/string>/" $XML_FILE
progress "Mengganti Akun Via JsonDeviceID" 20 "red"

# Menghapus baris ke-142 dari file XML
echo -e "\033[0;32mMenghapus DvINFO dari file XML...\033[0m"
sed -i '142d' $XML_FILE
progress "Menghapus DvINFO" 40 "green"

# Remove the backup file
echo -e "\033[0;33mMenghapus file backup...\033[0m"
rm $BACKUP_FILE
progress "Menghapus file backup" 60 "yellow"

# Kill the Mobile Legends process
echo -e "\033[0;34mMenghentikan proses Mobile Legends...\033[0m"
pkill -f com.mobile.legends
progress "Menghentikan proses Mobile Legends" 80 "blue"

# Clear the cache of the Mobile Legends app
echo -e "\033[0;35mMenghapus cache aplikasi Mobile Legends...\033[0m"
rm -rf /data/data/com.mobile.legends/cache/*
progress "Menghapus cache aplikasi Mobile Legends" 100 "magenta"

echo -e "\033[0;36mPROSES SELESAI SILAHKAN BUKA MOBILE LEGENDS
JIKA STUCK DI LOADING CLOSE MOBILE LEGENDS TERUS BUKA LAGI.\033[0m"