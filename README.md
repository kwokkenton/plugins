# cyclTracker Plugin for xbar

Author: Kenton Kwok

[xbar](https://github.com/matryer/xbar) is a project that allows for the customisation of the macOS toolbar via obtaining the output of a script.

This project uses the [tfl APIs](https://api-portal.tfl.gov.uk/) to display the dock station availabilities at different Santander cycle docking stations in London. Users can customise which station to show in the script.

## Dependencies
* xbar
* Python

## How to run
1. Install the latest release of xbar
2. Put the shell inside the plugin directory at `~/Library/Application Support/xbar/plugins`
3. Make the script executable: run `chmod +x cyclTracker.3m.sh` in terminal
4. Ensure that python3 is installed with the `requests` module (`sudo pip3 install requests`)
5. Use a text editor to change the stations you wish to display
