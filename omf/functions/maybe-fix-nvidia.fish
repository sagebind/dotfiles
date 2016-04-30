function maybe-fix-nvidia
  set -l blacklist etc/prime-discrete \
    etc/alternatives/x86_64-linux-gnu_nvidia_xconfig \
    etc/alternatives/x86_64-linux-gnu_nvidia_smi \
    etc/alternatives/x86_64-linux-gnu_nvidia_persistenced \
    etc/alternatives/x86_64-linux-gnu_nvidia_modconf \
    etc/alternatives/x86_64-linux-gnu_nvidia_drv \
    etc/alternatives/x86_64-linux-gnu_nvidia_bug_report \
    etc/alternatives/x86_64-linux-gnu_nvidia_app_profile_keys \
    etc/alternatives/x86_64-linux-gnu_nvidia_app_profile \
    etc/alternatives/x86_64-linux-gnu_nvidia-smi.1.gz \
    etc/alternatives/x86_64-linux-gnu_nvidia-debugdump \
    etc/alternatives/x86_64-linux-gnu_nvidia-cuda-mps-server \
    etc/alternatives/x86_64-linux-gnu_nvidia-cuda-mps-control.1.gz \
    etc/alternatives/x86_64-linux-gnu_nvidia-cuda-mps-control \
    etc/alternatives/x86_64-linux-gnu_man_persistenced.gz \
    etc/alternatives/x86_64-linux-gnu_man_nvidiaxconfig.gz \
    etc/alternatives/x86_64-linux-gnu_libvdpau_nvidia.so_lib32 \
    etc/alternatives/x86_64-linux-gnu_libvdpau_nvidia.so.1_lib32 \
    etc/alternatives/x86_64-linux-gnu_libvdpau_nvidia.so.1 \
    etc/alternatives/x86_64-linux-gnu_libvdpau_nvidia.so \
    etc/alternatives/x86_64-linux-gnu_grub_fb_blacklist \
    etc/modprobe.d/nvidia-graphics-drivers.conf \
    usr/bin/nvidia-xconfig \
    usr/bin/nvidia-smi \
    usr/bin/nvidia-persistenced \
    usr/bin/nvidia-debugdump \
    usr/bin/nvidia-cuda-mps-server \
    usr/bin/nvidia-cuda-mps-control \
    usr/bin/nvidia-bug-report.sh \
    usr/lib/libvdpau_nvidia.so \
    usr/lib/vdpau/libvdpau_nvidia.so.1 \
    usr/lib/xorg/modules/drivers/nvidia_drv.so \
    usr/lib32/libvdpau_nvidia.so \
    usr/lib32/vdpau/libvdpau_nvidia.so.1 \
    usr/share/grub-gfxpayload-lists/blacklist/10_proprietary-graphics-drivers

  for file in $blacklist
    if test -e /$file
      mkdir -p /var/nvidia-removed/(dirname $file)
      mv -f /$file /var/nvidia-removed/$file
    end
  end

  # /etc/alternatives/i386-linux-gnu_gl_conf -> /usr/lib/nvidia-355/alt_ld.so.conf
  # /etc/alternatives/x86_64-linux-gnu_egl_conf -> /usr/lib/x86_64-linux-gnu/mesa-egl/ld.so.conf
  # /etc/alternatives/x86_64-linux-gnu_gl_conf -> /usr/lib/x86_64-linux-gnu/mesa/ld.so.conf
  # /etc/alternatives/x86_64-linux-gnu_xorg_extra_modules -> /usr/lib/x86_64-linux-gnu/xorg/x11-extra-modules/
end
