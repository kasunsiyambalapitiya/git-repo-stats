# git-repo-stats

This is a script that can be used to exactly identify the no of lines that have been added, deleted and modified in a git repository
from a specific period of time in the past to the current state of the repository and to obtain percentages of them to the total no of lines in the
repository. Since this script is not using any third party programs (cloc and etc) this script is highly durable.

**Installation Prerequisites**

Prior to using this program you need to have installed git in your system. You can follow this [link](https://git-scm.com/downloads) to install git relevant to your  system.

Since this script use awk commands your system must be able to run awk languages. If your are using a Linux based system they already comes with mawk pre installed so you don’t need to install it again, but if your are using Windows platform follow this [link](http://gnuwin32.sourceforge.net/packages/gawk.htm) to install awk in your Windows platform.

**Running the program**

To use this script, first you need to clone the repository that you wish to get statistics if you don't have it in a local drive.
Once after cloning is done you can run this script with the giving absolute location of the cloned repository and the relevant time
period that you wish to get statistics as command line arguments.

For example lets say I have a cloned repository in my `/home/kasun/workspace/clonedRepo` location and I need to get the statistics 
about the no of lines added, deleted and modified from 6 months ago. Then I need to run the script in the terminal by giving the
relevant arguments as follows,

`./getStats.sh /home/kasun/workspace/clonedRepo 6 months ago`

then the output will be as follows :-


no of lines changed 6118

no of lines added 141893

no of lines deleted 112403

total no of lines in the repo 425987

percentage of lines changes-----------------------

percentage of changed lines 1 %

percentage of added lines 33 %

percentage of deleted lines 26 %




Note: if you use this script against a huge repository containing of thousands of lines to get the percentage of line modifications,
additions and deletions that occured few weeks back ( 2 or 3 weeks back), sometimes the percenatages displayed will be close to 0, 
but the exact no of line changes will be displayed for your reference.
