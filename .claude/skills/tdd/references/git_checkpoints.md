# Git チェックポイント

> Red-Green-Refactor の各ステージで小さなコミットを作る運用ルール。

## なぜステージ毎にコミットするか

- **TDD の各段階（赤・緑・リファクタ）が証拠として残る**ので、後から「どの commit が Green だったか」が追える
- リファクタで壊した場合に直前の Green まで一発で戻れる
- レビュアーが「テストの意図」「最小実装」「構造変更」を分けて読める

## コミット 3 段（最小構成）

| ステージ | メッセージ例 | 含む変更 |
|---------|-------------|---------|
| 🔴 RED | `test: add reproducer for Crew#full_name` | 失敗するテスト 1 つ。実装コードは触らない。 |
| 🟢 GREEN | `fix: implement Crew#full_name` | テストを通す最小限の実装。テスト自体の追加変更は基本なし。 |
| 🔧 REFACTOR | `refactor: extract Crew#format_full_name` | 構造改善。テストは緑のまま。挙動を変えない。 |

> Refactor が不要なサイクルでは 2 commit でも OK。

## コミットメッセージのスタイル

- prefix（`test:` / `fix:` / `feat:` / `refactor:` / `chore:`）+ 対象 + 短い要約
- 本文に「なぜ」を必要に応じて追記。「何を変えたか」は diff で読めるので不要
- **書かないこと**:
  - 「テストが通った」「動作確認した」「rspec 通過」（自明な事後報告）
  - Claude / AI による生成物であることの注釈（不要）

良い例:

```
test: add reproducer for Crew#full_name returning Japanese order

期待されるフォーマット（姓 + 半角スペース + 名）を表現するテスト。
GREEN 化前にビジネスロジックの欠如を確認するための reproducer。
```

避ける例:

```
fix: implement full_name and tests pass

✅ tested locally
✅ all green
```

## チェックポイントの妥当性

参考リポからの輸入概念: **「commit がチェックポイントとして有効」と認める前に確認すること**。

- その commit が **現在の作業ブランチの HEAD から到達可能** であること
- その commit が **現在の TDD サイクル** に属すること（過去の無関係な作業を流用しない）
- 別ブランチや古い master 上の commit を「自分の RED 証拠」として誤認しない

ブランチを切り替えた直後・rebase 直後はとくに注意。

## squash / rewrite の扱い

- **TDD サイクル進行中は squash / rebase -i を使わない**
- Phase ごとの commit を保ったまま PR を出すのが第一選択
- レビュー後にどうしても squash したい場合は merge 直前に行い、TDD 証跡は PR のコミット履歴で確認できるようにする
- 既に push した commit を `--force` で書き換えない（ペアプロ・レビュー阻害しないように）

## 段階別の操作例

### RED 後

```bash
# spec のみ追加
git add spec/models/crew_spec.rb
git commit -m "test: add reproducer for Crew#full_name"
```

### GREEN 後

```bash
# 最小実装。spec の修正が必要だった場合は spec も含めてよい
git add app/models/crew.rb
git commit -m "fix: implement Crew#full_name"
```

### REFACTOR 後

```bash
git add app/models/crew.rb
git commit -m "refactor: extract Crew#format_full_name"
```

## チェックリスト

- [ ] RED → GREEN → (Refactor) で **3 コミット以内** に収まっている
- [ ] 各コミットメッセージに事後報告（「通った」「確認した」）が含まれていない
- [ ] commit が現在の作業ブランチに乗っている
- [ ] push 後の `--force` 書き換えをしていない

