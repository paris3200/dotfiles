c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

config.load_autoconfig(False)

# general settings
c.auto_save.session = True
c.spellcheck.languages = ["en-US"]
c.editor.command = [
    "kitty",
    "-title",
    "scratchpad",
    "-geometry",
    "86x24+40+60",
    "-e",
    "vim",
    "-f",
    "{}",
]
c.new_instance_open_target = "tab-bg"
c.prompt.filebrowser = False
c.completion.height = "30%"
c.completion.web_history.max_items = 1000
c.input.partial_timeout = 2000
c.tabs.background = True
c.tabs.title.format = "{index}: {current_title}"
c.downloads.location.directory = "/home/jason/downloads/"
c.content.cache.size = 52428800
c.content.webgl = False
c.content.blocking.enabled = True
c.hints.border = "1px solid #CCCCCC"
c.hints.mode = "letter"
c.hints.chars = "abcdefghijklmnopqrstuvwxyz"
c.hints.min_chars = 1

# searches
c.url.searchengines["a"] = "https://wiki.archlinux.org/?search={}"
c.url.searchengines["g"
] = "http://www.google.com/search?hl=en&source=hp&ie=ISO-8859-l&q={}"
c.url.searchengines["y"] = "https://www.youtube.com/results?search_query={}"
c.url.searchengines[
    "w"
] = "https://secure.wikimedia.org/wikipedia/en/w/index.php?title=Special%%3ASearch&search={}"
c.url.searchengines["gh"] = "https://github.com/search?q={}&type=Code"
c.url.searchengines["r"] = "https://reddit.com/r/{}"

# keybinds
# config.unbind("<Shift-Ins>", mode="insert")
config.unbind("gb", mode="normal")
config.unbind("B", mode="normal")
config.unbind("b", mode="normal")
config.unbind("m", mode="normal")
config.unbind("<Ctrl-B>", mode="normal")
config.bind("<Ctrl-Right>", "tab-next", mode="normal")
config.bind("<Ctrl-Left>", "tab-prev", mode="normal")
config.bind("<Ctrl-Shift-Right>", "tab-move +", mode="normal")
config.bind("<Ctrl-Shift-Left>", "tab-move -", mode="normal")
config.bind("b", "back", mode="normal")
config.bind("m", "forward", mode="normal")
config.bind("B", "set-cmd-text -s :bookmark-add", mode="normal")
config.bind("t", "set-cmd-text -s :open -t", mode="normal")
config.bind("<Escape>", "leave-mode", mode="passthrough")


config.source("gruvbox.py")
