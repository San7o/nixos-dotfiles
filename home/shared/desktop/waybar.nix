{ config, ... }:

{

  home.file.".config/waybar/config" = {
    
    # Overwrite the file
    force = true;
    text = ''
{
    "layer": "top", // Waybar at top layer
    "position": "top", // Waybar at the bottom of your screen
    "height": 24, // Waybar height
    // "width": 1366, // Waybar width
    // Choose the order of the modules
    "modules-left": ["hyprland/workspaces", "hyprland/mode", "custom/spotify"],
    "modules-center": ["hyprland/window"],
    "modules-right": ["backlight", "pulseaudio", "network", "cpu", "memory", "battery", "tray", "clock"],
    "hyprland/workspaces": {
        "disable-scroll": true,
        "all-outputs": false,
        "format": "{icon}",
        "format-icons": {
            "1": "",
            "2": "",
            "3": "",
            "4": "",
            "5": "",
            "urgent": "",
            "focused": "",
            "default": ""
        }
    },
    "hyprland/mode": {
        "format": "<span style=\"italic\">{}</span>"
    },
    "tray": {
        // "icon-size": 21,
        "spacing": 10
    },
    "clock": {
        "format-alt": "{:%Y-%m-%d}"
    },
    "cpu": {
        "format": "{usage}% "
    },
    "memory": {
        "format": "{}% "
    },
    "battery": {
        "states": {
            // "good": 95,
            "warning": 30,
            "critical": 15
        },
        "format": "{capacity}% {icon}",
        // "format-good": "", // An empty format will hide the module
        // "format-full": "",
        "format-icons": ["", "", "", "", ""]
    },
    "network": {
        // "interface": "wlp2s0", // (Optional) To force the use of this interface
        "format-wifi": "{essid} ({signalStrength}%) ",
        "format-ethernet": "{ifname}: {ipaddr}/{cidr} ",
        "format-disconnected": "Disconnected ⚠"
    },
    "pulseaudio": {
        //"scroll-step": 1,
        "format": "{volume}% {icon}",
        "format-bluetooth": "{volume}% {icon}",
        "format-muted": "",
        "format-icons": {
            "headphones": "",
            "handsfree": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", ""]
        },
        "on-click": ""
    },
    "custom/spotify": {
        "format": " {}",
        "max-length": 40,
        "interval": 30, // Remove this if your script is endless and write in loop
        "exec": "$HOME/.config/waybar/mediaplayer.sh 2> /dev/null", // Script in resources folder
        "exec-if": "pgrep spotify"
    },
    "backlight": {
  	"device": "intel_backlight",
  	"format": "{percent}% {icon}",
  	"format-icons": ["", ""]
    }
}

  '';
  };



  home.file.".config/waybar/style.css" = {
    
    # Overwrite the file
    force = true;
    text = ''

* {
    border: none;
    border-radius: 0;
    font-family: "Ubuntu Nerd Font";
    font-size: 13px;
    min-height: 0;
}

window#waybar {
    background: transparent;
    color: white;
}

#window {
    font-weight: bold;
    font-family: "Ubuntu";
}
/*
#workspaces {
    padding: 0 5px;
}
*/

#workspaces button {
    padding: 0 5px;
    background: transparent;
    color: white;
    border-top: 2px solid transparent;
}

#workspaces button.focused {
    color: #c9545d;
    border-top: 2px solid #c9545d;
}

#mode {
    background: #64727D;
    border-bottom: 3px solid white;
}

#clock, #battery, #cpu, #memory, #network, #pulseaudio, #custom-spotify, #tray, #mode {
    padding: 0 3px;
    margin: 0 2px;
}

#clock {
    font-weight: bold;
}

#battery {
}

#battery icon {
    color: red;
}

#battery.charging {
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: black;
    }
}

#battery.warning:not(.charging) {
    color: white;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#cpu {
}

#memory {
}

#network {
}

#network.disconnected {
    background: #f53c3c;
}

#pulseaudio {
}

#pulseaudio.muted {
}

#custom-spotify {
    color: rgb(102, 220, 105);
}

#tray {
}

#backlight {
}

  '';
  };



}
