# dynipemail
Dynamic IP notifier script


Dependecies:
1. sendemail program

2. Works with Huawei WA1003A ADSL router supplied with BSNL Broadband.

3. expect program

Workflow:

Huawei WA1003A router is hit by the IP.sh script which telnets into the router and captures the allotted WAN IP into a text file on the Linux Server. This occurs every 1 minute.

Then, the ddns.sh script compares the IP in the text file to the IP of the system. If there is a change in both IP's, an email is triggered to the saved email address in the script.
