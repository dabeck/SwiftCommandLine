# Build binaries for ubuntu
FROM ibmcom/swift-ubuntu:4.1 AS build

RUN mkdir /app
WORKDIR /app

ADD . /app

RUN swift test

# "-Xswiftc -static-stdlib" only works when FOUNDATION is NOT imported @see https://bugs.swift.org/browse/SR-2205
RUN swift build -c release

FROM ibmcom/swift-ubuntu-runtime:4.1

# Binaries should have been compiled against the correct platform (i.e. Ubuntu 14.04).
RUN mkdir /app

COPY --from=build /app/.build/release/SwiftCommandLine /app
#COPY --from=build .build/debug/*.so /app
CMD [ "sh", "-c", "/app/SwiftCommandLine"]