which qsb > /dev/null
if [[ "$?" -ne "0" ]]; then
    alias qsb="qsb-qt6"
fi
qsb --glsl 100es,120,150 --hlsl 50 --msl 12 -o doorShader.frag.qsb doorShader.frag
