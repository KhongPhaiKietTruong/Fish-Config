if status is-interactive
    # No greeting
    #set fish_greeting
    #
    # Use starship
    function starship_transient_prompt_func
        starship module character
    end
    if test "$TERM" != linux
        starship init fish | source
        enable_transience
    end

    # Aliases
    # kitty doesn't clear properly so we need to do this weird printing
    #alias clear "printf '\033[2J\033[3J\033[1;1H'"
    if test "$TERM" != linux
        alias ls 'eza --icons'
    end
end

# Khai báo các file sẽ bị bỏ qua khi tìm kiếm vào một biến để tái sử dụng 
set exclude --hidden --exclude .git --exclude node_modules --exclude .cache --exclude __pycache__

# Đặt alias 
alias cdi="nvim (fd --type d | fzf)"

# Dùng zoxide 
zoxide init fish | source

# Dùng fzf
fzf --fish | source

# Đặt Neovim làm Editor mặc định trong Fish Shell (mở file bằng nvim trong yazi) 
set -gx EDITOR nvim

# Sửa file nhanh 
function vii
    set -l file (fd --type f $exclude | fzf)
    if test -n "$file"
        nvim $file
    end
end

# Vào thư mục nhanh 
function cdi
    set -l dir (fd --type d --hidden | fzf)

    if test -n "$dir"
        nvim $dir
    end
end

# Lời chào khi mở Terminal
function fish_greeting
    set_color 7fc8ff
    echo '  _             _   _                                '
    echo ' | | _ (_) ___ | |_| |_ _ __ _   _  ___  ____   ____ '
    echo " | |/ /| |/ _ \| __| __| '__| | | |/ _ \|  _ \ / _  |"
    echo ' |   / | |  __/| |_| |_| |  | |_| | (_) | | | | (_| |'
    echo ' |_|\_\|_|\___| \__|\__|_|   \____|\___/|_| |_|\__, |'
    echo '                                               |___/'
    set_color normal
    command -v fastfetch &>/dev/null && fastfetch --key-padding-left 4
end
