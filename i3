# Maks' i3 config file
# Last updated: 2016-10-19  
set $mod Mod4

font xft:Hack 9

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal (urxvt client for urxvtd)
bindsym $mod+Return exec urxvtc

# Workspace variables

set $ws1 "1:I" 
set $ws2 "2:II"
set $ws3 "3:III"
set $ws4 "4:IV"
set $ws5 "5:V"
set $ws6 "6:VI"
set $ws7 "7:VII"
set $ws8 "8:VIII"
set $ws9 "9:XI"
set $ws10 "10:X"

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec --no-startup-id rofi -show run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
#bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2 
bindsym $mod+Shift+3 move container to workspace $ws3 
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5 
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart && exec xrdb -override ~/.Xresources
# also restart Xresources 
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

# resize mode
bindsym $mod+r mode "resize"

# i3bar + i3status (too lazy for i3blocks)
bar {
            position bottom
	    status_command i3status --config ~/.i3status.conf
            strip_workspace_numbers yes
            colors {
                    background #002b36
                    statusline #fdf6e3
                    inactive_workspace #073642 #073642 #586e75
                    focused_workspace #073642 #859900 #073642
                    urgent_workspace #073642 #dc322f #073642
                   }
            }
# Set window border to 1 for no names
new_window 1pixel
# Wallpaper rotation script
exec --no-startup-id feh --bg-scale Pictures/Wallpapers/MacOS.png
# Compton, for transparency; could probably remove it now though
# exec --no-startup-id compton -CGb --config ~/.compton.conf

# Assign programs to their workspaces

assign [class="Firefox"] $ws1
exec --no-startup-id firefox

assign [class="discord"] $ws4
exec --no-startup-id ~/Downloads/DiscordCanary/DiscordCanary

# No Steam installed so why bother
#assign [class="Steam" title="Chat"] $ws2
#assign [class="Steam" title="Friends"] $ws2
#assign [class="Steam" title="^Steam$"] $ws3
#exec --no-startup-id steam

assign [class="Emacs"] $ws5
assign [class="krita"] $ws6 
assign [class="Gimp"] $ws6
hide_edge_borders vertical

# Polish keymap
exec setxkbmap pl

# mpd
exec sudo rc-service mpd start
# clock setup (after rebooting from Xubuntu)
# exec sudo hwclock --hctosys

# turn off the goddamned touch functionality on your tablet
exec --no-startup-id ~/wacom

# Run urxvt as a daemon to later open clients to, for performance
exec --no-startup-id urxvtd --quiet --opendisplay --fork

# Border colors 'n' shit
# class                 border  backgr. text    indicator child_border
client.focused #859900 #073642 #859900
client.focused_inactive #073642 #073642 #586e75
client.unfocused #073642 #073642 #586e75
client.urgent #dc322f #073642 #dc322f
#client_placeholder
#client.background
