#!/bin/bash -xv
# SPDX-FileCopyrightText: 2026 <あなたの氏名>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目のテスト失敗
        res=1
}

res=0

### NORMAL INPUT ###
out=$(echo "180" | ./unitconv deg2rad -r 4)
[ "$?" = 0 ]          || ng "$LINENO"
[ "${out}" = 3.1416 ] || ng "$LINENO"

out=$(echo "36 72" | ./unitconv kmh2ms)
[ "$?" = 0 ]         || ng "$LINENO"
[ "${out}" = "10 20" ] || ng "$LINENO"

out=$(printf "0\n100\n" | ./unitconv c2f)
[ "$?" = 0 ]               || ng "$LINENO"
[ "${out}" = $'32\n212' ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./unitconv deg2rad 2>/dev/null)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./unitconv deg2rad 2>/dev/null)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "10" | ./unitconv unknown_mode 2>/dev/null)
[ "$?" = 2 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
