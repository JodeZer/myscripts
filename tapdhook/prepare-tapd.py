import sys
import pickle

#m = {
#     "feature/new": "gitlab_hook https://www.tapd.cn/20277871/s/1000287 --story=1005281 --user=ZhuJiafeng",
#     "feature/new2":"gitlab_hook https://www.tapd.cn/20277871/s/1000287 --story=1005282 --user=ZhuJiafeng",
# }


#if hook != "":
#    print("")
#    print(hook)

fileName = "tapd_git_conf"
def save(key,value):
    m = load()
    m[key] = value
    pickle.dump(m, open(fileName,'w+'))

def load():
    
    m = {}
    try:
        m = pickle.load(open(fileName,'r'))
    except:
        return m
    return m

def get(key):
    m = load()
    hook = ""
    try:
        hook = m[key]
    except:
        return ""
    return hook

if sys.argv[1] == "save":
    save(sys.argv[2],sys.argv[3])
elif sys.argv[1] == "get":
    msg=get(sys.argv[2])
    if msg != "":
        print("")
        print(msg)
