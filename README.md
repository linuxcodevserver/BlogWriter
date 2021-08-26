# BlogWriter
With this program you can easily post to linuxcodevblog.
## 使い方
0 もし写真を使う場合：URLの取得
写真を使う場合、BlogWriterフォルダの中に「記事のタイトル-01.png（例：○○をする方法-01.png）」という名前で保存してください。
なお、複数ある場合01を他の数字にしてください。
保存したら、
./getimgurl.sh 画像の名前
を実行してください。
画像のURL（仮）が出てきます。
アップロードは./upload.shで行われます。

1 yyyy-mm-dd-タイトル.mdにhtmlかmdでブログの本文を書く
(例：2021-08-26-○○をする方法.md)

2 ./blogwriter.shを実行する
./blogwriter.sh 本文のファイル

3 ./convertc.shを実行する
./convertc.sh 本文のファイル

4 写真の移動
写真を移動させます。
./mvimg.sh 画像の名前

5 ./upload.shを実行する
./upload.sh 本文のファイル<br>
<b>もし、 「Which should be the base repository (used for e.g. querying issues) for this directory?」と聞かれたら、「okaitslinblog/okaitslinblog.github.io」と答えてください。<br>
また、「Where should we push the 'gh-pages' branch?」と聞かれたら、「Create a fork of okaitslinblog/okaitslinblog.github.io」と答えてください。<br></b>
