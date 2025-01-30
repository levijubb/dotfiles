function redtext() {
  echo -e "\033[0;31m$1\033[0m"
}

function nicedatetime() {
  echo $(date +"%D-%T")
}

function isUrl() {
  if [ -n "$(echo "$1" | grep -E '^https?://')" ]; then
    return 0
  else
    return 1
  fi
}
