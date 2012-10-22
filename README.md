sack
====

s(hortcut)-ack: a faster way to use ack (and grep)!

sack acts as a wrapper for ack to provide convenience for the repetitive menial tasks

## What is ack?

ack is the replacement for grep!

Here is why you should use ack over grep: http://betterthangrep.com/

(Now that you are sold on ack) To install ack in a one-line script:

    curl http://betterthangrep.com/ack-standalone > ~/bin/ack && chmod 0755 !#:3

## How to Install:

Open a terminal and run the following:

    git clone git@github.com:sampson-chen/sack.git && cd sack && chmod +x install_sack.sh && ./install_sack.sh

## How to Use:

You can use sack in exactly the same way you currently use ack! Woot!

For why sack is faster (and more fun!) to use, read on about its main / side features...

## Main Feature 1 - Shortcuts:

sack prefixes shortcut tags to ack's search results:

    user@linux:~/src$ sack thumbnail

    ... (omitted results)
    /home/user/src/reviewboard/reviewboard/attachments/mimetypes.py
    [13] 6:from djblets.util.templatetags.djblets_images import thumbnail
    [14] 120:    def get_thumbnail(self):
    [15] 125:        return mark_safe('<pre class="file-thumbnail"></pre>')
    [16] 135:    def get_thumbnail(self):
    [17] 136:        """Returns a thumbnail of the image."""
    [18] 137:        return mark_safe('<img src="%s" class="file-thumbnail" alt="%s" />'
    [19] 138:                         % (thumbnail(self.attachment.file, size='1000x1000'),
    [20] 146:    def get_thumbnail(self):
    [21] 157:        return mark_safe('<pre class="file-thumbnail">%s</pre>'

Now, instead of having to spend time tediously navigating to some deep directory and typing out the file name, simply do:

    user@linux:~$ F 21

And sack will open the file associated with that particular search result with your favorite editor (-cough-vim-cough-) and even go to the right line for you automatically. (It doesn't have to be "F", see config file for reassigning the shortcut command)

The repetitive 10-15 sec chore has now been reduced to only 2 keystrokes (~1 second)!! More importantly, now you won't lose your train of throught from mentally context switching from the task at hand to deal with menial things like typing out a file path. Yay productivity!!

(For why removing such distractions is important to coding "in the zone", see the excellent Joel Test: http://www.joelonsoftware.com/articles/fog0000000043.html)

### Cross-Terminal Shortcuts:

Note that whenever you perform a search in any terminal with sack, you can use the shortcuts in all other terminals (including new ones).

So now you can use one terminal to keep the search results open for reference, and use other terminals to open the files with shortcuts!

## Main Feature 2 - Profiles:

About Profiles:

Profiles allow you to specify "preset" flags and directories, so you don't have to waste keystrokes typing them out each time, or having to change directories to include the folders you need to search.

For example:

    user@linux:~$ sack -sp RB

will switch you to the "RB" profile. Now any searches via sack will run with this profile's preset flags (e.g. flags="-ia -A 2 -B 3") and under this profile's preset directories (e.g. directories="~/src/reviewboard/ ~/src/rbtools ~/src/djblets")

Now suppose you are working under some deep directory in terminal:

    user@linux:~/src/reviewboard/reviewboard/reviews/management/commands/diffs$

and you wanted to search the all relevant codebases to find all locations where a particular function is invoked.

 The old options were:

- cd to ~/src/, run ack there, and then later cd back to ~/src/reviewboard/reviewboard/reviews/management/commands/diffs$ (arggggghh!!!)
- typing out this on the prompt: ack -i pattern1 ~/src/reviewboard/ ~/src/rbtools ~/src/djblets
- opening a new terminal to run ack

Now you can simply do:

    user@linux:~/src/...//.../diffs$ sack pattern1

And the rest is taken care of for you.

Note: The `no_profile` profile is special: it never uses any preset flags or search directories. sack behaves exactly like ack while under `no_profile` (except for the shortcuts)

### Which Profile?

To find out which profile you are currently on:

    sack -wp
    sack --whichprofile
 
### Switch Profile

To switch to a different profile (`no_profile` is the empty profile):

    sack -sp PROFILE_NAME
    sack --switchprofile no_profile
 
### Rename Profile

To rename the current profile:

    sack -rp NEW_PROFILE_NAME
    sack --renameprofile ReviewBoard
 
### Set Flags

To set new preset flags to use for the current profile:
(All searches run using this profile will use these flags)

    sack -sf NEW_FLAGS
    sack --setflags
 
### Set Directory

To set new preset directory(s) to use for the current profile:
(All searches will be run under this directory with this profile)

    sack -sd DIRECTORY_1 DIRECTORY_2 DIRECTORY_3
    sack --setdirectory ~/src/reviewboard ~/src/rbtools ~/src/djblets
 
### Add New Profile

To add a new empty profile:

    sack -anp PROFILE_NAME
    sack --addnewprofile ReviewBoard
 
### List Profiles

To show the current available profiles:

    sack -lp
    sack --listprofiles

## ToDo:

Additional features / functionalities to be implemented:

- Implement support for other editors (emacs, sublimeText etc)
- Implement high-light for vim for the searchword when following a shortcut
- Functionality for deleting a profile
- Functionality for searching for multiple directories
- Check that the user has ~/bin in their path
- Add a check in `install_sack.sh` to also install ack if it's not already on the system.
- Finish implementation for a decrement count for the beginner msg so it displays a certain number of times at the start
- (Suggest a feature that you want for sack!)
