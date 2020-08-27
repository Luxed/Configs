function ls
    command lsd --group-dirs first $argv
end

function l
    ls -lah $argv
end
