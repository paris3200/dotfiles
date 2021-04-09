config.load_autoconfig(True)
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
