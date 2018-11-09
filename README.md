# Description

In use github, this script change your secret key automaticaly by repository user.  

# Usage
Beforehand, please copy `config_template` to `config`.  
And set your secret key information formatted `RepoUserName::UseKey`.  

ex)  
```
defaultKey="~/.ssh/id_rsa"
specialKeys=(
  'mildjester::~/.ssh/mine_key'
  'mildjester2::~/.ssh/mine_key2'
)

```

You can use This script as 'git' command.  
```
gits.sh clone git@github.com:hoge/fuga.git
gits.sh pull
gits.sh push
```

# Recommend
If you set follow alias, you can use git  
```
alias git="/path-to-gits.sh/gits.sh"
```

