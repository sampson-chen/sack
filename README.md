sag / sack
==========

s(hortcut)-ag/ack/grep: a faster way to use ag, ack, or grep!

sag / sack / sgrep act as wrappers for ag / ack / grep to provide convenience
for the repetitive menial tasks when searching through codebases via the command
line.

## Note about the Legacy Code

The original *sack* code comes from https://github.com/sampson-chen/sack

There are a few forks which fix some bugs or add some features. I find this work
very interesting and very helpful when I want to look for a pattern throught an
amount of source code files. So I decided to extract only this feature. Thus, I
dropped:

* the reference to the sackrc configuration file. I prefer the minimalist way:
  three optional environment variables ;
* the profiles management.

I tried to keep the code as simple as possible.

## What is ag?

ag is a faster version of ack!\*

\*Out of the box, it includes some additional file that ack skips by default in its searches.

To learn more about ag, and how to install it:

    https://github.com/ggreer/the_silver_searcher

## What is ack?

ack is the replacement for grep!

Here is why you should use ack over grep: http://betterthangrep.com/

(Now that you are sold on ack) To install ack in a one-line script:

    curl http://betterthangrep.com/ack-standalone > ~/bin/ack && chmod 0755 !#:3

## How to Install:

Open a terminal and run the following:

    > git clone https://github.com/garaud/sack.git
    > cd sack
    > ./install_sack.sh

Copy and make it executable the script sack, sag and F in `~/bin` by
default. You can also create symlink instead of copying.

Works fine with `gawk`. Note that [mawk](https://invisible-island.net/mawk/)
interpreter does not handle the escape sequence correctly (when parsing colored
results with a regexp).

## How to Use

You can use sag / sack in exactly the same way you currently use ag / ack! Woot!

For why sack is faster (and more fun!) to use, read on about its main / side features...

## Main Feature - Shortcuts

sag / sack prefixes shortcut tags to ag / ack's search results:

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

Now, instead of having to spend time tediously navigating to some deep directory
and typing out the file name, simply do:

    user@linux:~$ F 21

And sack will open the file associated with that particular search result with
your favorite editor (currently supports both vim and emacs).

Of course, you can rename the script filename `F` if you want to.

The repetitive 10-15 sec chore has now been reduced to only 2 keystrokes (~1
second)!! More importantly, now you won't lose your train of throught from
mentally context switching from the task at hand to deal with menial things like
typing out a file path. Yay productivity!!

(For why removing such distractions is important to coding "in the zone", see
the excellent Joel Test:
http://www.joelonsoftware.com/articles/fog0000000043.html)

Note that whenever you perform a search in any terminal with sack, you can use
the shortcuts in all other terminals (including new ones).

So now you can use one terminal to keep the search results open for reference,
and use other terminals to open the files with shortcuts!

## Screenshot

![sag Screenshot](https://github.com/garaud/sack/raw/master/screenshot.png)

## How to Configure it?

I drop all the reference to the configuration file `.sackrc`. There are just
three (optional) environment variables:

- `SACK_SHORTCUT`: the path to the file where sack stores `lineno:
  filepath`. It's `~/.sack_shortcuts` by default. This variable is used in both
  `sack` and `F` scripts.
- `SACK_EDITOR`: editor used to open file with the `F` script. Use the `EDITOR`
  environment variable by default if `SACK_EDITOR` is not defined.
- `SACK_COLORS`: special colors parameters

This is an example with Emacs and a colored `ag`:

```bash
export SACK_EDITOR="emacsclient -n"
export SACK_COLORS='--color --color-line-number=1;35;40 --color-path=1;34;40 --color-match=1;4;31;40'
```

## Editors

For now, you can use the script `F` to open a file at a specific line with:

* Emacs
* Vim
* SublimeText
* Other editors which are be able to open a file with this syntax `+lineno
  filename`

Please configure the `$SACK_EDITOR` if you needed.
