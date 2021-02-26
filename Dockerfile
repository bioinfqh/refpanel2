FROM ubuntu:18.04

COPY make_panel.sh .
COPY test.json .
COPY plinkToRef.R .
COPY multiply_files.py .
COPY nationalities.txt .
COPY merge_plink.sh .
COPY 23dir 23dir
COPY plink_linux_x86_64_20201019 plink_linux_x86_64_20201019
COPY download_libs.R .

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata && apt install r-base -y && apt install -y git && apt-get install -y  python3
#RUN apt-mark hold tzdata && apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata && apt install r-base -y && apt install -y git && apt-get install -y  python3
RUN chmod 777 plink_linux_x86_64_20201019/*

RUN Rscript download_libs.R
