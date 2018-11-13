# Description

In use github, this script change your secret key automaticaly by repository user.  

# Installation
Download `gits.sh`, and make this script executable.  

Set alias (edit bashrc and so on)  
```
# ex)
alias gits="/path-to-gits-repository/gits.sh"

# or replace git command
alias git="/path-to-gits-repository/gits.sh"
```

If you use `ghq` command, you should set as follow.
```
# ex)
alias ghq_get="/path-to-gits-repository/ghq_get.sh"
```


# Usage
Beforehand, please copy `config_template` to `config`.  
And set your secret key information.  
  
Set your default secret key on `defaultKey`.  
Set your special secret keys on specialKeys, format as `OwnerName::UseKey`.  
(OwnerName is repository owner user or team name.)  
  
```
ex)
defaultKey="~/.ssh/id_rsa"
specialKeys=(
  'mildjester::~/.ssh/mine_key'
  'mildjester2::~/.ssh/mine_key2'
)
```
  
For example, if you set `mildjester::~/.ssh/sample_key`.  
You use `~/.ssh/sample_key` as secret key when you execute git command for my GitHub repository.  
  
You can use This script as `git` command.  
```
gits clone git@github.com:hoge/fuga.git
gits pull
gits push

ghq_gets git@github.com:hoge/fuga.git
```
