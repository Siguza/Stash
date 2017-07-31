# General
alias d='cd';
alias js='osascript -l JavaScript';
alias asn1dump='openssl asn1parse -i -inform DER -in';
mkcd()
{
    mkdir "$1";
    cd "$1";
}
private()
{
    export HISTFILE=/dev/null;
    export PS1='\[\e[0;1;35m\]\h:\W \u$ \[\e[0m\]';
}
invis()
{
    if [ $# -gt 0 ]; then
        if [ "$1" == 'on' ]; then
            defaults write com.apple.finder AppleShowAllFiles YES;
            killall Finder;
            return 0;
        elif [ "$1" == 'off' ]; then
            defaults write com.apple.finder AppleShowAllFiles NO;
            killall Finder;
            return 0;
        fi;
    fi;
    echo 'Usage: invis <on/off>';
    return 1;
}
sha1()
{
    if [ $# -gt 1 ]; then
        echo -e "\x1b[1;91mUsage: ${FUNCNAME[0]} < 'file'\x1b[0m";
        echo -e "\x1b[1;91m       ${FUNCNAME[0]} 'string'\x1b[0m";
        return 1;
    elif [ $# -gt 0 ]; then
        echo -n "$1" | shasum -a 1;
    else
        shasum -a 1;
    fi;
}
sharand()
{
    local alg=1;
    local bits=160;
    if [ "$#" -gt 0 ]; then
        case "$1" in
            '1')
                ;;
            '224'|'256'|'384'|'512')
                local alg="$1";
                local bits="$1";
                ;;
            *)
                echo "Invalid algorithm: $1";
                exit 1;
                ;;
        esac;
    fi;
    dd if=/dev/urandom bs="$((16*bits))" count=1 2>/dev/null | shasum -a "$alg";
}
shuf()
{
    php -r '$a=$_SERVER["argv"];array_shift($a);shuffle($a);echo implode(" ",$a);' "$@";
}
hexswap()
{
    local s='';
    while [ $# -gt 0 ]; do
        s="$s$1";
        shift;
    done;
    if [ "${s:0:2}" = '0x' ]; then
        s="${s:2}";
    fi;
    local r='';
    local i=${#s};
    while [ $i -gt 0 ]; do
        i=$((i-2));
        if [ $i -lt 0 ]; then
            r="${r}0${s:0:1}";
        else
            r="${r}${s:$i:2}";
        fi;
    done;
    echo "$r" | tr '[:upper:]' '[:lower:]';
}
xscp()
{
    ssh "$2" "cat > $1" < "$1";
}

# iOS
SDK='/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk';
iSDK='/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk';
alias igcc='xcrun -sdk iphoneos gcc -Wall -arch armv7 -arch arm64';
alias igcc64='xcrun -sdk iphoneos gcc -Wall -arch arm64';
alias ig++='xcrun -sdk iphoneos g++ -Wall -arch armv7 -arch arm64';
alias ig++64='xcrun -sdk iphoneos g++ -Wall -arch arm64';
alias iclang='xcrun -sdk iphoneos gcc -Wall';
alias iclang++='xcrun -sdk iphoneos g++ -Wall';
alias xcbuild='xcodebuild clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO';
isign()
{
    codesign -s - --entitlements "$2" "$1";
}
payday()
{
    if ! [ -f payload ]; then
        echo 'payload file not found!';
        return 1;
    fi;
    pbzx <payload >payload.ota.xz && unxz -v payload.ota.xz;
}
