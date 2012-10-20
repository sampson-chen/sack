sack
====

s(hortcut)-ack: a faster way to use ack (and grep)!

(sack acts as a wrapper for ack to provide convenience for the repetitive menial tasks.)

## How to Install:

Open a terminal and run the following:

    git clone git@github.com:sampson-chen/sack.git && cd sack && chmod +x install_sack.sh && source install_sack.sh

## How to Use:

You can use sack in exactly the same way you currently use ack! Woot!

For why sack is faster (and more fun!) to use, read on about its main / side features...

## Main Feature:

sack prefixes shortcut tags to ack's search results:

    user@linux:~/src$ sack thumbnail
    ...
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

## Side Features:

Coming soon:

- preset support for commonly used flags, directories, excludes
