#!/bin/bash

readonly THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")" && pwd)"
{
  echo "#!/bin/bash"
  echo "test_cases() {"
  curl -so- "$1" \
    | sed -nr '/[入出]力例/,/<\/pre>/p' \
    | sed -r 's/\r//g' \
    | sed -r -e 's|</?h3>||g' -e "s|</?pre>|'|g" -e "s/入力例.*'/echo '/" -e "s/出力例.*'/assertEquals \${result} '/g" -e 's/<[^>]*>//g' \
    | sed -zr "s/\n'/'/g" \
    | sed "s/\${result}/\"&\"/g" \
    | sed "s/echo.*$/result=\"\$(& | $2)\"/g" \
    | sed 's/^/  /'
  echo "}"
  echo ". ${THIS_DIR}/shunit2/shunit2"
} | tee "${THIS_DIR}/test.sh"
chmod +x "${THIS_DIR}/test.sh"
