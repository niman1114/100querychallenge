# 100querychallenge

[データサイエンス100本ノック（構造化データ加工編）](https://github.com/rootassist/100knocks-preprocess-inSQLandPython-withColab) を **SQL（PostgreSQL）** で解いていく記録。

- ペース: 1日30分が目安。問題数は難しさで調整する
  - S-004〜S-030台: 1日5問
  - S-030台後半〜S-100: 1日3問（重いと感じたら早めに切り替える）
- 進捗: [progress.md](progress.md)
- 解答: [answers/](answers/)（1問1ファイル、`S-001.sql` など）

## 環境の作り直し

新しいセッションで以下を1回実行すると、PostgreSQLにデータベース `dsdojo_db` ができる。

```bash
bash setup.sh
```
