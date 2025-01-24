#!/usr/bin/env sh
dir=$(dirname "$0")
lld-link -flavor link "/vctoolsdir:$dir/.xwin-cache/splat/crt" "/winsdkdir:$dir/.xwin-cache/splat/sdk" $@
