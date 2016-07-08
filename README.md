## RACE Data Examples

This project includes data sets and related configurations to run the 
[NASA RACE system](http://nasarace.github.io/race).

In order to use the examples, you first have to *once*  

1. install RACE itself from https://github.com/nasarace/race
   (please see the "Installing RACE" section on the [RACE website](http://nasarace.github.io/race))
2. install the [Git Large File Storage Extension (git-lfs)](https://git-lfs.github.com/)
3. clone this project with `git clone https://github.com/nasarace/race-data`
   (no need to build anything as this project only contains static data)

To run examples, follow these steps:

1. go to your RACE directory
2. run `./race <path-to-race-data-config>`
   (e.g. `./race ../race-data/sbs-KNUQ-070516-1417/sbs-replay-ww.conf` if you installed race-data in the
   same parent directory as RACE itself)

Explanations for each example can be found in the README.md files of the respective
sub-directories.

Subdirectory names reflect the

* type of recorded data (e.g. `sbs` for ADS-B recordings in Kinetic Base Station format)
* location (e.g. `KNUQ` as the ICAO code for Moffett Field)
* date & time recording was started (e.g. `070516-1417`)

Enjoy!

