return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "lua" },
        highlight = {
            enable = true,
            -- 注意：这些是解析器的名称，而不是文件类型。（例如，如果你想禁用 `tex` 文件类型的语法高亮，你需要在这个列表中包含 `latex`，因为这是解析器的名称）
            -- 将被禁用的语言列表
            disable = { "c", "rust" },
            -- 或者使用一个函数以获得更大的灵活性，例如，禁用大文件的慢速 treesitter 高亮
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                return true
                end
            end,

            -- 设置为 true 将同时运行 `:h syntax` 和 tree-sitter。
            -- 如果你依赖于 'syntax' 的启用（例如用于缩进），请将此设置为 `true`。
            -- 使用此选项可能会减慢你的编辑器速度，并且你可能会看到一些重复的高亮。
            -- 除了 true，它还可以是一个语言列表
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                -- 自动向前跳转到文本对象，类似于 targets.vim
                lookahead = true,

                keymaps = {
                    -- 你可以使用在 textobjects.scm 中定义的捕获组
                    -- 你可以选择性地为映射设置描述（用于 nvim_buf_set_keymap 的 desc 参数），
                    -- 这些描述会被 which-key 等插件显示
                    ["af"] = { query = "@function.outer", desc = "Select outer part of function region" },
                    ["if"] = { query = "@function.inner", desc = "Select inner part of function region" },
                    ["ac"] = { query = "@class.outer", desc = "Select outer part of class region" },
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of class region" },
                },
                -- 你可以选择选择模式（默认是字符模式 'v'）
                --
                -- 也可以是一个函数，该函数接收一个包含以下键的表：
                -- * query_string: 例如 '@function.inner'
                -- * method: 例如 'v' 或 'o'
                -- 并且应该返回模式（'v', 'V', 或 '<c-v>'）或一个映射查询字符串到模式的表
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- 字符模式
                    ['@function.outer'] = 'V', -- 行模式
                    ['@class.outer'] = '<c-v>', -- 块模式
                },
                -- 如果你将此设置为 `true`（默认是 `false`），则任何文本对象都会
                -- 扩展以包含前面的或后面的空白。后面的空白优先，以便与内置的
                -- `ap` 类似。
                --
                -- 也可以是一个函数，该函数接收一个包含以下键的表：
                -- * query_string: 例如 '@function.inner'
                -- * selection_mode: 例如 'v'
                -- 并且应该返回 true 或 false
                include_surrounding_whitespace = false,
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = { query = "@function.outer", desc = "next function start" },
                    ["]]"] = { query = "@class.outer", desc = "next class start" },
                    ["]s"] = { query = "@scope", query_group = "locals", desc = "next scope" },
                    ["]z"] = { query = "@fold", query_group = "folds", desc = "next fold" },
                },
                goto_next_end = {
                    ["]M"] = { query = "@function.outer", desc = "next function end" },
                    ["]["] = { query = "@class.outer", desc = "next class end" },
                },
                goto_previous_start = {
                    ["[m"] = { query = "@function.outer", desc = "previous function start" },
                    ["[["] = { query = "@class.outer", desc = "previous class start" },
                    ["[s"] = { query = "@scope", query_group = "locals", desc = "previous scope" },
                    ["[z"] = { query = "@fold", query_group = "folds", desc = "previous fold" },
                },
                goto_previous_end = {
                    ["[M"] = { query = "@function.outer", desc = "previous function end" },
                    ["[]"] = { query = "@class.outer", desc = "previous class end" },
                },
            },
        },
    },
}
