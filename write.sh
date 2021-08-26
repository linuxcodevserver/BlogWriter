#!/bin/bash
echo "Blog Writer Started."
echo 'By okaits#7534'
echo "okaitslinblogに投稿します。"
read -p "日付（yyyy-mm-dd, 例: 2021-08-23(2021年8月23日)> " date
fn=$date
read -p "タイトル> " title
fn=${fn}-${title}.md
read -p "カテゴリー> " categories
read -p "筆者のDiscordのユーザー名（例：okaits#7534）> " author
echo "記事をHTMLまたはMarkDownで書いてください。"
read -p "説明を聞きますか？(yes/no)> " s
if [ $s = yes ]
  then
  echo "HTMLで書く時もMarkDownで書く時も、brタグを入れないと改行できません。注意してください。"
  echo 'また、記事の中にプログラムやコードなどを入れるには、コードの始めに「blogwriter.commands.code.start」、終わりに「blogwriter.commands.code.end」をいれてください。'
  echo 'また、blogwriter.commands.code.endだけを書くと「</pre></code>」という文字例になります。'
  echo '逆にblogwriter.commands.code.startだけを書くとこのコマンド以降全てがコードとして認識され、表示が崩れてしまいます。くれぐれもご注意ください。'
  echo 'なお、scriptタグもOKです。'
  echo '目次をいれる場所に、{% include toc.html html=content sanitize=true %}と入れて下さい。'
  echo '終了するには改行してから「blogwriter.commands.EOF」と入力してEnterキーを押してください。'
fi
echo "書き始めて下さい。"
echo "---" > $fn
echo "layout: post" >> $fn
echo "title: $title" >> $fn
echo "categories: $categories" >> $fn
echo "disqus: true" >> $fn
echo "author: $author" >> $fn
while true
  do
  read -p "> " b
  if [ "$b" = "blogwriter.commands.EOF" ]
    then
    echo "入力が終わりました。"
    break
  fi
  if [ "$b" = "blogwriter.commands.code.start" ]
    then
    echo "コードが挿入されます。"
    echo "言語はどれにしますか？"
    echo "1) Bash"
    echo "2) Html"
    echo "3) CSS"
    echo "4) Python"
    echo "5) その他(自動認識)"
    read -p "言語(1-5)> " lang
    case "$lang" in
      1) lang=" lang-bash" ;;
      2) lang=" lang-html" ;;
      3) lang=" lang-css" ;;
      4) lang=" lang-python" ;;
      5) lang="" ;;
    esac
    echo -n '<pre class="prettyprint><code class="prettyprint'${lang}'>' >> $fn
  fi
  if [ "$b" = "blogwriter.commands.code.end" ]
    then
    echo "コードが終了しました。"
    echo '</code></pre>' >> $fn
  fi
  echo $b >> $fn
  done
echo "アップロードします。"
if ls okaitslinblog > /dev/null 2>&1
  then
  echo "okaitslinblogを発見しました。cloneをキャンセルします。"
  else
  echo "okaitslinblogがありません。cloneします。"
  git clone https://github.com/okaitslinblog/okaitslinblog.github.io
  echo "cloneが終わりました。"
fi
cd okaitslinblog
git checkout gh-pages
mv ../${fn} ./_posts/
echo "アップロード処理を開始します。"
echo "もし選択肢がでたら、絶対にokaitslinblog/okaitslinblog.github.ioを選んでください。"
gh pr create --title "[add] Post" --body "Automaticaly created by blogwriter"
echo "アップロード処理が完了しました。"
exit
