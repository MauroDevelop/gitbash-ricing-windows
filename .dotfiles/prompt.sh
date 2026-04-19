# --- CUSTOM PROMPT (PS1) ---
set_prompt() {
    local branch=$(git branch --show-current 2>/dev/null)
    local git_info=""
    if [ -n "$branch" ]; then
        git_info=" ($branch)"
    fi
    PS1="\[\e[35m\]\u \[\e[90m\]en \[\e[32m\]\w\[\e[33m\]${git_info}\n\[\e[36m\]>\[\e[0m\] "
}
PROMPT_COMMAND=set_prompt
