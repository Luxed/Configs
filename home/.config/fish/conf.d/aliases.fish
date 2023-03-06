function ls
    command exa --group-directories-first $argv
end

function l
    ls -lagh $argv
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
