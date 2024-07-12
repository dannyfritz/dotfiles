if type -q figlet; and type -q utimer; and type -q noti; and type -q play
    abbr --add pmdsb "figlet \"Short break...\"; and utimer --countdown=6m; and noti -t \"Pomodoro\" -m \"Time to focus: pmdf\"; and play -q ~/.config/sounds/birds-chirping-in-a-forest.mp3 silence 1 5 2% trim 0 10 &;"
    abbr --add pmdlb "figlet \"Long break...\"; and utimer --countdown=12m; and noti -t \"Pomodoro\" -m \"Time to focus: pmdf\"; and play -q ~/.config/sounds/birds-chirping-in-a-forest.mp3 silence 1 5 2% trim 0 10 &;"
    abbr --add pmdf "figlet \"Focus...\"; and utimer --countdown=20m; and noti -t \"Pomodoro\" -m \"Time for a break: pmdsb pmdlb\"; and play -q ~/.config/sounds/birds-chirping-in-a-forest.mp3 silence 1 5 2% trim 0 10 &;"
end

