# What is vim-bubbles?
[vim-bubbles][what-vim-bubbles] is a plugin for the Vim editor.
It mimics a well known feature, to my knowledge introduced by [Textmate][what-textmate],
later adopted by Sublime Text, sometimes called «text bubbling».
A set of keys allows the user to move portions of lines vertically in normal and visual mode.
In addition horizontal «bubbling» is possible, too - actually it is simple indentation mapped
to a defined set of keys.

[what-vim-bubbles]:https://github.com/frace/vim-bubbles
[what-textmate]: https://github.com/textmate/textmate

## Get it!
If you don't use a plugin manager, I recommend to use [vim-plug][getit-vimplug].
Else I'm pretty sure you know how your personal plugin management works. ;)

[getit-vimplug]: https://github.com/junegunn/vim-plug


## Configuration
```
" Choose an arbitrary leader key - default <C>.
let g:bubbles_leader = '<C>'

" Choose a set of keys: 'hjkl' || 'arrows' - default 'hjkl'.
let g:bubbles_keyset = 'hjkl'
```

## Usage
Default mappings reflect actions below:
+ `<C-h>`: Indents one or more lines.
+ `<C-j>`: Moves one or more lines down.
+ `<C-k>`: Moves one or more lines up.
+ `<C-l>`: Unindents one or more lines.

## Bugs
You are welcome to report bugs at the [project bugtracker][bugs-tracker] at github.com.

[bugs-tracker]: https://github.com/frace/vim-bubbles/issues


## Credits:
+ Plugin name inspired by [Drew Neil's vimcast episode «Bubbling text»][related-1]
+ Plugin idea inspired by [Textmate][related-2]

[related-1]: http://vimcasts.org/episodes/bubbling-text/
[related-2]: https://github.com/textmate/textmate
