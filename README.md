# arnes-notes [![Build](https://github.com/bahlo/arnes-notes/actions/workflows/build.yml/badge.svg)](https://github.com/bahlo/arnes-notes/actions/workflows/build.yml)

This is my personal collection of notes. Check it out at 
[notes.arne.me](https://notes.arne.me).

## Inspiration
* [Andy's working notes](https://notes.andymatuschak.org/About_these_notes)
* [Jethro's Braindump](https://braindump.jethro.dev) (this site's theme is based on theirs).
* [Bruno Henriques' knowledge base](https://bphenriques.github.io/knowledge-base/) ([GitHub](https://github.com/bphenriques/knowledge-base))
* [Tim Webers knowledge](https://github.com/scy/knowledge)

## How it works
The [org](org/) folder contains [Org mode](https://orgmode.org) files that use
[Org-roam](https://www.orgroam.com) to link to each other. I edit them locally
using Emacs. On push I install Emacs on CI, use 
[ox-hugo](https://ox-hugo.scripter.co) to generate hugo pages from the org 
files. I then push to the `site` branch, from where it gets picked up by
my webhost.
