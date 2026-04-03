#!/bin/bash

# Colors (Catppuccin Mocha)
RST='\033[0m'
BOLD='\033[1m'
FG_YELLOW='\033[38;5;229m'
FG_BLUE='\033[38;5;117m'
FG_GREEN='\033[38;5;150m'
FG_PINK='\033[38;5;218m'
FG_LAVENDER='\033[38;5;183m'
FG_PEACH='\033[38;5;223m'
FG_MAUVE='\033[38;5;203m'
FG_RED='\033[38;5;210m'
FG_TEAL='\033[38;5;159m'
FG_OVERLAY='\033[38;5;245m'
FG_TEXT='\033[38;5;253m'
FG_FLAMINGO='\033[38;5;217m'

key() { printf "${FG_PINK}%-18s${RST}" "$1"; }
desc() { printf "${FG_TEXT}%-44s${RST}" "$1"; }
header_color() { printf "$1"; }
sep() { printf "${FG_OVERLAY}│${RST}"; }

clear
echo ""
printf "  ${FG_GREEN}╔══════════════════════════════════════════════════════════════════╗${RST}\n"
printf "  ${FG_GREEN}║${RST}                      ${BOLD}${FG_BLUE}TMUX KEYBINDINGS${RST}                            ${FG_GREEN}║${RST}\n"
printf "  ${FG_GREEN}╚══════════════════════════════════════════════════════════════════╝${RST}\n"
echo ""
printf "  ${FG_YELLOW}PREFIX: C-Space${RST} ${FG_OVERLAY}(also C-a)${RST}\n"
printf "  ${FG_OVERLAY}C- = Ctrl  M- = Alt (Meta)  S- = Shift${RST}\n"
echo ""

# ── Window Management ──
printf "  ${FG_LAVENDER}┌────────────────────────────────────────────────────────────────┐${RST}\n"
printf "  ${FG_LAVENDER}│${RST}  ${BOLD}${FG_YELLOW}WINDOW MANAGEMENT${RST}                                              ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}├────────────────────┬───────────────────────────────────────────┤${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key 'c')${FG_LAVENDER}│${RST} $(desc 'New window (same path)')                   ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key 'k')${FG_LAVENDER}│${RST} $(desc 'Kill window')                              ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key 'r')${FG_LAVENDER}│${RST} $(desc 'Rename window')                            ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key '1-9')${FG_LAVENDER}│${RST} $(desc 'Switch to window N')                       ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key 'M-1 .. M-9')${FG_LAVENDER}│${RST} $(desc 'Switch to window (no prefix)')            ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key 'M-Left')${FG_LAVENDER}│${RST} $(desc 'Previous window')                           ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key 'M-Right')${FG_LAVENDER}│${RST} $(desc 'Next window')                               ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key 'M-S-Left')${FG_LAVENDER}│${RST} $(desc 'Swap window left')                          ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key 'M-S-Right')${FG_LAVENDER}│${RST} $(desc 'Swap window right')                         ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key 'Tab')${FG_LAVENDER}│${RST} $(desc 'Last window')                               ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key 'M-Tab')${FG_LAVENDER}│${RST} $(desc 'Last window (no prefix)')                   ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}│${RST} $(key 'F')${FG_LAVENDER}│${RST} $(desc 'Choose window by name')                     ${FG_LAVENDER}│${RST}\n"
printf "  ${FG_LAVENDER}└────────────────────┴───────────────────────────────────────────┘${RST}\n"
echo ""

# ── Session Management ──
printf "  ${FG_GREEN}┌────────────────────────────────────────────────────────────────┐${RST}\n"
printf "  ${FG_GREEN}│${RST}  ${BOLD}${FG_YELLOW}SESSION MANAGEMENT${RST}                                              ${FG_GREEN}│${RST}\n"
printf "  ${FG_GREEN}├────────────────────┬───────────────────────────────────────────┤${RST}\n"
printf "  ${FG_GREEN}│${RST} $(key 'C')${FG_GREEN}│${RST} $(desc 'New session (same path)')                    ${FG_GREEN}│${RST}\n"
printf "  ${FG_GREEN}│${RST} $(key 'K')${FG_GREEN}│${RST} $(desc 'Kill session')                               ${FG_GREEN}│${RST}\n"
printf "  ${FG_GREEN}│${RST} $(key 'R')${FG_GREEN}│${RST} $(desc 'Rename session')                             ${FG_GREEN}│${RST}\n"
printf "  ${FG_GREEN}│${RST} $(key 'P')${FG_GREEN}│${RST} $(desc 'Previous session')                           ${FG_GREEN}│${RST}\n"
printf "  ${FG_GREEN}│${RST} $(key 'N')${FG_GREEN}│${RST} $(desc 'Next session')                               ${FG_GREEN}│${RST}\n"
printf "  ${FG_GREEN}│${RST} $(key 'M-Up')${FG_GREEN}│${RST} $(desc 'Previous session (no prefix)')               ${FG_GREEN}│${RST}\n"
printf "  ${FG_GREEN}│${RST} $(key 'M-Down')${FG_GREEN}│${RST} $(desc 'Next session (no prefix)')                   ${FG_GREEN}│${RST}\n"
printf "  ${FG_GREEN}└────────────────────┴───────────────────────────────────────────┘${RST}\n"
echo ""

