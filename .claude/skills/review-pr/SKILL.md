---
name: review-pr
description: 現在のブランチの変更を、ビルトインの code-review（不具合）と security-review（セキュリティ）の両方でレビューし、所見を must / ask / imo / nits に分類して1つの一覧で報告するスキル。completion-gate のレビューループから呼ばれる。ユーザーが「PR をレビューして」「review-pr」「不具合とセキュリティを見て」と言った場合にも使う。
---

# PR レビュー（code-review ＋ security-review）

code-review は正しく動くかどうかの不具合だけを見て、セキュリティは見ない。security-review はセキュリティだけを見る。片方だけでは漏れが出るため、このスキルで両方を実行し、所見を1つの基準で分類する。レビューそのものは2つのスキルに任せ、このスキルの責務は実行・待ち合わせ・分類・報告だけとする。

## 引数

- レベル: `low` / `medium` / `high` / `xhigh` / `max`。code-review にそのまま渡す。省略時は `low`
- 対象: PR 番号・ブランチ名・パスがあれば code-review にそのまま渡す。省略時は現在のブランチの差分

## 手順

### 1. 対象の確定

`git status --short` で未コミットの変更を確認する。security-review は現在のブランチの変更を見るため、レビュー対象の差分をコミット済みにしてから始める（completion-gate から呼ばれた場合は確定済み）。

### 2. 2つのレビューを実行する

1. skill `code-review` を引数 `<レベル> [対象]` で実行する
2. skill `security-review` を実行する

code-review はバックグラウンドで動くことがある。両方の結果がそろうまで待ち、片方だけで報告しない。結果を予想で埋めない。

### 3. 分類する

| 出どころ | 所見 | 分類 |
|---|---|---|
| code-review | CONFIRMED（再現・根拠が確認できた不具合） | must |
| code-review | PLAUSIBLE（あり得るが確証がない不具合） | must（判定保留） |
| code-review | 再利用・簡潔化・効率などの改善提案 | imo |
| code-review | 命名・書式など好みの範囲 | nits |
| security-review | 報告された脆弱性（High / Medium） | must |
| security-review | Low、または前提条件が強く実害が限られるもの | ask |

- 反証された所見（REFUTED、または矛盾するコード行・既存のガードで否定できるもの）は一覧に載せない。除外した根拠は1行で残す
- 同じ行・同じ仕組みを指す所見は1件にまとめ、出どころを両方書く
- 判断に仕様の確認が要るものは ask にする

### 4. 報告する

所見を must → ask → imo → nits の順に並べ、各件に `file:line`・出どころ（code-review / security-review）・1文の要約・起こる場面を書く。

最後に次を1行ずつ書く。

- must の件数（うち判定保留の件数）
- 実行したレベルと、2つのレビューの両方が完了したこと

所見が0件のときも「code-review: 0件 / security-review: 0件」と出どころごとに書く。片方しか実行できなかった場合は、must ゼロとは報告せず、実行できなかった理由を書く。

## 備考

- このスキルは所見を修正しない。
