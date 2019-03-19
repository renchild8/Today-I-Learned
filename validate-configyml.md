# .circleci/config.ymlの検証


### local-cliをインストール
```bash
curl -fLSs https://circle.ci/cli | bash
```
参考:https://circleci.com/docs/2.0/local-cli/

出力
```
Starting installation.
Installing CircleCI CLI v0.1.5490
Installing to /usr/local/bin
/usr/local/bin/circleci
```

---

### 検証
```bash
circleci config validate
```
出力
```
Config file at .circleci/config.yml is valid.
```
