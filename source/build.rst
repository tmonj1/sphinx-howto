=============================================
ドキュメントのビルド
=============================================

ビルド手順と国際化対応について説明します。

1. ドキュメントのビルド
=================================

VSCode から Terminal を開き、/docs フォルダに移動します (デフォルトでこのフォルダが開かれているはずです)。
そこで ``make html`` コマンドを実行します。ビルドが成功すると `build/html` フォルダにHTMLが出力されます。

.. sourcecode:: bash

  $ make html

2. 自動ビルド
=================================

autobuild エクステンションをインストールしているので、ソースファイルが変更されるたびに自動ビルドすることもできます。
自動ビルドを有効にするには、``autobuild <sourceフォルダ> <buildフォルダ>`` を実行します。

.. sourcecode:: bash

  $ sphinx-autobuild source build

コマンドを打つといったんビルドが実行され、``localhost:8080`` でページが参照できるようになります。以降、ソースファイルを更新するごとにビルドが実行されるので、``localhost:8080`` をリロードすればすぐに結果が見られるようになります。ポート番号を変更したいときは、`--port` オプションで
ポート番号を指定してください。

`sphinx-autobuild` は Makefile に `livehtml` として定義してあるので、以下のコマンドでもOKです。

.. sourcecode:: bash

  $ make livehtml

autobuild についての詳しい情報はこちらを参照してください： `sphinx-autobuild <https://pypi.org/project/sphinx-autobuild/>`_

3. 国際化対応
=================================

Sphinxでは、日本語で作成した文書の英語版や中国語版を簡単に作成できます。手順は以下のとおりです。

1. まず通常通り日本語で文書を作成

2. ``make gettext`` コマンドを実行して翻訳カタログファイル (.pot) を作成
   
  * .potファイルは /build/gettext フォルダに出力されます

3. ``sphinx-intl update -p build/gettext -l en`` を実行し、翻訳カタログ (.pot) から翻訳済みカタログファイル (.po) を作成

  * 英語のときは "-l en"、日本語は "-l ja"、中国語は "-l zh_CN" です。
  * .poファイルは /source/local/en/ フォルダに出力されます。(日本語はja、中国語はzh_CNフォルダ)

4. 翻訳済みカタログファイルはオリジナル言語のテキスト(最初に日本語で作成したときは日本語)から文を一つ一つ抽出したものです。これらの文を一つ一つ英語に翻訳します。

  * それぞれの文ごとに原文が "msgid"、翻訳文が "msgstr" に入るようになっている (初期状態では msgstr はすべて空)。翻訳するときは msgid の原文を見ながら翻訳を msgstr に入れていくという手順になる。

  ::

    #: ../../source/index.rst:7
    msgid "目次"
    msgstr "Table of Contents"
    
    #: ../../source/index.rst:3
    msgid "Sphinxによるドキュメント作成"
    msgstr "Documentation with Sphinx

5. ``make -e SPHINXOPTS="-D language='en'" html`` で英語版の文書をビルド

  * 日本語のときは language='ja'、中国語のときは language='zh_CN' を指定

6. (optional) 言語ごとに画像を差し替えることもできます。たとえば、image1.png という画像を英語版では別の画像に差し替えたいときは、英語版画像を ``image1.en.png`` のように拡張子の手前に言語コード (en/ja/zh_CN) を入れて保存しておきます。Sphinxは英語版ビルド時に image1.png という画像を見ると、まず image1.en.png を探してあればそれを使い、なければ image1.png を使います。

  * 各国語版の画像ファイルの命名規則は conf.py の figure_language_filename の設定で変更できます。詳しくは公式マニュアルを参照してください。
  * `Sphinx公式ページ - 国際化 <https://www.sphinx-doc.org/ja/master/usage/advanced/intl.html#>`_