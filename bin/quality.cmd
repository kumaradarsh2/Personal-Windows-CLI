@ffprobe -v error -select_streams v:0 -show_entries stream=width,height,r_frame_rate,codec_name -of default=noprint_wrappers=1 "%~1" 
