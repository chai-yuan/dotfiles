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
		    ["af"] = { query = "@function.outer", desc = "选择函数区域的外部部分" },
		    ["if"] = { query = "@function.inner", desc = "选择函数区域的内部部分" },
		    ["ac"] = { query = "@class.outer", desc = "选择类区域的外部部分" },
		    ["ic"] = { query = "@class.inner", desc = "选择类区域的内部部分" },
		    -- 你也可以使用其他查询组（如 `locals.scm`）中的捕获
		    ["as"] = { query = "@scope", query_group = "locals", desc = "选择语言作用域" },
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
        },
    },
}