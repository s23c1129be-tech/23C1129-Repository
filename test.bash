#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 maeda
# SPDX-License-Identifier: MIT

set -euo pipefail

ng() {
    echo "NG at line $1: $2" >&2
    exit 1
}

out1=$(printf "10\n20\n30\n" | ./chanvage -n 2)
exp1=$(printf "10.0\n15.0\n25.0")
[ "$out1" = "$exp1" ] || ng "$LINENO" "expected '$exp1', got '$out1'"

out2=$(printf "10\n20\n30\n" | ./chanvage -n 2 -m 5.0)
exp2=$(printf "10.0\n15.0\n20.0")
[ "$out2" = "$exp2" ] || ng "$LINENO" "expected '$exp2', got '$out2'"

out3=$(printf "\n10\n\n20\n" | ./chanvage -n 2)
exp3=$(printf "10.0\n15.0")
[ "$out3" = "$exp3" ] || ng "$LINENO" "expected '$exp3', got '$out3'"

set +e
err_out=$(printf "10\ninvalid\n" | ./chanvage 2>&1 >/dev/null)
status=$?
set -e
[ "$status" -ne 0 ] || ng "$LINENO" "expected non-zero exit code for invalid input"
[ -n "$err_out" ] || ng "$LINENO" "expected error message on stderr"

set +e
./chanvage -n 0 >/dev/null 2>&1
status_n=$?
./chanvage -m -1 >/dev/null 2>&1
status_m=$?
set -e
[ "$status_n" -ne 0 ] || ng "$LINENO" "expected non-zero exit code for -n 0"
[ "$status_m" -ne 0 ] || ng "$LINENO" "expected non-zero exit code for -m -1"

echo "OK"
