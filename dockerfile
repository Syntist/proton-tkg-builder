FROM archlinux:latest

USER root

# Set up pacman repositories
RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf

# Install dependencies
RUN pacman -Syu --noconfirm base-devel lib32-jack2 git curl bash ccache vulkan-headers linux-api-headers && \
    pacman -Scc --noconfirm

# Set the default working directory
USER root

WORKDIR /proton-tkg

# Default command (optional)
CMD ["bash"]