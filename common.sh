
# Add timestamp to mpegts
ffmpeg -y -i input_video.mp4 -strict -2 -vf "drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf:fontcolor=white:text='%{pts:hms}:' x=(w-tw)/2: y=h-(2*lh): box=1: boxborderw=5: boxcolor=blue: fontsize=30[out]" output_video.mp4

# Write video via ADB
adb shell screenrecord /sdcard/output.mp4

# Screenshot
adb exec-out screencap -p > screenshot.png