# ── Pane Management ──
printf "  ${FG_BLUE}┌────────────────────────────────────────────────────────────────┐${RST}\n"
printf "  ${FG_BLUE}│${RST}  ${BOLD}${FG_YELLOW}PANE MANAGEMENT${RST}                                                 ${FG_BLUE}│${RST}\n"
printf "  ${FG_BLUE}├────────────────────┬───────────────────────────────────────────┤${RST}\n"
printf "  ${FG_BLUE}│${RST} $(key 'h')${FG_BLUE}│${RST} $(desc 'Split horizontal - top/bottom (same path)')  ${FG_BLUE}│${RST}\n"
printf "  ${FG_BLUE}│${RST} $(key 'v')${FG_BLUE}│${RST} $(desc 'Split vertical - left/right (same path)')    ${FG_BLUE}│${RST}\n"
printf "  ${FG_BLUE}│${RST} $(key '|')${FG_BLUE}│${RST} $(desc 'Split vertical - left/right (same path)')    ${FG_BLUE}│${RST}\n"
printf "  ${FG_BLUE}│${RST} $(key '-')${FG_BLUE}│${RST} $(desc 'Split horizontal - top/bottom (same path)')  ${FG_BLUE}│${RST}\n"
printf "  ${FG_BLUE}│${RST} $(key 'x')${FG_BLUE}│${RST} $(desc 'Kill pane')                                  ${FG_BLUE}│${RST}\n"
printf "  ${FG_BLUE}│${RST} $(key 'M-\\')${FG_BLUE}│${RST} $(desc 'Split vertical - left/right (no prefix)')    ${FG_BLUE}│${RST}\n"
printf "  ${FG_BLUE}│${RST} $(key 'M--')${FG_BLUE}│${RST} $(desc 'Split horizontal - top/bottom (no prefix)')  ${FG_BLUE}│${RST}\n"
printf "  ${FG_BLUE}└────────────────────┴───────────────────────────────────────────┘${RST}\n"
echo ""

# ── Navigation & Resize ──
printf "  ${FG_PINK}┌────────────────────────────────────────────────────────────────┐${RST}\n"
printf "  ${FG_PINK}│${RST}  ${BOLD}${FG_YELLOW}PANE NAVIGATION & RESIZE${RST}                                       ${FG_PINK}│${RST}\n"
printf "  ${FG_PINK}├────────────────────┬───────────────────────────────────────────┤${RST}\n"
printf "  ${FG_PINK}│${RST} $(key 'M-h')${FG_PINK}│${RST} $(desc 'Move left')                                  ${FG_PINK}│${RST}\n"
printf "  ${FG_PINK}│${RST} $(key 'M-l')${FG_PINK}│${RST} $(desc 'Move right')                                ${FG_PINK}│${RST}\n"
printf "  ${FG_PINK}│${RST} $(key 'M-k')${FG_PINK}│${RST} $(desc 'Move up')                                   ${FG_PINK}│${RST}\n"
printf "  ${FG_PINK}│${RST} $(key 'M-j')${FG_PINK}│${RST} $(desc 'Move down')                                 ${FG_PINK}│${RST}\n"
printf "  ${FG_PINK}├────────────────────┼───────────────────────────────────────────┤${RST}\n"
printf "  ${FG_PINK}│${RST} $(key 'C-M-S-Left')${FG_PINK}│${RST} $(desc 'Shrink left')                               ${FG_PINK}│${RST}\n"
printf "  ${FG_PINK}│${RST} $(key 'C-M-S-Right')${FG_PINK}│${RST} $(desc 'Expand right')                              ${FG_PINK}│${RST}\n"
printf "  ${FG_PINK}│${RST} $(key 'C-M-S-Up')${FG_PINK}│${RST} $(desc 'Expand up')                                 ${FG_PINK}│${RST}\n"
printf "  ${FG_PINK}│${RST} $(key 'C-M-S-Down')${FG_PINK}│${RST} $(desc 'Shrink down')                               ${FG_PINK}│${RST}\n"
printf "  ${FG_PINK}└────────────────────┴───────────────────────────────────────────┘${RST}\n"
echo ""

