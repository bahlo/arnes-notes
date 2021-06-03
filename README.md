# arnes-notes [![Build](https://github.com/bahlo/arnes-notes/actions/workflows/build.yml/badge.svg)](https://github.com/bahlo/arnes-notes/actions/workflows/build.yml) [![Netlify Status](https://api.netlify.com/api/v1/badges/83ce689d-105f-475b-8262-15a25d43920a/deploy-status)](https://app.netlify.com/sites/trusting-clarke-ff475e/deploys)

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
files. I then push to the `netlify` branch, where 
[Netlify](https://www.netlify.com) picks it up and deploys to their CDN. 
I use Netlify because of the 
[_redirect](https://docs.netlify.com/routing/redirects/) functionality.
