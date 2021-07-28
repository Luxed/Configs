function ls
    command lsd --group-dirs first $argv
end

function l
    ls -lA $argv
end

function sess
    screen -dmS (basename (pwd)) $argv
end

function attach
    screen -r (basename (pwd))
end

function ssh
    env TERM=xterm-256color ssh $argv
end
