# Julialang ドキュメントの和訳

Julia [公式ドキュメント](https://docs.julialang.org/en/v1.3/)の和訳です。

Julia に入門するにあたり、ドキュメントを読んだついでに自分のペースで和訳を残しています。
開始当初(2019年7月)は、v1.1 を対象にしていましたが、こちらの翻訳は更新を凍結。現在は、2019年12月現在最新の v1.3.0 に移行しました。

翻訳途中の旧版も含めて、github pages で ビルド済み html を公開しています。

- [v1.1.1 (翻訳率 1割程度で更新停止)](https://kyokke.github.io/julialang-doc-ja/ja/v1.1/) 
- [v1.2 (翻訳率 26%で更新停止)](https://kyokke.github.io/julialang-doc-ja/ja/v1.2/)
- [v1.3 (翻訳中)](https://kyokke.github.io/julialang-doc-ja/ja/v1.3/)


## クレジット

翻訳にあたり、日本語の表現などに迷ったときには、先人の方々の訳を大いに参考にさせていただきました。

 - [mnru](https://github.com/mnru) さん v1.0 訳
   - https://github.com/mnru/julia-doc-ja-v1.0-source
   - https://mnru.github.io/julia-doc-ja-v1.0/index.html
 - [hshindo](https://github.com/hshindo) さん v0.6 訳
   - https://github.com/hshindo/julia-doc-ja-v0.6
   - https://hshindo.github.io/julia-doc-ja-v0.6/
 - [Julia Tokyo](http://julia.tokyo/) v 0.4訳
   - https://github.com/JuliaTokyo/julia-doc-ja
   - https://julia-doc-ja.readthedocs.io/ja/latest/index.html


## 翻訳時 Tips 

 - po4a によって生成された翻訳版 markdown においてリンク表記の途中で改行が挿入されてしまい、リンクエラーになる問題への対処療法
   - 改行が自動挿入できる位置を、リンク syntax の直前・直後にスペースを挿入しておく。
     - リンク syntaxそのものが 1行に収まらない長さになったときは、どうしよう..

## TODO

 - 複数バージョンのドキュメントを管理しているが、公式と同じく左サイドメニューからバージョンを切り替えたい
  - 公式と同じようにやりたいのだが、どのタイミングでドロップダウンメニューが挿入されているのだろう?


## 和訳協力/誤訳の指摘について

現時点では、個人的な取り組みの範囲で進めていますが、もし誤訳(たくさんあると思う)の指摘などしてくださる方がいらっしゃいましたら、大歓迎です。
.po ファイルの使い方をご存知の方は、直接編集してプルリクエストしてください。.poファイル編集が無理な場合は、issueでどこそこの訳が間違っている、と説明をお願いします。
