# Code for Chiba Dot Org

[Code for Chiba](http://code4chiba.org) の Web サイトのソースコードです。Static Site Generator である [Middleman](http://middlemapapp.com/) を使用して、構築しています。

## 開発に参加する
Code for Chiba は、Facebook グループを利用してコミュニケーションをおこなっています。まずは、こちらのグループに参加しましょう！ そして、開発する内容を宣言しましょう。

- [Code for Chiba Facebook Group](https://www.facebook.com/groups/654182694700156/)

Web サイトのソースコードは、すべて公開しています。git clone して、開発を行いましょう。開発した内容を、各自が Web サイトへデプロイすることはできません。Pull Request しましょう！

## 使用ツール

以下を使用しますので、事前にインストールしてください。

- [Ruby](https://www.ruby-lang.org/) (推奨バージョン: 2.1)
- Middleman
- [Bower](http://bower.io/)

Middleman は、Ruby がインストールされていれば、この後の bundle でインストールするので、後回しでも OK。

## 開発ルール

以下のルールにのっとり、開発を行っています。

- HTML Template は、[Haml](http://haml.info/) を使用する
- JavaScript は、[CoffeeScript](http://coffeescript.org/) を使用する
- CSS は、[Sass](http://sass-lang.com/) を使用する

## チェックアウト後の作業

以下のコマンドを実行し、必要なモジュールをセットアップしてください。

    $ bundle install
    $ bower install

## ローカル環境で実行する

Middleman の機能を利用する

    $ middleman server

以下の URL で動作確認できます。

    http://localhost:4567/

