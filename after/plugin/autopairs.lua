local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
  return
end

autopairs.setup({
  check_ts = true, -- enable treesitter
  ts_config = {
    lua = { "string" }, -- don't add pairs in lua string treesitter nodes
    javascript = { "template_string" }, -- don't add pairs in javascript template_string
    java = false, -- don't check treesitter on java
  },
})



