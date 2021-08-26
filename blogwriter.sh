#!/bin/bash
sed -i -e "1i ---" $1
sed -i -e "2i layout: post" $1
read -p "タイトル> " title
sed -i -e "3i title: $title" $1
read -p "説明・概要> " description
sed -i -e "4i description: $description" $1
read -p "カテゴリ> " categories
sed -i -e "5i categories: $categories" $1
sed -i -e "6i highlight: true" $1
sed -i -e "7i disqus: true" $1
read -p "筆者のDiscordユーザー名&Discordタグ（例：okaits#7534）> " author
sed -i -e "8i author: $author" $1
sed -i -e "9i ---" $1
echo "Done."
