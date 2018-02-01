#!/bin/bash
test_cases() {
result="$(echo '13 3 1' | awk -f main.awk)"
assertEquals "${result}" '3'
result="$(echo '12 3 1' | awk -f main.awk)"
assertEquals "${result}" '2'
result="$(echo '100000 1 1' | awk -f main.awk)"
assertEquals "${result}" '49999'
result="$(echo '64146 123 456' | awk -f main.awk)"
assertEquals "${result}" '110'
result="$(echo '64145 123 456' | awk -f main.awk)"
assertEquals "${result}" '109'
}
. /Users/yasuhiro.yamada/reps/greymd/atcoder_assert_gen/shunit2/shunit2
