# Description

In use github, this script change your secret key automaticaly by repository user.  

# Installation
Download `gits.sh`, and make this script executable.  

set alias (edit bashrc and so on)  
```
ex)
alias gits="/path-to-gits.sh/gits.sh"
```

or deploy bin dir.  
```
ex)
ln -s /path-to-gits.sh/gits.sh /usr/local/bin/gits
```

You can also replace this script with the git command.  
```
alias git="/path-to-gits.sh/gits.sh"
or
ln -s /path-to-gits.sh/gits.sh /usr/local/bin/git
```


# Usage
Beforehand, please copy `config_template` to `config`.  
And set your secret key information.  
  
Set your default secret key on `defaultKey`.  
Set your special secret keys on specialKeys, format as `RepoUserName::UseKey`.  
  
```
ex)
defaultKey="~/.ssh/id_rsa"
specialKeys=(
  'mildjester::~/.ssh/mine_key'
  'mildjester2::~/.ssh/mine_key2'
)
```
  
For example, if you set `mildjester::~/.ssh/sample_key`.  
You use `~/.ssh/sample_key` as secret key when you execute git command for GitHub.  
  
You can use This script as `git` command.  
```
gits clone git@github.com:hoge/fuga.git
gits pull
gits push
```
