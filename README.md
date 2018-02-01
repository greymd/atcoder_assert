# atcoder_assert

Generate unit tests from specific AtCoder web site.

# Usage

```
$ git clone --recursive <clone this repository>
$ ./generate.sh https://abc078.contest.atcoder.jp/tasks/abc078_b "awk -f main.awk"
> #!/bin/bash
> test_cases() {
>   result="$(echo '13 3 1' | awk -f main.awk)"
>   assertEquals "${result}" '3'
>   result="$(echo '12 3 1' | awk -f main.awk)"
>   assertEquals "${result}" '2'
>   result="$(echo '100000 1 1' | awk -f main.awk)"
>   assertEquals "${result}" '49999'
>   result="$(echo '64146 123 456' | awk -f main.awk)"
>   assertEquals "${result}" '110'
>   result="$(echo '64145 123 456' | awk -f main.awk)"
>   assertEquals "${result}" '109'
> }
> . /path/to/this/repo/atcoder_assert/shunit2/shunit2

$ ./test.sh
test_cases

Ran 1 test.

OK
```
