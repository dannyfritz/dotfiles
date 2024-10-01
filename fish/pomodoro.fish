function pomodoro
    if ! type -q jq
        echo '\"jq\" is required to use Pomodoro'
        return 1
    end
    set -f COMPLETE_SOUND ~/.config/sounds/birds-chirping-in-a-forest.mp3
    set -f -a OPTIONS (echo '{"focus": {"text": "Focus...", "time": "24m"}, "rest": { "text": "Short Break...", "time": "12m" }, "break": {"text": "Stand Up...", "time": "6m"}}' | jq -c)
    set -f OPTION (echo $OPTIONS | jq -c -r (printf '.["%s"]' $argv))
    if test $OPTION = null
        set_color yellow
        printf 'Unknown OPTION: "%s"\n\n' $argv
        set_color -o brwhite
        printf "USAGE:\n"
        set_color normal
        printf "\tpomodoro OPTION\n\n"
        set_color -o brwhite
        printf "ARGUMENTS:\n"
        set_color normal
        printf "\tOPTION: %s\n" (echo $OPTIONS | jq -c 'keys')
        set_color normal
        return 1
    end
    set -f TEXT (echo $OPTION | jq -r '.text')
    set -f TIME (echo $OPTION | jq -r '.time')
    command figlet $TEXT
    if type -q timer
        command timer -f --format 24h $TIME
    else if type -q utimer
        command utimer --countdown=$TIME
    else
        echo 'Missing "timer" or "utimer" commands.'
        return 1
    end
    if test $status -ne 0
        echo "Session ended early"
        return 1
    end
    if type -q noti
        command noti -t Pomodoro -m (printf "%s session is done." $argv)
    end
    if type -q play;
        and test -e "$COMPLETE_SOUND"
        command play -q $COMPLETE_SOUND silence 1 5 2% trim 0 10 &
    else if type -q say
        command say (printf "%s session is done." $argv)
    else if type -q spd-say
        command spd-say (printf "%s session is done." $argv)
    end
    return 0
end
