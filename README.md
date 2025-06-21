# Paul's Neovim Configuration

This documents my personal [neovim](https://github.com/neovim/) build, setup, and configuration.

I built from source and installed the Debian package
```bash
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo && \
cd build && \
cpack -G DEB && \
sudo dpkg -i nvim-linux-x86_64.deb
```

Verify that `nvim` is the one you expect with `nvim --version`.

Then make it the default `vi` with `sudo update-alternatives --install /usr/bin/vi vi $(which nvim) 25`, where `25` is a number that is bigger than the other `Priority` numbers in the table when you type `sudo update-alternatives --config vi`. This makes `nvim` the default choice.

Finally, clone this repo into `~/.config/` and rename the folder from `pauls_neovim_configuration` to `nvim`.

When you type `vi`, it should start downloading the plugins.

## Goals

I am moving from `vim` to `neovim`. These are things I need my editor to do:

* code tree navigation
* code completion
* argument help
* rust analyzer
* my keyboard shortcuts
* integrated code debugger

I have the following plugins integrated into `vim`. I want similar or better functionality in `neovim`.

* ~~[CoC](https://github.com/neoclide/coc.nvim)~~
* [rust.vim](https://github.com/rust-lang/rust.vim)
* [tagbar](https://github.com/preservim/tagbar)
* [copilot](https://github.com/features/copilot)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [indentLine](https://github.com/Yggdroot/indentLine)

Apparently [CoC isn't cool anymore](https://www.reddit.com/r/neovim/comments/14pvyo4/why_is_nobody_using_coc_anymore/) because of the NodeJS requirement, and updates to the LSP capabilities in neovim and other plugins. In particular:
"[null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim), [mason.nvim](https://github.com/williamboman/mason.nvim), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), and native LSP together do everything I used from CoC, but are simpler and quicker.

Notice that this list does not include a debugger. I want to add this functionality to my `neovim` configuration.

## Fonts

There are a bunch of nice icons and things that require [Nerd Fonts](https://www.nerdfonts.com/#home). Download a font, unzip it in `~/.local/share/fonts/` and then run `fc-cache -fv` to update the fonts cache. If you download a bunch of them, and they're the only zip files in `~/Downloads`, you can unzip them all at once with `cd ~/.local/share/fonts; for z in ~/Downloads/*.zip ; do dir=$(basename $z  .zip); mkdir $dir ; cd $dir; unzip $z; rm $z; cd - ; done`
If you install a new font and want to use it in `tilix`, you have to restart `tilix`. I've installed `0XProto` to start.
This will be fun to play with.
These are not `neovim` specific, but there are additional characters in these fonts that make `neovim` prettier.

## Plugin Manager

The manager I have chosen is [Lazy](https://lazy.folke.io/). It's pretty easy to configure using text files, and the interfact in `neovim` is nice.

These have now been downloaded, but they are not activated. I don't know why. Like, I'm editing a Rust file, but `rust.vim` is not loaded.


Start [here](https://www.notonlycode.org/neovim-lua-config/) with a crash-course in Lua.

## Tips

 gc | [Commenting/uncommenting lines of text handled](https://github.com/neovim/neovim/blob/73de98256cf3932dca156fbfd0c82c1cc10d487e/runtime/doc/various.txt#L561-L597) |

The `gd` command only takes me _within_ a file. To go elsewhere in the source tree, use the hover menu (`K`). This is configured in the `after` folder.

If a plugin is set as `lazy = true` then it won't load unless something else depends on it. Better to have them triggered by an event. `event = "LazyLoad"` will load it _after_ startup.

Another [tutorial here](https://github.com/neovim/neovim/blob/73de98256cf3932dca156fbfd0c82c1cc10d487e/runtime/doc/various.txt#L561-L597).

The `rust-tools` project is archived, and they recommend you move to [rustaceanvim](https://github.com/mrcjkb/rustaceanvim).
That project has some nice tips on how to use the built-in LSP.
It also recommends some debug things.
Things are more mouse-y that I would like them to be.

### Leader

Currently the leader key is `\`, so things like endhints and tagbar are toggled with `\h` and `\t`.
You can re-configure it in `~/.config/nvim/lua/config/lazy.lua`:
```lua
-- Make sure to setup `mapleader` and `maplocalleader` before
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
```

### WhichKeys

Shows you your hotkeys with `<leader>?`.

## Further Reading

There is more config I would like to do.

[LSP config and control](https://github.com/nanotee/nvim-lsp-basics/blob/main/doc/lsp-basics.txt)

[Configure a debugger](https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file#using-codelldb-for-debugging)

[Learn about LUA](https://neovim.io/doc/user/lua-guide.html)

[markdown preview](https://github.com/iamcco/markdown-preview.nvim) this opens a browser and requires node. I don't know.

[try some different color schemes](https://medium.com/unixification/my-favorite-neovim-colorschemes-1e5c995fa12e)

[some mouse stuff](https://alpha2phi.medium.com/neovim-101-mouse-and-menu-a2d2be60b3e1)

## Troubleshooting

### Error in BufReadPost
I'm getting loads of errors from treesitter when I type `:help`. For example:
```
Error in BufReadPost Autocommands for "*":
Lua callback: /usr/share/nvim/runtime/filetype.lua:36: BufReadPost Autocommands for "*"..FileType Autocommands for "*"..functio
n <SNR>1_LoadFTPlugin[20]..script /usr/share/nvim/runtime/ftplugin/help.lua: Vim(runtime):E5113: Lua chunk: /usr/share/nvim/run
time/lua/vim/treesitter.lua:431: Parser could not be created for buffer 13 and language "vimdoc"
stack traceback:
        [C]: in function 'assert'
        /usr/share/nvim/runtime/lua/vim/treesitter.lua:431: in function 'start'
        /usr/share/nvim/runtime/ftplugin/help.lua:2: in main chunk
        [C]: in function 'nvim_cmd'
        /usr/share/nvim/runtime/filetype.lua:36: in function </usr/share/nvim/runtime/filetype.lua:35>
        [C]: in function 'pcall'
        vim/shared.lua: in function <vim/shared.lua:0>
        [C]: in function '_with'
        /usr/share/nvim/runtime/filetype.lua:35: in function </usr/share/nvim/runtime/filetype.lua:10>
stack traceback:
        [C]: in function '_with'
        /usr/share/nvim/runtime/filetype.lua:35: in function </usr/share/nvim/runtime/filetype.lua:10>

```

#### Resolution
The problem was that the parser for vimdoc was not installed. I hate to say it, but Google AI overview suggested
`:TSInstall vimdoc`. This solved the problem.
I added a list of requried types in the config, so just update those in the future.

### weird error when branch changing

```
vim.schedule callback: ...nvim/lazy/rust-tools.nvim/lua/rust-tools/inlay_hints.lua:142: Index out of bounds stack traceback: [C]: in function 'nvim_buf_get_lines' ...nvim/lazy/rust-tools.nvim/lua/rust-tools/inlay_hints.lua:142: in function 'parse_hints' ...nvim/lazy/rust-tools.nvim/lua/rust-tools/inlay_hints.lua:168: in function 'handler' /usr/share/nvim/runtime/lua/vim/lsp/client.lua:681: in function '' vim/_editor.lua: in function <vim/_editor.lua:0>
```

When I switch branches (even for a small change) while still in session, it gives this error.
If I restart the session, then things are okay.
Is there a solution other than simply restarting vi?
Typing this error into Google, the AI is helpful. One thing it suggests is that the buffer is in an unexpected state. That tracks.

### gd and gD only take me _within_ the file, do not nagivate tree

The internet says this is a mis-configuration of the LSP server, but I don't know the config options for `rust-tool`.
Do I have to wait for `RustAnalyzer` to finish?

There are several issues here. First, I had been using `simrat39/rust-tools.nvim`, an out-of-date Rust plugin.
There was also `rust-lang/rust.vim`, and I'm not sure what it does.
I switched to `mrcjkb/rustaceanvim`, the package recommended on the `rust-tools` github page. It's much better.

The `gD` mapping still doesn't work, but I like the pop-up that I enabled with `K` better. Hit `K` once to bring the pop-up, enter to make it disappear, a second `K` to focus on the menu, and then you can arrow around.

## Other Configurations

Here are some other configurations to consider:

* [awesome-neovim](https://github.com/rockerBOO/awesome-neovim)
* [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)

