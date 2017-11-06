import pandas as pd
import os
def transfer(filename):
    csv=filename.replace(".dta", ".csv")
    data = pd.io.stata.read_stata(filename)
    data.to_csv(csv)
    print("from {0} write to {1}".format(filename, csv))

def list():
    for f in os.listdir("."):
        if ".dta" in f:
            yield f

if __name__ == "__main__":
    lists=list()
    for f in lists:
        transfer(f)