from i3pystatus import Status
from i3pystatus.mail import maildir
from i3pystatus.weather import wunderground

status = Status(standalone=True)

status.register("clock",
                format=" %a %-d %b %R",
                on_leftclick="google-chrome-stable \
                              https://calendar.google.com/calendar/"
                )

#status.register(
#        'weather',
#        format='{condition} {current_temp}{temp_unit}',
#        colorize=True,
#        backend=wunderground.Wunderground(
#                    api_key='36f5a21f2a7c691c',
#                    location_code='27043',
#                    units='imperial',
#                    ),
#        on_leftclick="urxvt --hold -e weather -fc"
#    )

status.register("battery",
                format="{status} {percentage:.2f}% {remaining:%E%hh:%Mm}",
                alert=True,
                alert_percentage=10,
                color="FFFFFF",
                full_color="FFFFFF",
                charging_color="FFFFFF",
                no_text_full=True,
                status={
                    "DIS": "↓",
                    "CHR": "↑",
                    "FULL": "",
                },)

status.register("network",
                interface="wlp3s0",
                format_up=" {essid} {quality}")

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
# status.register("pulseaudio",
#                format="♪ {volume}",
#                on_leftclick=["switch_mute"])

status.register("disk",
                path="/",
                # format="/ {free}:{total}"
                format=" {percentage_used}% "
                )

status.register("disk",
                path="/home/jason/",
                # format="/ {free}:{total}"
                format=" {percentage_used}% ")

#status.register("reddit",
#                on_leftclick="google-chrome-stable reddit.com/message/inbox && \
#                i3-msg workspace 1:www",
#                username="stay_at_home_daddy",
#                format="{message_unread} {link_karma} | {comment_karma}"
#                )


status.register("mail",
                #format=" {unread} ",
                format=" {unread}",
                #format_plural=" {unread} ",
                format_plural=" {unread}",
                backends=[maildir.MaildirMail(
                    directory="/home/jason/mail/parisleatherworks/jason/Inbox")
                ],
                email_client="i3-msg workspace 7:mail",
                log_level=20,
                color_unread="#cc1100",
                on_rightclick="urxvt -e  \
                                mbsync -c ~/.config/mbsync/mbsyncrc paris",
                hide_if_null=False
                )


status.run()
