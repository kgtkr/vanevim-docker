[@Vane11ope](https://twitter.com/Vane11ope)さんのVimの設定をDocker化しました。

## Build
```
$ sudo docker build -t vanevim .
```

## Run
```
$ docker run --rm -t -i -v $PWD:/home/vim/workdir vanevim bash
$ vim hoge.cpp
```