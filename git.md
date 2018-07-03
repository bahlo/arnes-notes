# Git

## Automatically use the right commit author

This is useful when commiting with your work email on internal work projects, but want to use your private email for GitHub.

Have your default credentials in `~/.gitconfig`:
```ini
[user]
name = Arne Bahlo
email = hallo@arne.me
```

Create another file with only the changes you want in the specific directory, for example `~/.gitconfig-work`:
```ini
[user]
email = <my work email>
```

At the bottom of the file, add an `includeIf` condition for a specific path, e.g.:
```ini
[includeIf "gitdir:~/Developer/work/"]
  path = .gitconfig-work
```

The slash at the end of the directory is significant in order to include all subdirectories.

Please note that this feature is only available starting on Git [2.13](https://github.com/git/git/blob/v2.13.0/Documentation/RelNotes/2.13.0.txt)
