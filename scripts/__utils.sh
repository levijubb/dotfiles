function redtext() {
  echo -e "\033[0;31m$1\033[0m"
}

function nicedatetime() {
  echo $(date +"%D-%T")
}
