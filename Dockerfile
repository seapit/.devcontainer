FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends clang-format libgtest-dev wget python3-full pipx \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Build GTest library
#RUN cd /usr/src/googletest && \
#    cmake . cmake --build . --target install
RUN mkdir -p /googletest \
    && git clone https://github.com/google/googletest.git -b v1.14.0 /googletest \
    && mkdir -p /googletest/build \
    && cd /googletest/build \
    && cmake .. && make && make install

RUN pipx install cmakelang