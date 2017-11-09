import sys
import time
def main():
    if len(sys.argv) != 2:
        print "wrong args"
        return
    parse(sys.argv[1])

def parse(id):
    if len(id) != 24:
        print("invalid id %s" % id)
        return
    timeStamp = parseTime(id[:8])
    timeFormat = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(timeStamp))
    mchHash = parseMachine(id[8:14])
    pid = parsePid(id[14:18])
    inc = parseInc(id[18:24])
    print(u"ts:%d %s\nserverHash:%s\nPid:%d\ninc:%d" % (timeStamp,timeFormat,mchHash,pid,inc))

def parseTime(timePart):
    return int(timePart,16)

def parseMachine(mchPart):
    return mchPart

def parsePid(pidPart):
    return int(pidPart,16)

def parseInc(incPart):
    return int(incPart,16)


if __name__ == "__main__":
    main()
