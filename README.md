# elementor.el
Emacs script to connect to [Elementor](https://github.com/andresdominguez/elementor).

To use, add to your load path and
`require ('elementor)`

This script adds `elementor-call-in-region`, which will send the current region
to a running Elementor instance as a selector and return the result (you can set
the address of the destination Elementor server by modifying the
`elementor-server` variable).

