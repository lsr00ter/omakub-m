#!/bin/zsh

# Load macOS functions for web app creation
source ~/.local/share/omakub-macos/defaults/zsh/functions

AVAILABLE_WEB_APPS=("Chat GPT" "Google Photos" "Google Contacts" "Tailscale")

echo "Available web apps to install:"
for i in "${!AVAILABLE_WEB_APPS[@]}"; do
    echo "$((i+1)). ${AVAILABLE_WEB_APPS[$i]}"
done

echo ""
echo "💡 Select web apps to create (enter numbers separated by spaces, or 'all' for all):"
read -r selection

if [[ "$selection" == "all" ]]; then
    apps=("${AVAILABLE_WEB_APPS[@]}")
else
    # Parse selection
    apps=()
    for num in $selection; do
        if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -ge 1 ] && [ "$num" -le "${#AVAILABLE_WEB_APPS[@]}" ]; then
            apps+=("${AVAILABLE_WEB_APPS[$((num-1))]}")
        fi
    done
fi

if [[ ${#apps[@]} -gt 0 ]]; then
    for app in "${apps[@]}"; do
        case $app in
        "Chat GPT")
            web2app 'ChatGPT' https://chatgpt.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/chatgpt.png
            app2dock 'ChatGPT'
            ;;
        "Google Photos")
            web2app 'Google Photos' https://photos.google.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-photos.png
            app2dock 'Google Photos'
            ;;
        "Google Contacts")
            web2app 'Google Contacts' https://contacts.google.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-contacts.png
            app2dock 'Google Contacts'
            ;;
        "Tailscale")
            web2app 'Tailscale' https://login.tailscale.com/admin/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/tailscale-light.png
            app2dock 'Tailscale'
            ;;
        esac
    done
    echo "✓ Created ${#apps[@]} web app(s) and added to Dock"
else
    echo "No valid web apps selected"
fi