-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>br"] = { false },
    ["<leader>bl"] = {
      function() require("astronvim.utils.buffer").close_right() end,
      desc = "Close all buffers to the right",
    },
    ["<leader>bh"] = {
      function() require("astronvim.utils.buffer").close_left() end,
      desc = "Close all buffers to the left",
    },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>T"] = { name = "Tests" },
    ["<leader>Tw"] = {
      "<cmd>lua require('neotest').run.run({ jestCommand = 'npm run test:watch' })<cr>",
      desc = "Start jest in watch mode",
    },
    ["<leader>Tn"] = {
      function() require("neotest").run.run() end,
      desc = "Start nearest test",
    },
    ["<leader>Tf"] = {
      function() require("neotest").run.run(vim.fn.expand "%") end,
      desc = "Run all tests in file.",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
