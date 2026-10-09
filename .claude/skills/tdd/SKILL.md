---
name: tdd
description: コード実装を進める時に先にテストコードを書いてから実装する。
---

# TDD(Test-Driven Development) スキル

t-wada が推奨する Red-Green-Refactor を そのリポジトリ固有のルールと矛盾しない形で回す。

## Gotchas（最初に読む）

実装前に必ず認識しておくこと。これを誤ると RED が出ない / GREEN なのに本番で壊れる。

このtddスキルは汎用スキルのため、リポジトリにtddスキルが存在する場合、そちらの定義も参照し、そちらの制約を守る。


## 基本原則

- **テストを先に書く**: 実装より先に「失敗するテスト」を必ず書く
- **小さなステップ**: 1 サイクルで進める範囲は最小に絞る（仮実装 → 三角測量 → 明白な実装）
- **TODO リスト**: 着手前に思いつく振る舞いを TODO として書き出し、上から1つずつテストにする
- **不安をテストに変換**: 「壊れそう」「わかりにくい」と感じた箇所を最初のテストに
- **リファクタリングは緑のときだけ**: テストが green な状態でしか構造を変えない

## Red-Green-Refactor サイクル

### 🔴 1. RED — 失敗するテストを書く

期待する振る舞いを RSpec(もしくはjest, vitest) で表現し、**実行して意図通りに失敗する**ことを確認する。

```ruby
RSpec.describe Crew, type: :model do
  describe '#full_name' do
    it 'returns "<last> <first>"' do
      crew = build(:crew, first_name: '太郎', last_name: '山田')
      expect(crew.full_name).to eq '山田 太郎'
    end
  end
end
```

**RED ゲート**（実装に進む前に必ず通過）:

1. テスト対象がコンパイル/ロードに成功している
2. 新規/変更したテストが実際に実行されている
3. 失敗が **意図したビジネスロジックの欠如** に起因している（unrelated な構文エラー / setup ミスではない）

> RED が想定外の理由で失敗したり、いきなり通ってしまうとき → [references/red_gate.md](references/red_gate.md) を読む。判定フローと偽 RED の典型例を持っている。

### 🟢 2. GREEN — 最小実装でテストを通す

「テストを通す最短のコード」だけ書く。複雑なロジックは後回し、まず動かす。

```ruby
class Crew < ApplicationRecord
  def full_name
    "#{last_name} #{first_name}"
  end
end
```

実行して green を確認したら次のサイクルへ。仮実装 → 三角測量 で別の入力に対するテストを追加し、振る舞いが一般化されてから「明白な実装」へ収束させる。

### 🔧 3. REFACTOR — 緑のまま改善

重複排除・命名改善・抽出。各小ステップで `bundle exec rspec <target>` を実行し、green を維持していることを確認する。

## Git チェックポイント

各ステージごとにコミットを作る。

| ステージ | コミット例 |
|---------|-----------|
| RED 確認後 | `test: add reproducer for Crew#full_name` |
| GREEN 確認後 | `fix: implement Crew#full_name` |
| Refactor 後 | `refactor: clean up Crew#full_name` |

> コミットメッセージや squash の方針で迷ったとき、または migration を含むサイクルを進めるとき → [references/git_checkpoints.md](references/git_checkpoints.md)。

## 完了基準チェックリスト

- [ ] TODO リストに沿って小さなサイクルで進めた
- [ ] 各 RED が「コンパイル + 実行 + 意図通りの失敗」を満たした
- [ ] 各ステージで `test:` / `fix:` / `refactor:` のコミットを作った
- [ ] エッジケース（nil / 空 / 境界値 / 異常系）を少なくとも 1 つテストした
- [ ] 同じ振る舞いを複数の層の spec で確かめていない（下の層の分岐と継承元の振る舞いは繰り返さず、上の層は自分の振る舞いとつながりを確かめる）
- [ ] テストが独立して実行できる（順序依存なし）

## 参考

- ユーザー方針: 「TDD を採用し t-wada の推奨するやり方を遵守する」「常にステップ毎にコミットする」
