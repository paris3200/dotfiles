# dotfiles
I manage my dot files with a bare git repo using instructions from
https://www.atlassian.com/git/tutorials/dotfiles. 

## Restore

Ensure the alias is added to shell config.  In my case, I would add it to
.zshrc.  

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Then the git repo needs to be setup.  

```
echo ".cfg" >> .gitignore
git clone --bare <git-repo-url> $HOME/.cfg
```

Add the alias to the current shell scope. 
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Checkout the contents. 
```
config checkout
```

If you receive an error about files being over written you can either back them
up if you've customized them or delete them.  

To back them up:
```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Then rerun the checkout.  

```
config checkout
```
