#!/bin/sh
set -e

(
if [ ! -e "$HOME/.wine/drive_c/Program Files/Kakao/KakaoTalk/KakaoTalk.exe" ]; then
    echo "Install wineboot"
    WINEARCH=win32 WINEPREFIX=~/.wine wine wineboot

    wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
        && chmod +x ./winetricks \
        && ./winetricks -q d3dx11_43 gdiplus richtx32 msxml6 \
        && ./winetricks win7 \
        && ./winetricks sound=pulse

    wget http://app.pc.kakao.com/talk/win32/KakaoTalk_Setup.exe \
        && wine KakaoTalk_Setup.exe
fi
)

exec wine "$HOME/.wine/drive_c/Program Files/Kakao/KakaoTalk/KakaoTalk.exe"
