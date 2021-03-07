# godaddy-dyndns
A short script for when you can't afford a Dyn DNS service

**Necessary to instal 'jq'**
### Necessary modifications
Wherever you see a tag (<>) you must change the tag for whatever it says (domain, keys, ...)
### Functionality
This scripts is great as a trick for whenever you can't or don't know how to stablish a Dyn DNS or can't afford a static public IP.

It bassically uses [ipinfo.com](ipinfo.com) for obtaining the public IP of the server and compares it to the IP stored in goDaddy DNS server. If it deffers, it changes the IP using GoDaddy API (in the scripts it changes the '@' and 'mail' entries, but you can add more or remove the ones here).

