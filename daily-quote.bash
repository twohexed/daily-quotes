#!/usr/bin/bash

if [ ! -f ~/.config/autostart/daily-quotes.desktop ]; then
mkdir -p $SNAP_USER_DATA/.config/autostart
cp $SNAP/desktop-file.desktop $SNAP_USER_DATA/.config/autostart/daily-quotes.desktop || echo "There was an error while creating a desktop entry."
fi

quote=$(curl -s "https://api.quotable.io/random")
quoteAuthor=$(echo $quote | jq ".author" | tr -d '"')
quoteContent=$(echo $quote | jq ".content" | tr -d '"')
notify-send "Daily Quote!" "$quoteContent\n — $quoteAuthor"
