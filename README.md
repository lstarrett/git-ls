Git-ls
=======

List, with a Git status in front

## Dependencies

Requires Git, and a bash-like shell with ls

## Usage

Clone script, and alias to something easy to remember and type, like "gls"

    alias gls="/path/to/git-ls.sh"

### Considerations

This script is minimalist. It simply shims a status code in front of the "ls -lh"
output, to preserve LSCOLORS and all of ls's nice formatting. The downside
is that it is fairly inefficient. That's OK though, because computers these
days are fast!

