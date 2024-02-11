" Define autocommands to handle auto-update events
function neocord#SetAutoCmds()
    augroup neocord_events
        autocmd!
        if exists("g:neocord_auto_update") && g:neocord_auto_update
            autocmd FocusGained * lua package.loaded.neocord:handle_focus_gained()
            autocmd TextChanged * lua package.loaded.neocord:handle_text_changed()
            autocmd VimLeavePre * lua package.loaded.neocord:handle_vim_leave_pre()
            autocmd WinEnter * lua package.loaded.neocord:handle_win_enter()
            autocmd WinLeave * lua package.loaded.neocord:handle_win_leave()
            autocmd BufEnter * lua package.loaded.neocord:handle_buf_enter()
            autocmd BufAdd * lua package.loaded.neocord:handle_buf_add()
            autocmd UIEnter * lua package.loaded.neocord:handle_ui_enter()
            autocmd CursorMoved * lua package.loaded.neocord:handle_cursor_moved()
            autocmd CursorMovedI * lua package.loaded.neocord:handle_cursor_moved()
        endif
    augroup END
endfunction
