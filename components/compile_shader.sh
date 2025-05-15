#!/usr/bin/env bash
set -o pipefail # no -eu because which qsb is supposed to fail
cd "$(dirname $0)" || exit 1

which qsb > /dev/null
if [[ "$?" -ne "0" ]]; then
    function qsb {
        qsb-qt6 $@
    }
fi
qsb --glsl 100es,120,150 --hlsl 50 --msl 12 -o doorShader.frag.qsb doorShader.frag
