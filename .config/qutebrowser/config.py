config.load_autoconfig(False)
c.auto_save.session = True
c.completion.height = '40%'
c.content.blocking.method = 'both'
c.downloads.location.directory = "/home/jason/downloads/"
c.downloads.location.prompt = False
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
c.fonts.default_size = '12pt'
c.prompt.filebrowser = False
c.spellcheck.languages = ["en-US"]
config.source("gruvbox.py")

# Set File Picker
config.set("fileselect.handler", "external")
config.set("fileselect.single_file.command", ['kitty', '--class', 'ranger, ranger', '-e', 'ranger', '--choosefiles', '{}'])
config.set("fileselect.multiple_files.command", ['kitty', '--class', 'ranger,ranger', '-e', 'ranger', '--choosefiles', '{}'])
config.set("content.javascript.can_open_tabs_automatically", True)

# searches
c.url.searchengines["a"] = "https://wiki.archlinux.org/?search={}"
c.url.searchengines[
    "g"
] = "http://www.google.com/search?hl=en&source=hp&ie=ISO-8859-l&q={}"
c.url.searchengines["y"] = "https://www.youtube.com/results?search_query={}"
c.url.searchengines[
    "w"
] = "https://secure.wikimedia.org/wikipedia/en/w/index.php?title=Special%%3ASearch&search={}"
c.url.searchengines["gh"] = "https://github.com/search?q={}&type=Code"
c.url.searchengines["r"] = "https://reddit.com/r/{}"
