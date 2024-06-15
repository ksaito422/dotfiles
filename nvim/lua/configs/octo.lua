local status_ok, octo = pcall(require, 'octo')
if not status_ok then
    return
end

local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>o', '<Cmd>Octo<CR>', { noremap = true })
keymap('n', '<leader>oam', '<Cmd>Octo pr search author:@me is:open<CR>', { noremap = true })
keymap('n', '<leader>orm', '<Cmd>Octo pr search review-requested:@me is:open<CR>', { noremap = true })

octo.setup({
    use_local_fs = false,
    enable_builtin = true,
    default_remote = {'upstream', 'origin'},
    default_merge_method = 'commit',
    ssh_aliases = {},
    picker = 'telescope',
    picker_config = {
        use_emojis = false,
        mappings = {
            open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            checkout_pr = { lhs = "<C-o>", desc = "checkout pull request" },
        },
    },
    comment_icon = '▎',
    outdated_icon = '󰅒 ',
    resolved_icon = ' ',
    reaction_viewer_hint_icon = ' ';
    user_icon = ' ';
    timeline_marker = ' ';
    timeline_indent = '2';
    right_bubble_delimiter = '';
    left_bubble_delimiter = '';
    github_hostname = 'github.com',
    snippet_context_lines = 4;
    gh_cmd = 'gh',
    gh_env = {},
    timeout = 5000,
    default_to_projects_v2 = true,
    ui = {
        use_signcolumn = true,
        use_statuscolumn = false, -- nvim 0.10.0 feature
    },
    issues = {
        order_by = {
            field = 'CREATED_AT',
            direction = 'DESC',
        },
    },
    pull_requests = {
        order_by = {
            field = 'CREATED_AT',
            direction = 'DESC',
        },
        always_select_remote_on_create = false,
    },
    file_panel = {
        size = 10,
        use_icons = true,
    },
    colors = {
        white = '#ffffff',
        grey = '#2A354C',
        black = '#000000',
        red = '#fdb8c0',
        dark_red = '#da3633',
        green = '#acf2bd',
        dark_green = '#238636',
        yellow = '#d3c846',
        dark_yellow = '#735c0f',
        blue = '#58A6FF',
        dark_blue = '#0366d6',
        purple = '#6f42c1',
    },
    mappings_disable_default = false,
    mappings = {
        pull_request = {
            checkout_pr = { lhs = '<space>po', desc = 'checkout PR' },
            list_commits = { lhs = '<space>pc', desc = 'list PR commits' },
            list_changed_files = { lhs = '<space>pf', desc = 'list PR changed files' },
            show_pr_diff = { lhs = '<space>pd', desc = 'show PR diff' },
            -- add_reviewer = { lhs = '<space>va', desc = 'add reviewer' },
            -- remove_reviewer = { lhs = '<space>vd', desc = 'remove reviewer request' },
            -- close_issue = { lhs = '<space>ic', desc = 'close PR' },
            -- reopen_issue = { lhs = '<space>io', desc = 'reopen PR' },
            -- list_issues = { lhs = '<space>il', desc = 'list open issues on same repo' },
            reload = { lhs = '<C-r>', desc = 'reload PR' },
            open_in_browser = { lhs = '<C-b>', desc = 'open PR in browser' },
            copy_url = { lhs = '<C-y>', desc = 'copy url to system clipboard' },
            goto_file = { lhs = 'gf', desc = 'go to file' },
            -- add_assignee = { lhs = '<space>aa', desc = 'add assignee' },
            -- remove_assignee = { lhs = '<space>ad', desc = 'remove assignee' },
            -- create_label = { lhs = '<space>lc', desc = 'create label' },
            -- add_label = { lhs = '<space>la', desc = 'add label' },
            -- remove_label = { lhs = '<space>ld', desc = 'remove label' },
            add_comment = { lhs = '<space>ca', desc = 'add comment' },
            -- delete_comment = { lhs = '<space>cd', desc = 'delete comment' },
            next_comment = { lhs = ']c', desc = 'go to next comment' },
            prev_comment = { lhs = '[c', desc = 'go to previous comment' },
            review_start = { lhs = '<space>vs', desc = 'start a review for the current PR' },
            review_resume = { lhs = '<space>vr', desc = 'resume a pending review for the current PR' },
        },
        review_thread = {
            add_comment = { lhs = '<space>ca', desc = 'add comment' },
            add_suggestion = { lhs = '<space>sa', desc = 'add suggestion' },
            delete_comment = { lhs = '<space>cd', desc = 'delete comment' },
            next_comment = { lhs = ']c', desc = 'go to next comment' },
            prev_comment = { lhs = '[c', desc = 'go to previous comment' },
            select_next_entry = { lhs = ']q', desc = 'move to previous changed file' },
            select_prev_entry = { lhs = '[q', desc = 'move to next changed file' },
            select_first_entry = { lhs = '[Q', desc = 'move to first changed file' },
            select_last_entry = { lhs = ']Q', desc = 'move to last changed file' },
            close_review_tab = { lhs = '<C-c>', desc = 'close review tab' },
            react_hooray = { lhs = '<space>rp', desc = 'add/remove 🎉 reaction' },
            react_heart = { lhs = '<space>rh', desc = 'add/remove ❤️ reaction' },
            react_eyes = { lhs = '<space>re', desc = 'add/remove 👀 reaction' },
            react_thumbs_up = { lhs = '<space>r+', desc = 'add/remove 👍 reaction' },
            react_thumbs_down = { lhs = '<space>r-', desc = 'add/remove 👎 reaction' },
            react_rocket = { lhs = '<space>rr', desc = 'add/remove 🚀 reaction' },
            react_laugh = { lhs = '<space>rl', desc = 'add/remove 😄 reaction' },
            react_confused = { lhs = '<space>rc', desc = 'add/remove 😕 reaction' },
        },
        submit_win = {
            approve_review = { lhs = '<C-a>', desc = 'approve review' },
            comment_review = { lhs = '<C-m>', desc = 'comment review' },
            request_changes = { lhs = '<C-r>', desc = 'request changes review' },
            close_review_tab = { lhs = '<C-c>', desc = 'close review tab' },
        },
        review_diff = {
            submit_review = { lhs = '<leader>vs', desc = 'submit review' },
            discard_review = { lhs = '<leader>vd', desc = 'discard review' },
            add_review_comment = { lhs = '<space>ca', desc = 'add a new review comment' },
            add_review_suggestion = { lhs = '<space>sa', desc = 'add a new review suggestion' },
            focus_files = { lhs = '<leader>e', desc = 'move focus to changed file panel' },
            toggle_files = { lhs = '<leader>b', desc = 'hide/show changed files panel' },
            next_thread = { lhs = ']t', desc = 'move to next thread' },
            prev_thread = { lhs = '[t', desc = 'move to previous thread' },
            select_next_entry = { lhs = ']q', desc = 'move to previous changed file' },
            select_prev_entry = { lhs = '[q', desc = 'move to next changed file' },
            select_first_entry = { lhs = '[Q', desc = 'move to first changed file' },
            select_last_entry = { lhs = ']Q', desc = 'move to last changed file' },
            close_review_tab = { lhs = '<C-c>', desc = 'close review tab' },
            toggle_viewed = { lhs = '<leader><space>', desc = 'toggle viewer viewed state' },
            goto_file = { lhs = 'gf', desc = 'go to file' },
        },
        file_panel = {
            submit_review = { lhs = '<leader>vs', desc = 'submit review' },
            discard_review = { lhs = '<leader>vd', desc = 'discard review' },
            next_entry = { lhs = 'j', desc = 'move to next changed file' },
            prev_entry = { lhs = 'k', desc = 'move to previous changed file' },
            select_entry = { lhs = '<cr>', desc = 'show selected changed file diffs' },
            refresh_files = { lhs = 'R', desc = 'refresh changed files panel' },
            focus_files = { lhs = '<leader>e', desc = 'move focus to changed file panel' },
            toggle_files = { lhs = '<leader>b', desc = 'hide/show changed files panel' },
            select_next_entry = { lhs = ']q', desc = 'move to previous changed file' },
            select_prev_entry = { lhs = '[q', desc = 'move to next changed file' },
            select_first_entry = { lhs = '[Q', desc = 'move to first changed file' },
            select_last_entry = { lhs = ']Q', desc = 'move to last changed file' },
            close_review_tab = { lhs = '<C-c>', desc = 'close review tab' },
            toggle_viewed = { lhs = '<leader><space>', desc = 'toggle viewer viewed state' },
        },
    },
})
