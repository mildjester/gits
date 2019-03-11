# 概要
GitHubにて複数アカウントを利用している場合にリポジトリのユーザーやチーム毎に秘密鍵を自動で切り替えるツールです。  

# 導入方法
`gits.sh`をダウンロードし、実行権限を付与してください。  
その後、bashrcなどに以下のエイリアスを追加してください。  
```
# 設定例
alias gits="/path-to-gits-repository/gits.sh"

# gitコマンドと差し替える場合
alias git="/path-to-gits-repository/gits.sh"
```

もし`ghq`コマンドを利用している場合は以下のエイリアスも設定してください。  
```
# 設定例
alias ghqs="/path-to-gits-repository/ghqs.sh"

# ghqコマンドと差し替える場合
alias ghq="/path-to-gits-repository/ghqs.sh"
```


# 使い方
まず`config_template`をコピーして`config`を作成し、利用する秘密鍵情報を記載します。  
  
デフォルトで使う秘密鍵を`defaultKey`に設定します。  
その他の秘密鍵を使う場合はspecialKeysに`OwnerName::UseKey`形式で設定します。  
(OwnerNameには対象リポジトリの所有ユーザー、またはチーム名を指定します)  
  
```
(設定例)
defaultKey="~/.ssh/id_rsa"
specialKeys=(
  'mildjester::~/.ssh/mine_key'
  'mildjester2::~/.ssh/mine_key2'
)
```
  
例えば、`mildjester::~/.ssh/sample_key`と設定していれば  
このリポジトリ（mildjester/XXXX）に対してgitコマンドを実行すると秘密鍵は`~/.ssh/sample_key`が利用されます。  
  
このスクリプトは`git`コマンドと同様に利用できます。  
```
gits clone git@github.com:hoge/fuga.git
gits pull
gits push

ghqs get git@github.com:hoge/fuga.git
```
