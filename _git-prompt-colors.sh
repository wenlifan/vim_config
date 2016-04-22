# This is an alternative approach. Single line in git repo.
override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Single_line_Ubuntu"

  GIT_PROMPT_PREFIX="[ "
  GIT_PROMPT_SUFFIX=" ]"
  GIT_PROMPT_SEPARATOR=" |"
  GIT_PROMPT_STAGED=" ${BoldRed}● ${ResetColor}"
  GIT_PROMPT_CONFLICTS=" ${BoldRed}✖ ${ResetColor}"
  GIT_PROMPT_CHANGED=" ${BoldBlue}✚ ${ResetColor}"
  GIT_PROMPT_UNTRACKED=" ${BoldCyan}…${ResetColor}"
  GIT_PROMPT_STASHED=" ${BoldBlue}⚑ ${ResetColor}"
  GIT_PROMPT_CLEAN=" ${BoldGreen}✔ ${ResetColor}"

  GIT_PROMPT_COMMAND_OK=""
  GIT_PROMPT_COMMAND_FAIL="${BoldRed}✘ "

  GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_${BoldGreen}\u@\h${ResetColor} ${BoldBlue}${PathShort}${ResetColor}"
  GIT_PROMPT_END_USER="${ResetColor} $ "
  GIT_PROMPT_END_ROOT="${BoldRed} # "

}

reload_git_prompt_colors "Single_line_Ubuntu"

