FROM nvidia/cuda:12.3.2-cudnn9-devel-ubuntu22.04

WORKDIR /mpeg

RUN apt update && apt install -y build-essential autoconf automake build-essential \
cmake git-core libass-dev libc6 libc6-dev libfdk-aac-dev libfreetype6-dev libgnutls28-dev \
libmp3lame-dev libnuma-dev libnuma1 libopus-dev libsdl2-dev libtool libunistring-dev libva-dev \
libvdpau-dev libvorbis-dev libvpx-dev libx264-dev libx265-dev libxcb-shm0-dev libxcb-xfixes0-dev \
libxcb1-dev meson ninja-build pkg-config texinfo unzip wget yasm zlib1g-dev g++-12 libunistring-dev \
libaom-dev libdav1d-dev

# using prebuilt binaries

ADD ffmpeg .
ADD ffprobe .
ADD ffplay .

RUN chmod +x ffmpeg && chmod +x ffprobe && chmod +x ffplay
RUN ln -s /mpeg/ffmpeg /usr/bin/ffmpeg && ln -s /mpeg/ffprobe /usr/bin/ffprobe

ENTRYPOINT ["ffmpeg"]
