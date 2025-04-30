#!/bin/bash
TARGET="target.ine.local"
WORDLIST="/root/Desktop/wordlists/shares.txt"

if [ ! -f "$WORDLIST" ]; then
 echo "Wordlist file not exist"
 exit 1
fi

while read -r SHARE; do
 echo "[*] PROBANDO LA COMPARTICION: $SHARE"
 smbclient //$TARGET/$SHARE -N -c "ls" &>/dev/null

 if [ $? -eq 0 ]; then
  echo "[+] Anonymous access allowed for: $SHARE"
 else
  echo "[-] Access denied for $SHARE"
 fi
done < "$WORDLIST"
