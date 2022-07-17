#!/usr/bin/bash

if [ ! -f ~/.config/autostart/daily-quotes.desktop ]; then
cp snap/local/.config/autostart/daily-quotes.desktop ~/.config/autostart/daily-quotes.desktop || echo "Please run the following command in order to display notifications on the start!"; echo "cp snap/local/.config/autostart/daily-quotes.desktop ~/.config/autostart/"
fi

quote=$(curl -s "https://api.quotable.io/random")
quoteAuthor=$(echo $quote | jq ".author" | tr -d '"')
quoteContent=$(echo $quote | jq ".content" | tr -d '"')
zenity --notification --text  "Daily Quote!\n$quoteContent\n\t\t\t\t\t\t\t\t\t\t\t — $quoteAuthor"