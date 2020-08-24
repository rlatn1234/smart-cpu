#!/bin/bash
# <bitbar.title>SmartCPU Script</bitbar.title>
# <bitbar.version>v2.3</bitbar.version>
# <bitbar.author>SaintNo</bitbar.author>
# <bitbar.author.github>tctien342</bitbar.author.github>
# <bitbar.desc>CPU power management for MacOSX.</bitbar.desc>
# <bitbar.image>https://raw.githubusercontent.com/tctien342/smart-cpu/master/menu.png</bitbar.image>
# <bitbar.dependencies>python,bash</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/tctien342/smart-cpu</bitbar.abouturl>

# Get profile name
PROFILE="$(cat /Users/Shared/.smartcpu/profile)"
case $PROFILE in
0)
    PROFILE_NAME="초절전"
    ;;
1)
    PROFILE_NAME="배터리"
    ;;
2)
    PROFILE_NAME="균형"
    ;;
3)
    PROFILE_NAME="성능"
    ;;
4)
    PROFILE_NAME="고성능"
    ;;
esac
echo ""$PROFILE_NAME "모드| font=Arial"
echo "---"

# Print submenu
python3 $(dirname $0)/script/smartcpu.py