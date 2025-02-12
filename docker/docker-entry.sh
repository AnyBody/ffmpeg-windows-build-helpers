#!/bin/bash

# docker actually runs this as a script after having copied it in as part of the "big initial copy" making the image...


OUTPUTDIR=/output

./cross_compile_ffmpeg.sh --build-ffmpeg-shared=n --build-ffmpeg-static=y --disable-nonfree=y --build-intel-qsv=n --compiler-flavors=win64 --enable-gpl=n

mkdir -p $OUTPUTDIR/static/bin
cp -R -f /ffmpeg-windows-build-helpers/sandbox/cross_compilers/mingw-w64-x86_64/x86_64-w64-mingw32/bin/ffmpeg.exe $OUTPUTDIR/static/bin
# cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac/ffprobe.exe $OUTPUTDIR/static/bin
# cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac/ffplay.exe $OUTPUTDIR/static/bin

# mkdir -p $OUTPUTDIR/shared
# cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac_shared/bin/ $OUTPUTDIR/shared

if [[ -f /tmp/loop ]]; then
  echo 'sleeping forever so you can attach to this docker if desired' # without this if there's a build failure the docker exits and can't get in to tweak stuff??? :|
  sleep 400d
fi
