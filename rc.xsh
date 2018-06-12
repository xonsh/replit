import tty as _tty

# can't use prompt toolkit or  non-deafult colors, since not all ANSI escape sequences supported
$SHELL_TYPE = 'readline'
$XONSH_COLOR_STYLE = 'default'
$TITLE = None
$TERM = 'xterm-color'
$PROMPT = $PROMPT.replace('BLUE', 'CYAN')

# number colors look back on dark background with 'default' color
$COLOR_RESULTS = False


@events.on_post_init
def _welcome():
    from xonsh.tools import print_color
    from xonsh.xonfig import print_welcome_screen
    print_welcome_screen()
    print_color(
        '{RED}Current Limitations in Online Shell{NO_COLOR}\n'
        '  {PURPLE}*{NO_COLOR} No Tab Completion\n'
        '  {PURPLE}*{NO_COLOR} No Up/Down Arrow History Search\n'
        '  {PURPLE}*{NO_COLOR} Cannot Change Color Style from {GREEN}"default"{NO_COLOR}\n'
        '  {PURPLE}*{NO_COLOR} No Syntax Highlighting\n'
        '  {PURPLE}*{NO_COLOR} Only Readline Shell Supported'
    )


@events.on_postcommand
def _reset_stdin_cbreak(*args, **kwargs):
    _tty.setcbreak(0)
