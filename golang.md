# Golang

## The `go get` \<meta\> tag

### How it works

Go documents the functionality here: [Remote import paths](https://golang.org/cmd/go/#hdr-Remote_import_paths).
This is the short version:

When running `go get git.domain.com/foo/bar`, go does the following:

1. Fetch `https://git.domain.com/foo/bar?go-get=1`
2. Check if that page contains a meta tag like this (could also be a https url):
```html
<meta name="go-import" content="git.domain.com git git@git.domain.com:foo/bar.git">
```
3. Verify that `git.domain.com` contains the same meta tag
4. Git clone `git@git.domain.com:foo/bar.git` into `$GOPATH/src/git.domain.com/foo`

### Problem

If you're using [dep](https://github.com/golang/dep) for packages hosted on an internal GitLab, you are going to be in trouble.
GitLab shows the https url in the meta-tag, so `go get` will prompt for authentication which in turn fails for dep, so you can't use `dep ensure`.

### Solutions

The best solution would be to be able to configure GitLab to show the ssh url instead of https. 
Until then, here are a few approaches, choose the one that fit's your flow.

#### Specify source in `Gopkg.toml`

A workaround is adding a `[[source]]` section under the package in the `Gopkg.toml` like this:

```toml
[[constraint]]
  name = "git.domain.com/foo/bar"
  version = "^1.0.0"
  source = "git@git.domain.com:foo/bar.git"
```

_Drawback:_ This makes `dep ensure` work, but `dep ensure -add <repo>` still fails, so you still have to add new packages manually in the `Gopkt.toml`.

#### Build your own discovery service

You could add your own service on some domain (e.g. `go.domain.com` or even 
add it to your company website) which contains the correct meta tag with the ssh
url.
This makes `dep ensure -add` work and doesn't require you to fiddle with the 
`Gopkg.toml` every time you add an internal package.

_Drawback:_ You have an additional service which can break.

#### Customize it in the `~/.ssh/config`

```ini
[url "git@git.domain.com:"]
  insteadOf = "https://git.domain.com"
```

_Drawback:_ You have to configure this on every host.

#### Use `.git` in your import paths

If you run `go get git.domain.com/foo/bar.git` and import it this way, i
it will fetch the git URL without checking the <meta> tag.

_Drawback:_ You have to remember adding `.git` and it's not really common.
