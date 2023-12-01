#!/bin/bash

unset LD_PRELOAD
GLIBC_PREFIX=/data/data/com.termux/files/usr/glibc

export VK_ICD_FILENAMES=$GLIBC_PREFIX/share/vulkan/icd.d/freedreno_icd.aarch64.json:$GLIBC_PREFIX/share/vulkan/icd.d/freedreno_icd.armhf.json
export LIBGL_DRIVERS_PATH=$GLIBC_PREFIX/lib/dri:$GLIBC_PREFIX/lib32/dri
export DISPLAY=:0
export USE_HEAP=1
export TU_DEBUG=noconform
export MESA_LOADER_DRIVER_OVERRIDE=zink
export FONTCONFIG_PATH=$PREFIX/etc/fonts
export PULSE_SERVER=127.0.0.1

am start -n com.termux.x11/com.termux.x11.MainActivity >/dev/null 2>&1
winedesktop >/dev/null 2>&1 &

# cat > $TMPDIR/.myvars <<-
#!/data/data/com.termux/files/usr/bin/bash