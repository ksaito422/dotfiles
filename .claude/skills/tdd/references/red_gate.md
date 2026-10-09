# RED ゲート

> 実装に進む前に、テストが「正しく失敗している」ことを保証するためのゲート。

## なぜ RED ゲートが必要か

「失敗するテストを書いた」だけでは、**そのテストが本当にバグや未実装を捉えたか** は分からない。
以下のような偽の RED を見逃すと、Green 化したつもりで実は何も検証していない事態になる。

- テストファイルがロードされず一度も実行されていない
- 例外が起きているが原因は setup ミスや未定義定数
- 既存の無関係な spec が pending / fail していて、それを誤って自分の RED と認識した
- 期待値の typo で「永遠に失敗するメッセージ」になっている

RED ゲートは、これらを排除し、**意図通りの失敗** を確認する手順。

## RED ゲートの 3 条件

実装コードを 1 行でも編集する前に、以下が **すべて** 満たされていることを確認する。

1. **コンパイル/ロード成功**
   - テスト対象のファイルとテストファイルが構文エラーなくロードできる
2. **テストが実行された**
   - `bundle exec rspec <path>:<line>` で対象 example が実行ログに現れる
   - フィルタや `xit` で skip されていない
3. **意図したロジック欠如による失敗**
   - 失敗メッセージ・スタックが「期待値 vs 実際値の差」または「未実装メソッドの NoMethodError」など、**ビジネスロジックの欠如** を指している
   - `NameError: uninitialized constant Foo`（typo） / `ArgumentError`（factory 不整合） / 関連性のない他 spec の失敗 ではない

## 推奨される確認コマンド

Rspecの場合

```bash
# 対象 spec のみを実行し、行番号で example を絞る
bundle exec rspec spec/models/crew_spec.rb:42

# example の収集・フィルタ適用状況を確認したいとき
bundle exec rspec spec/models/crew_spec.rb --dry-run

# 実行されたか不安なときは --format documentation で example 名を確認
bundle exec rspec spec/models/crew_spec.rb -fd
```

## 2 種類の有効な RED

### Runtime RED（基本）

通常はこちら。テストが実行され、**期待値と異なる結果** で fail する。

```
Failures:
  1) Crew#full_name returns "<last> <first>"
     Failure/Error: expect(crew.full_name).to eq '山田 太郎'

       expected: "山田 太郎"
            got: nil
```

### Compile-time RED（許容）

新しいテストが、まだ存在しないクラス・メソッドを参照することで **コンパイル/ロード時点で失敗** する場合も RED として扱える。
ただし以下を満たすこと:

- その失敗が「意図したコードパスの不在」を直接指している
- 単なる typo や、関連 spec の壊れた依存に巻き込まれただけではない

```
NoMethodError:
  undefined method `full_name' for #<Crew ...>
```

このケースでは、最小実装でメソッドを追加することで Runtime RED に移行 → GREEN へと進む。

## 偽の RED の典型例

| 症状 | 実態 | 対処 |
|------|------|------|
| `uninitialized constant XxxFactory` | factory 名 typo | factory 名・require を修正 |
| `ActiveRecord::RecordInvalid` が想定外の場所で出る | 関連モデルの validation を考慮していない | factory に必須属性を補う |
| spec ファイル全体が collected as 0 examples | フィルタ・タグ条件で除外 | `--tag` オプションや `RSpec.configure { filter_run_when_matching ... }` を確認 |
| pending と表示される | `xit` / `skip` が残っている | `it` に直す |
| 別 spec が落ちている | DB 状態汚染 | `bundle exec rspec <自分の spec のみ>` で再実行 |

## 進行可否の判断フロー

```
失敗するテストを書いた
        │
        ▼
 bundle exec rspec で実行
        │
        ▼
   テストが実行された？ ── No ──▶ フィルタ / シンタックス確認
        │ Yes
        ▼
 失敗の原因はビジネスロジックの欠如？ ── No ──▶ setup / typo を修正してやり直す
        │ Yes
        ▼
   ✅ RED ゲート通過 → 実装フェーズへ
```

## チェックリスト

- [ ] 対象テストが実行ログに表示された
- [ ] 失敗メッセージが期待値の差 or 未実装シグナルを指している
- [ ] 関係ない spec の失敗を自分の RED と取り違えていない
- [ ] `pending` / `skip` ではない
- [ ] このタイミングで `git commit -m "test: ..."` を作った（[git_checkpoints.md](git_checkpoints.md)）

