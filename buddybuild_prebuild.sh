#!/usr/bin/env bash

echo "<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE plist PUBLIC '-//Apple//DTD PLIST 1.0//EN' 'http://www.apple.com/DTDs/PropertyList-1.0.dtd'>
<plist version='1.0'>
<dict>
    <key>ParseApplicationId</key>
    <string>$PARSE_APPLICATION_ID</string>
    <key>ParseClientId</key>
    <string>$PARSE_CLIENT_ID</string>
    <key>GMSApiKey</key>
    <string>$GMS_API_KEY</string>
</dict>
</plist>" > Scout/PrivateConfig.plist
