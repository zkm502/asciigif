# asciigif
Downloads a gif from /r/gifs, and displays it in ASCII art in the terminal.

## Installation

In particular, the script uses the utilities `wget` (to fetch the reddit and imgur content), `ffmpeg` (to split gifv/videos into frames), `convert` (from ImageMagick – to split gifs into frames), and `jp2a` (converts JPEGs to ASCII). Make sure that all of those are installed.

Drop the bash script `asciigif` into some binary folder which is included in your `$PATH`, e.g. `~/bin` or `/usr/local/bin`.

If you want to make the script run each time you open a terminal, you can append the command `asciigif` to your `~/.bashrc`.