# ── Popups & Tools ──
printf "  ${FG_RED}┌────────────────────────────────────────────────────────────────┐${RST}\n"
printf "  ${FG_RED}│${RST}  ${BOLD}${FG_YELLOW}POPUPS & TOOLS${RST}                                                  ${FG_RED}│${RST}\n"
printf "  ${FG_RED}├────────────────────┬───────────────────────────────────────────┤${RST}\n"
printf "  ${FG_RED}│${RST} $(key 'g')${FG_RED}│${RST} $(desc 'Lazygit popup')                              ${FG_RED}│${RST}\n"
printf "  ${FG_RED}│${RST} $(key 'd')${FG_RED}│${RST} $(desc 'Lazydocker popup')                          ${FG_RED}│${RST}\n"
printf "  ${FG_RED}│${RST} $(key 't')${FG_RED}│${RST} $(desc 'Terminal popup')                             ${FG_RED}│${RST}\n"
printf "  ${FG_RED}│${RST} $(key 'f')${FG_RED}│${RST} $(desc 'FZF file finder -> nvim')                    ${FG_RED}│${RST}\n"
printf "  ${FG_RED}│${RST} $(key 'm')${FG_RED}│${RST} $(desc 'View README.md (glow)')                      ${FG_RED}│${RST}\n"
printf "  ${FG_RED}│${RST} $(key '\`')${FG_RED}│${RST} $(desc 'Edit tmux.conf in nvim')                      ${FG_RED}│${RST}\n"
printf "  ${FG_RED}│${RST} $(key '?')${FG_RED}│${RST} $(desc 'This help menu')                             ${FG_RED}│${RST}\n"
printf "  ${FG_RED}│${RST} $(key 'o')${FG_RED}│${RST} $(desc 'Open opencode in new window')                 ${FG_RED}│${RST}\n"
printf "  ${FG_RED}└────────────────────┴───────────────────────────────────────────┘${RST}\n"
echo ""

# ── Toggles ──
printf "  ${FG_PEACH}┌────────────────────────────────────────────────────────────────┐${RST}\n"
printf "  ${FG_PEACH}│${RST}  ${BOLD}${FG_YELLOW}TOGGLES${RST}                                                        ${FG_PEACH}│${RST}\n"
printf "  ${FG_PEACH}├────────────────────┬───────────────────────────────────────────┤${RST}\n"
printf "  ${FG_PEACH}│${RST} $(key 'y')${FG_PEACH}│${RST} $(desc 'Toggle playerctl media display')            ${FG_PEACH}│${RST}\n"
printf "  ${FG_PEACH}│${RST} $(key 'u')${FG_PEACH}│${RST} $(desc 'Toggle workspace usage display')            ${FG_PEACH}│${RST}\n"
printf "  ${FG_PEACH}└────────────────────┴───────────────────────────────────────────┘${RST}\n"
echo ""

# ── Copy Mode ──
printf "  ${FG_TEAL}┌────────────────────────────────────────────────────────────────┐${RST}\n"
printf "  ${FG_TEAL}│${RST}  ${BOLD}${FG_YELLOW}COPY MODE${RST}                                                      ${FG_TEAL}│${RST}\n"
printf "  ${FG_TEAL}├────────────────────┬───────────────────────────────────────────┤${RST}\n"
printf "  ${FG_TEAL}│${RST} $(key '[')${FG_TEAL}│${RST} $(desc 'Enter copy mode')                            ${FG_TEAL}│${RST}\n"
printf "  ${FG_TEAL}│${RST} $(key 'v')${FG_TEAL}│${RST} $(desc 'Begin selection (in copy mode)')             ${FG_TEAL}│${RST}\n"
printf "  ${FG_TEAL}│${RST} $(key 'y')${FG_TEAL}│${RST} $(desc 'Copy selection (in copy mode)')              ${FG_TEAL}│${RST}\n"
printf "  ${FG_TEAL}└────────────────────┴───────────────────────────────────────────┘${RST}\n"
echo ""

# ── Misc ──
printf "  ${FG_FLAMINGO}┌────────────────────────────────────────────────────────────────┐${RST}\n"
printf "  ${FG_FLAMINGO}│${RST}  ${BOLD}${FG_YELLOW}MISC${RST}                                                           ${FG_FLAMINGO}│${RST}\n"
printf "  ${FG_FLAMINGO}├────────────────────┬───────────────────────────────────────────┤${RST}\n"
printf "  ${FG_FLAMINGO}│${RST} $(key 'q')${FG_FLAMINGO}│${RST} $(desc 'Reload tmux config')                         ${FG_FLAMINGO}│${RST}\n"
printf "  ${FG_FLAMINGO}└────────────────────┴───────────────────────────────────────────┘${RST}\n"
echo ""
printf "  ${FG_OVERLAY}Press ${BOLD}${FG_YELLOW}Enter${RST}${FG_OVERLAY} to close${RST}\n"
read -r
