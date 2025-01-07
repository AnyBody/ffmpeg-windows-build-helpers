#!/bin/bash

# docker actually runs this as a script after having copied it in as part of the "big initial copy" making the image...


OUTPUTDIR=/output

./cross_compile_ffmpeg.sh \
   --build-ffmpeg-shared=n \
   --build-ffmpeg-static=y \
   --disable-nonfree=y \
   --build-intel-qsv=n \
   --compiler-flavors=win64 \
   --enable-gpl=n
   #--ffmpeg-git-checkout-version=13fe148c319d758c0d8be4073905cfa79ed3bfc6

mkdir -p $OUTPUTDIR/static/bin
cp -R -f ./sandbox/win64/ffmpeg_git_xp_compat_lgpl/ffmpeg.exe $OUTPUTDIR/static/bin
# cp -R -f ./sandbox/win64/ffmpeg_git_xp_compat_lgpl/ffprobe.exe $OUTPUTDIR/static/bin
# cp -R -f ./sandbox/win64/ffmpeg_git_xp_compat_lgpl/ffplay.exe $OUTPUTDIR/static/bin

#mkdir -p $OUTPUTDIR/shared
#cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac_shared/bin/ $OUTPUTDIR/shared

if [[ -f /tmp/loop ]]; then
  echo 'sleeping forever so you can attach to this docker if desired' # without this if there's a build failure the docker exits and can't get in to tweak stuff??? :|
  sleep
fi
