# Parchment

Parchment is a vim colorscheme inspired by Acme and Leuven.  You might like it
if you prefer light colorschemes but think black-on-white is too hard on your
eyes, or if you find most colorschemes too busy.

## Screenshots

Coming soon...

## Installation

Parchment can be installed in the same way as most other vim plugins and
colorschemes.  If you don't have a preferred method of installing vim plugins,
I recommend using [pathogen][1] to install parchment.  Once pathogen is set up,
just clone this repo into your bundle directory:

    git clone https://github.com/ajgrf/parchment ~/.vim/bundle/parchment

## Terminal Vim

If your terminal supports true colors, the easiest way to get Parchment working
is to set 'termguicolors' in your vimrc.  You can set this option per terminal
by inspecting the TERM environment variable.  For example:

    if $TERM ==# "xterm-256color"
      set termguicolors
    endif

If your terminal does not support true colors, you will need to use a matching
terminal theme, and ensure that it does not use bright colors for bold text.
The following X resources accomplish that for xterm and urxvt:

    *background:           #ffffea
    *foreground:           #000000

    *color0:               #000000
    *color1:               #880000
    *color2:               #005500
    *color3:               #663311
    *color4:               #004488
    *color5:               #770077
    *color6:               #007777
    *color7:               #eeeecc
    *color8:               #eaeaea
    *color9:               #ffeaea
    *color10:              #eaffea
    *color11:              #eeee9e
    *color12:              #cceeff
    *color13:              #ffeaff
    *color14:              #eaffff
    *color15:              #ffffea

    URxvt*intensityStyles: false
    XTerm*boldColors:      false

[1]: https://github.com/tpope/vim-pathogen

## License

The files in this repository are licensed under a permissive ISC license.  See
the LICENSE file for more details.
