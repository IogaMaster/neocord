
<h1 align="center">
    <img src="./assets/logos/Neovim.png" width=256 alt="neocord">&#x200B;
</h1>
<h2 align="center">
    A Discord <a href="https://discord.com/rich-presence">Rich Presence</a> plugin for  <a href="https://neovim.io">Neovim</a>
</h2>

<h1 align="center">
<a href='#'><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px"/></a>
  <br>
  <br>
  <div>
    <a href="https://github.com/Iogamaster/neocord/issues">
        <img src="https://img.shields.io/github/issues/Iogamaster/neocord?color=fab387&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/Iogamaster/neocord/stargazers">
        <img src="https://img.shields.io/github/stars/Iogamaster/neocord?color=ca9ee6&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/Iogamaster/neocord">
        <img src="https://img.shields.io/github/repo-size/Iogamaster/neocord?color=ea999c&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/Iogamaster/neocord/blob/main/.github/LICENCE">
        <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=ca9ee6&colorA=313244&colorB=cba6f7"/>
    </a>
    <br>
    </div>
        <img href="https://builtwithnix.org" src="https://builtwithnix.org/badge.svg"/>
   </h1>
   <br>

![image](https://github.com/IogaMaster/neocord/assets/67164465/2a6a2d6b-3f7f-4d88-8f6c-27ca6b7e4419)

## Features
* Light and unobtrusive
* Written in Pure Lua and is [highly configurable](#configuration)
* Custom logo if desired.
* Great looking icons!

## Installation
Use your favorite plugin manager
* [lazy.nvim](https://github.com/folke/lazy.nvim): 
```lua
{ 
    'IogaMaster/neocord',
    event = "VeryLazy"
}
```
* [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use 'IogaMaster/neocord'
```
* [vim-plug](https://github.com/junegunn/vim-plug): 
```vim
Plug 'IogaMaster/neocord'
```

#### Notes
* Requires [Neovim 0.5](https://github.com/neovim/neovim/releases/tag/v0.5.0) or higher

## Configuration
Configuration is not necessary for Rich Presence to work. But for those that want to override the default configs, the following options are available to configure in either Lua or VimL.

### Lua
Require the plugin and call `setup` with a config table with one or more of the following keys:

```lua
-- The setup config table shows all available config options with their default values:
require("neocord").setup({
    -- General options
    logo                = "auto",                     -- "auto" or url
    logo_tooltip        = nil,                        -- nil or string
    main_image          = "language",                 -- "language" or "logo"
    client_id           = "1157438221865717891",      -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer
    global_timer        = false,                      -- if set true, timer won't update when any event are triggered
    buttons             = nil,                        -- A list of buttons (objects with label and url attributes) or a function returning such list.

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    terminal_text       = "Using Terminal",           -- Format string rendered when in terminal mode.
})
```

### VimL
While the plugin is written in pure Lua, it can still be initialized using standard Vim commands (i.e. if you have an `init.vim` instead of `init.lua`).
The available config options are as shown above; we just need to use some special Vim syntax around them:
```vim
call v:lua.require'neocord'.setup_no_return(#{
    \ logo: 'auto',
    \ })
```
Vim does not support null variables very well, so passing a value equivalent to `nil` does not seem to be possible with this method.
To set an option to `nil`, use the syntax below, or refrain from setting that option explicitly (if its default is `nil`).

Alternatively, use a Lua heredoc.
This is slightly more verbose, but supports all Lua syntax.
For example:
```vim
if has('nvim-0.5') || has('lua') 
    lua << EOF
    require('neocord').setup({
        logo         = "auto",
        logo_tooltip = nil,
        -- etc...
    })
EOF
endif
```

## Special Thanks:
- [vscord](https://github.com/leonardssh/vscord) for the [icons](https://github.com/leonardssh/vscord/tree/main/assets/icons).
