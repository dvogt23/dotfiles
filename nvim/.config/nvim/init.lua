-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd([[highlight @markup.heading.1.marker.markdown guibg=#FF5733 guifg=#FF5733]])
-- vim.cmd([[highlight @markup.heading.2.marker.markdown guibg=#C70039 guifg=#C70039]])
-- vim.cmd([[highlight @markup.heading.3.marker.markdown guibg=#900C3F guifg=#900C3F]])
-- vim.cmd([[highlight @markup.heading.4.marker.markdown guibg=#FFC300 guifg=#FFC300]])

require("gen").prompts["Commit summary"] = {
  prompt = function()
    local diff = vim.system({ "git", "diff", "--staged" }, { text = true }):wait()
    return "You are an expert developer specialist in creating commits. Provide a super concise one sentence overall changes summary of the user"
      .. diff.stdout
      .. "output following strictly the next rules: - Do not use any code snippets, imports, file routes or bullets points. - Do not mention the route of file that has been change. - Simply describe the MAIN GOAL of the changes. Use this changes as - Output directly the summary in plain text."
  end,
  replace = true,
}

require("gen").prompts["Commit message"] = {
  prompt = "You are an expert developer specialist in creating commits messages. Your only goal is to retrieve a single commit message. Based on the provided user changes, combine them in ONE SINGLE commit message retrieving the global idea, following strictly the next rules: - Always use the next format: {type}: {commit_message} where {type} is one of feat, fix, docs, style, refactor, test, chore, revert. - Output directly only one commit message in plain text. - Be as concise as possible. 50 characters max. - Do not add any issues numeration nor explain your output. Use this as input for changes: $text",
  replace = true,
}
