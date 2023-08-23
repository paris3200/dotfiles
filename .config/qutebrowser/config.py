# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401

config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103

# something I noticed while looking at these dotfiles (https://github.com/SqrtMinusOne/dotfiles/blob/master/.config/qutebrowser/config.py)
from qutebrowser.api import interceptor


def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
    ):
        info.block()


interceptor.register(filter_yt)


config.load_autoconfig(True)

# Automatically start playing `<video>` elements.
# Type: Bool
c.content.autoplay = False

# Automatically save session on close
# Type: Bool
c.auto_save.session = True

c.completion.height = "40%"
c.content.blocking.method = "both"
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
c.fonts.default_size = "12pt"
c.prompt.filebrowser = False
c.spellcheck.languages = ["en-US"]
c.url.start_pages = 'http://localhost:8000'
c.url.default_page = 'http://localhost:8000'

# Set user-agent
c.content.headers.user_agent = "Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0"

# Set Headers
c.content.headers.accept_language = "en-US,en;q=0.5"
c.content.headers.custom = '{"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}'

# Set Colorscheme
config.source("tokyo_nights.py")

# Set File Picker
config.set("fileselect.handler", "external")
# config.set("fileselect.single_file.command", ['kitty', '--class', 'ranger, ranger', '-e', 'ranger', '--chosefile', '{}'])
# config.set("fileselect.multiple_files.command", ['kitty', '--class', 'ranger,ranger', '-e', 'ranger', '--choosefiles', '{}'])
# Command (and arguments) to use for selecting a single file in forms.

# The command should write the selected file path to the specified file
# or stdout. The following placeholders are defined: * `{}`: Filename of
# the file to be written to. If not contained in any argument, the
# standard output of the command is read instead.
# Type: ShellCommand
c.fileselect.single_file.command = ["kitty", "-e", "ranger", "--choosefile={}"]

# Command (and arguments) to use for selecting multiple files in forms.
# The command should write the selected file paths to the specified file
# or to stdout, separated by newlines. The following placeholders are
# defined: * `{}`: Filename of the file to be written to. If not
# contained in any argument, the   standard output of the command is
# read instead.
# Type: ShellCommand
c.fileselect.multiple_files.command = ["kitty", "-e", "ranger", "--choosefiles={}"]

# Command (and arguments) to use for selecting a single folder in forms.
# The command should write the selected folder path to the specified
# file or stdout. The following placeholders are defined: * `{}`:
# Filename of the file to be written to. If not contained in any
# argument, the   standard output of the command is read instead.
# Type: ShellCommand
c.fileselect.folder.command = ["kitty", "-e", "ranger", "--choosedir={}"]


# Render all web contents using a dark theme.
# Type: Bool
c.colors.webpage.darkmode.enabled = False

# I want hints to be uppercase characters
c.hints.uppercase = True

# hint font size
c.fonts.hints = "bold 14px Monospace"

# searches
c.url.searchengines["a"] = "https://wiki.archlinux.org/?search={}"
c.url.searchengines["g"] = "http://www.google.com/search?q={}"
c.url.searchengines["y"] = "https://www.youtube.com/results?search_query={}"
c.url.searchengines[
    "w"
] = "https://secure.wikimedia.org/wikipedia/en/w/index.php?title=Special%%3ASearch&search={}"
c.url.searchengines["gh"] = "https://github.com/search?q={}&type=Code"
c.url.searchengines["r"] = "https://reddit.com/r/{}"

# Bindings
config.unbind("H")
config.unbind("L")
config.unbind("J")
config.unbind("K")
config.bind("L", "tab-next")
config.bind("H", "tab-prev")
config.bind("J", "back")
config.bind("K", "forward")
config.bind("m", "hint links spawn mpv {hint-url}")
config.bind('M', 'hint links spawn kitty youtube-dl {hint-url}')
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle tabs.show always never ;; config-cycle statusbar.show always never')

config.bind(',p', 'spawn --userscript qute-pass --mode gopass')
config.bind(',P', 'spawn --userscript qute-pass --mode gopass --password-only')
