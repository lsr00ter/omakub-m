#!/bin/zsh

ascii_art='
________                  __        ___.        
\_____  \   _____ _____  |  | ____ _\_ |__      ____ ___      
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \    /  _ \  \     
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \  (  <_> )  \    
\_______  /__|_|  (____  /__|_ \____/|___  /   \____/____/   
        \/      \/     \/     \/         \/                  
                                                        macOS
'

# Define the color gradient (shades of cyan and blue)
colors=(
	'\033[38;5;81m' # Cyan
	'\033[38;5;75m' # Light Blue
	'\033[38;5;69m' # Sky Blue
	'\033[38;5;63m' # Dodger Blue
	'\033[38;5;57m' # Deep Sky Blue
	'\033[38;5;51m' # Cornflower Blue
	'\033[38;5;45m' # Royal Blue
)

# Split the ASCII art into lines (zsh syntax)
lines=("${(@f)ascii_art}")

# Print each line with the corresponding color
for i in {1..$#lines}; do
	color_index=$(((i - 1) % ${#colors[@]}))
	echo -e "${colors[color_index+1]}${lines[i]}"
done