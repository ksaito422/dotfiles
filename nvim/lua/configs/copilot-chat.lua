local status_ok, chat = pcall(require, "CopilotChat")
if not status_ok then
  return
end

local select = require("CopilotChat.select")
chat.setup({
  debug = true,
  proxy = nil,
  allow_insecure = false,
  model = "gpt-4o",
  agent = "copilot",
  temperature = 0.1,
  window = {
    layout = "vertical",
    title = "Copilot Chat",
    width = 0.3,
    height = 0.3,
    border = "rounded",
  },
  prompts = {
    Explain = {
      prompt = "/COPILOT_EXPLAIN 選択したコードの説明を段落をつけて書いてください。",
    },
    Fix = {
      prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードに書き換えてください。",
    },
    Optimize = {
      prompt = "/COPILOT_OPTIMIZE 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。",
    },
    Docs = {
      prompt = "/COPILOT_DOCS 選択したコードのドキュメントを日本語で書いてください。使用するプログラミング言語に最も適したドキュメントスタイルを使用してください（例：JavaScriptのJSDoc、Rubyのrdocなど）",
    },
    Tests = {
      prompt = "/COPILOT_TESTS 選択したコードの詳細な単体テスト関数を書いてください。",
    },
    Review = {
      prompt = "/COPILOT_REVIEW 選択したコードをレビューしてください。コードの問題点、改善点、およびその他のコメントを書いてください。",
    },
  },
})
