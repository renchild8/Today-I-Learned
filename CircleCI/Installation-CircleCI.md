# CircleCI導入手順

### GitHubのアカウントとCircleCIと連携させる

### GitHubにリポジトリを作成する
```
CircleCITest
```

### GitHubからリポジトリをクローン
```bash
git clone https://github.com/{userID}/CircleCITest.git
```

### `.circleci/config.yml`を作成する
```bash
vim .circleci/config.yml
```


```yml
# .circleci/config.yml
version: 2
jobs:
  hello-world:
    macos:
      xcode: "10.0.0"

    steps:
      - checkout
      - run:
          command: echo 'Hello World !!'

workflows:
  version: 2
  hello-world:
    jobs:
      - hello-world
```

### CircleCIのProjectを作成する

`CircleCI → Add Projects`からリポジトリを選択し、「Set Up Project」

### LocalからGitHubにPushする
```
git push origin master
```

### CircleCIのJobsからJobの実行を確認
```bash
$ echo 'Hello World !!'
Hello World !!
```



