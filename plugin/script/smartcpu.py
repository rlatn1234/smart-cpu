#!/usr/bin/python3
import sys
profile = -1
battery = False
config = []
setting = []
notification = True
auto_shut = True

def get_status(bool):
    """
        Return check if True
    """
    if bool:
        return "✓"
    else:
        return "..."

def get_now_run(pos):
    """
        Return check for current profile
    """
    return get_status(int(profile) == pos)

# Getting profile position
with open("/Users/Shared/.smartcpu/profile", "r") as input:
    lines = input.readlines()
    for line in lines:
        profile = line

# Getting current config
with open("/Users/Shared/.smartcpu/config", "r") as input:
    lines = input.readlines()
    for line in lines:
        config.append(line)
        
# Getting current config
try:
    with open("/Users/Shared/.smartcpu/notification", "r") as input:
        lines = input.readlines()
        if lines[0].rstrip() == "1":
            notification = True
        else:
            notification = False
except IOError:
    print(":warning: Please install script to use plugin! | color=#ff0000")
    print("---")
    notification = False

# Getting auto shut down conf
try:
    with open("/Users/Shared/.smartcpu/auto_shut", "r") as input:
        lines = input.readlines()
        if lines[0].rstrip() == "1":
            auto_shut = True
        else:
            auto_shut = False
except IOError:
    auto_shut = False
    
# Getting current setting
with open("/Users/Shared/.smartcpu/setting", "r") as input:
    lines = input.readlines()
    for idx,val in enumerate(lines):
        setArray = val.split(" ")
        setConf = {}
        setConf["S"] = setArray[0]
        setConf["L"] = setArray[1]
        setConf["T"] = setArray[2].rstrip()
        setting.append(setConf)

# Getting current battery status
with open("/Users/Shared/.smartcpu/battery", "r") as input:
    lines = input.readlines()
    if str(lines[0]).rstrip() == "true":
        battery = True
    else:
        battery = False

# Print current config
print("전원관리 설정")
print("장기 전원 \t", str(config[0]).rstrip(), "W | color=#ff0000")
print("단기 전원 \t", str(config[1]).rstrip(), "W | color=#ff0000")
if int(config[2]) == 1:
    print("터보 부스트 \t 활성화 | color=#ffff00")
else:
    print("터보 부스트 \t 비활성화 | color=#ffff00")
print("---")
print("전압 오프셋 설정")
print("CPU 전압 \t", str(setting[5]["S"]).rstrip(), "mv | color=#ff0000")
print("CPU 캐쉬   \t", str(setting[5]["T"]).rstrip(), "mv | color=#00ff00")
print("GPU 전압 \t", str(setting[5]["L"]).rstrip(), "mv | color=#0000ff")
# Print select profile
print("---")
print("전원관리 옵션 선택")
if battery:
    print(get_now_run(0),
          "\t초절전 :warning: | bash=/bin/bash param1=/usr/local/bin/cprofile param2=0 terminal=false refresh=2")
    print("----")
    print("--설정값: S" + setting[0]["S"] ,"L" + setting[0]["L"], "T" + setting[0]["T"], "| color=#FC74B3")
    print(get_now_run(1),
          "\t배터리 :battery: | bash=/bin/bash param1=/usr/local/bin/cprofile param2=1 terminal=false refresh=2")
    print("----")
    print("--설정값: S" + setting[1]["S"] ,"L" + setting[1]["L"], "T" + setting[1]["T"], "| color=#FC74B3")
else:
    print(get_now_run(2),
          "\t균형 :snowflake: | bash=/bin/bash param1=/usr/local/bin/cprofile param2=2 terminal=false refresh=2")
    print("--설정값: S" + setting[2]["S"] ,"L" + setting[2]["L"], "T" + setting[2]["T"], "| color=#FC74B3")
    print(get_now_run(3),
          "\t성능 :muscle: | bash=/bin/bash param1=/usr/local/bin/cprofile param2=3 terminal=false refresh=2")
    print("--설정값: S" + setting[3]["S"] ,"L" + setting[3]["L"], "T" + setting[3]["T"], "| color=#FC74B3")
    print(get_now_run(4),
          "\t고성능 :fire: | bash=/bin/bash param1=/usr/local/bin/cprofile param2=4 terminal=false refresh=2")
    print("--설정값: S" + setting[4]["S"] ,"L" + setting[4]["L"], "T" + setting[4]["T"], "| color=#FC74B3")
print("---")
print("추가설정")
if (notification): 
    print(get_status(notification),"\t알림 켜짐 | bash=/bin/bash param1=/usr/local/bin/cprofile param2=-1 param3=0 terminal=false refresh=2")
else:
    print(get_status(notification),"\t알림 꺼짐 | bash=/bin/bash param1=/usr/local/bin/cprofile param2=-1 param3=1 terminal=false refresh=2")

if (auto_shut): 
    print(get_status(auto_shut),"\t자동 재시동 켜짐 | bash=/bin/bash param1=/usr/local/bin/cprofile param2=-1 param3=-1 param4=0 terminal=false refresh=2")
else:
    print(get_status(auto_shut),"\t자동 재시동 꺼짐 | bash=/bin/bash param1=/usr/local/bin/cprofile param2=-1 param3=-1 param4=1 terminal=false refresh=2")
