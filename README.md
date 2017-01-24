# Stash

Random things someone might find useful and that are each too small for a standalone repo.  
Code snippets, images, whatever...

Everything in this repository is placed in the public domain.

---

* `cmds`
  Some small command line scripts I wrote for myself.
  * `devvv.c` (C source file)  
    A tiny command-line tool for extracting tracks of the `vvvvvvmusic.vvv` file of the game [VVVVVV](http://store.steampowered.com/app/70300/).  
    Usage (once compiled): Run `devvv path/to/vvvvvvmusic.vvv` in a directory where you have write permission.  
    **Warning:** Absolutely no error handling in place, use at your own risk.
  * `ffmkv` (bash script)  
    Shorthand command to convert a file to [mkv](https://en.wikipedia.org/wiki/Matroska). Run with no arguments for usage info.  
    Supports (but doesn't require) `xattrcopy`.  
    Requires: [ffmpeg](https://ffmpeg.org/)
  * `ffratio` (bash script)  
    Prints a video file's resolution, e.g. `1920x1080`.  
    Requires: [ffprobe](https://ffmpeg.org/ffprobe.html)
  * `rand.c` (C source file)  
    Generates (true) random numbers or strings.  
  * `strerror.c` (C source file)  
    Get description for an error code.  
    Simply calls `strerror(3)` with the first command line argument.
  * `xattrcopy` (bash script)  
    (OS X) Copy all extended attributes from one file to another.
* `dumpstyle.js`  
  Recursively dump a DOM node's applied styles.
* ~~`UserScripts`~~ Moved [here](https://github.com/Siguza/UserScripts/).
