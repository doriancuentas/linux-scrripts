#!/bin/bash
stream_link=https://mdstrm.com/audio/5fab0687bcd6c2389ee9480c/live.m3u8
stream_name="oxigeno-"
stream_suffix="%z.mkv"
streamdate_suffix=$(date +"%Y%m%d-%I%M")
stream_dir=${2:-$HOME/test/recording}
[ -d $stream_dir ] || mkdir $stream_dir
length=${1:-"05:00:00"}
logfile="$stream_dir/${stream_name}${streamdate_suffix}.log"
ffmpeg_out_file=$stream_dir/$stream_name${streamdate_suffix}$stream_suffix
echo "starting record" >> "${logfile}"
echo -e "\tstream \t\t: $stream_link" >> "${logfile}"
echo -e "\tout file \t\t: $ffmpeg_out_file" >> "${logfile}"
echo -e "\tlength \t\t: $length" >> "${logfile}"
echo -e "\tPWD \t\t: $PWD" >> "${logfile}"
echo "################################################################################" >> "${logfile}"
echo "ffmpeg -i $stream_link -c copy -f segment -segment_time 10000 -segment_format mkv -segment_atclocktime 1 -reset_timestamps 1 -strftime 1 -t $length $ffmpeg_out_file" >> "${logfile}"
echo "################################################################################" >> "${logfile}"
ffmpeg -i "$stream_link" -c copy -f segment -segment_time 10000 -segment_format mkv -segment_atclocktime 1 -reset_timestamps 1 -strftime 1 -t "$length" "$ffmpeg_out_file" </dev/null >> "${logfile}" 2>&1 
echo "################################################################################" >> "${logfile}"
