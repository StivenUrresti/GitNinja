#!/bin/bash

# ============================
# Fancy Git Automation Script
# ============================

# Colores y estilos
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
MAGENTA="\033[35m"
BOLD="\033[1m"
RESET="\033[0m"

# Animaciones
loading_animation() {
    local msg=$1
    local delay=0.1
    local spinner=( '🌑' '🌒' '🌓' '🌔' '🌕' '🌖' '🌗' '🌘' )
    while true; do
        for i in "${spinner[@]}"; do
            printf "\r${MAGENTA}${BOLD}$i $msg${RESET}"
            sleep $delay
        done
    done
}

# Carga con mensaje
start_loading() {
    loading_animation "$1" &
    LOADING_PID=$!
    disown
}

# Detener animación
stop_loading() {
    kill "$LOADING_PID" > /dev/null 2>&1
    printf "\r${GREEN}${BOLD}✔ $1${RESET}\n"
}

# Mostrar un banner
clear
cat << "EOF"
🚀 Welcome to the Git Automator! 🚀

 ██████╗ ██╗████████╗    ████████╗ ██████╗ ██╗  ██╗
██╔═══██╗██║╚══██╔══╝    ╚══██╔══╝██╔═══██╗╚██╗██╔╝
██║   ██║██║   ██║          ██║   ██║   ██║ ╚███╔╝ 
██║   ██║██║   ██║          ██║   ██║   ██║ ██╔██╗ 
╚██████╔╝██║   ██║          ██║   ╚██████╔╝██╔╝ ██╗
 ╚═════╝ ╚═╝   ╚═╝          ╚═╝    ╚═════╝ ╚═╝  ╚═╝
EOF

echo -e "${CYAN}Automating your Git workflow for efficiency and fun!${RESET}"


set -e


start_loading "Fetching repository information..."
repo_name=$(basename "$(git rev-parse --show-toplevel)")
remote_url=$(git remote get-url origin)
current_branch=$(git rev-parse --abbrev-ref HEAD)
stop_loading "Repository information retrieved"

echo -e "🗂️  ${CYAN}Repository:${RESET} $repo_name"
echo -e "🌐 ${CYAN}Remote URL:${RESET} $remote_url"
echo -e "🔢 ${CYAN}Current branch:${RESET} $current_branch"

# Validar rama actual
if [[ "$current_branch" != "main" && "$current_branch" != "master" ]]; then
    echo -e "${YELLOW}⚠️  Warning:${RESET} You are not on the 'main' or 'master' branch."
    read -p "Do you want to proceed anyway? (y/n): " proceed
    if [[ "$proceed" != "y" ]]; then
        echo -e "${RED}❌ Exiting.${RESET} Please switch to 'main' or 'master' branch."
        exit 1
    fi
fi


untracked_files=$(git ls-files --others --exclude-standard)
if [[ -n "$untracked_files" ]]; then
    echo -e "${YELLOW}⚠️  Untracked files detected:${RESET}"
    echo "$untracked_files"
    read -p "Do you want to add them to staging? (y/n): " add_untracked
    if [[ "$add_untracked" == "y" ]]; then
        git add $untracked_files
        echo -e "${GREEN}✅ Untracked files added to staging.${RESET}"
    else
        echo -e "${RED}❌ Skipping untracked files.${RESET}"
    fi
fi


unstaged_changes=$(git diff --stat)
if [[ -n "$unstaged_changes" ]]; then
    echo -e "${YELLOW}⚠️  Unstaged changes detected:${RESET}"
    echo "$unstaged_changes"
    read -p "Do you want to stage them? (y/n): " stage_changes
    if [[ "$stage_changes" == "y" ]]; then
        git add .
        echo -e "${GREEN}✅ Changes staged.${RESET}"
    else
        echo -e "${RED}❌ Skipping unstaged changes.${RESET}"
        exit 1
    fi
fi


uncommitted_changes=$(git diff --cached --stat)
if [[ -n "$uncommitted_changes" ]]; then
    echo -e "${YELLOW}⚠️  Uncommitted changes detected:${RESET}"
    echo "$uncommitted_changes"
    read -p "Do you want to commit them? (y/n): " commit_changes
    if [[ "$commit_changes" == "y" ]]; then
        read -p "Enter your commit message: " user_commit_message
        git commit -m "$user_commit_message"
        echo -e "${GREEN}✅ Changes committed.${RESET}"
    else
        echo -e "${RED}❌ Commit cancelled.${RESET}"
        exit 1
    fi
fi

read -p "🔖 Do you want to tag this commit? (Optional, press Enter to skip): " tag
if [[ -n "$tag" ]]; then
    git tag "$tag"
    echo -e "${GREEN}✅ Tag '${BOLD}$tag${RESET}${GREEN}' added to commit.${RESET}"
fi


read -p "⬆️  Push changes to remote? (y/n): " push_changes
if [[ "$push_changes" == "y" ]]; then
    start_loading "Pushing changes to remote..."
    git push
    stop_loading "Changes pushed successfully"
else
    echo -e "${RED}❌ Push cancelled.${RESET}"
fi


timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo -e "✅ ${GREEN}All tasks completed successfully at ${CYAN}$timestamp${RESET}"
echo -e "${MAGENTA}🎉 Thank you for using Git Automator! Keep coding! 🚀${RESET}"
