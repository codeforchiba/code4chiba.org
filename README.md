# Code for Chiba Dot Org

[Code for Chiba](http://code4chiba.org) の Web サイトのソースコードです。Static Site Generator である [Middleman](http://middlemapapp.com/) を使用して、構築しています。

## 開発に参加する

Web サイトのソースコードは、すべて公開しています。git clone して、開発を行いましょう。開発した内容を、各自が Web サイトへデプロイすることはできません。Pull Request しましょう！

## 使用ツール

以下を使用しますので、事前にインストールしてください。

- [Ruby](https://www.ruby-lang.org/)
- Middleman
- [NPM](https://www.npmjs.com/)

Middleman は、Ruby がインストールされていれば、この後の bundle でインストールするので、後回しでも OK。

## 開発ルール

以下のルールにのっとり、開発を行っています。

- HTML Template は、[Haml](http://haml.info/) を使用する
- JavaScript は、ES2015(ES6) を使用する
- CSS は、[Sass](http://sass-lang.com/) を使用する

## チェックアウト後の作業

以下のコマンドを実行し、必要なモジュールをセットアップしてください。

    $ bundle install
    $ npm install

## ローカル環境で実行する

Middleman の機能を利用する

    $ bundle exec middleman server

以下の URL で動作確認できます。Live Reload に対応しています。

    http://localhost:4567/
