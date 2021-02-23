#!/bin/bash

import sys
import math

file1 = open(sys.argv[1])
file2 = open(sys.argv[2])
start=int(sys.argv[3])

nInd = {}
nats = file2.readline().split()
cts = file2.readline().split()
#print(nats)
#print(cts)
for i in range(0,len(nats)):
    nInd[nats[i]]=cts[i]
line1=file1.readline()
nats_in_file1 = line1.split()[start:]
line1out = "chr rs gpos pos a1 a2"
for i in range(0,len(nats_in_file1)):
    line1out = line1out + " " + str(nats_in_file1[i])
print(line1out)
for line in file1:
    #line2 = file2.readline()
    lineSplit = line.split()
    #line2Split = line2.split()
    res = 0.0
    res_line = ""
    #for i in range(0, start):
    res_line = res_line + lineSplit[1] + " " + lineSplit[1] + ":" + lineSplit[2] + ":" + lineSplit[5] + ":" + lineSplit[4] +  " 0 " + lineSplit[2] + " " + lineSplit[4] + " " + lineSplit[5] + " "
    for i in range(start,len(line.split())):
        if(nats_in_file1[i-start] in nInd):
            if((math.isnan(float(lineSplit[i]))) or (math.isnan(float(nInd[nats_in_file1[i-start]])))):
                res_line = res_line + "0,0 "
            else:
                res = round(float(lineSplit[i]) * float(nInd[nats_in_file1[i-start]]) * 10)
                res2 = round((1.0-float(lineSplit[i])) * float(nInd[nats_in_file1[i-start]]) * 10)
                if(res == 0):
                    res = 1
                res_line = res_line + str(res) + "," + str(res2) + " "
        else:
            res_line = res_line + "TO_DEL "
    print(res_line.strip())

        
