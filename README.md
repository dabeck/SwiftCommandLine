# SwiftCommandLine

This app is just a simple project to demonstrate a solid setup to develop serverside swift applications with CLion.

actual configuration:
 - Uses swift 4.1
 - CLion 2018.1
 - Includes an example lib (CommandLineKit)
 - Includes a simple test setup to demonstrate how this works
 - Includes example Dockerfile with build, test and runtime functionality
 
 ## Howto use it:
 
 ### CLion
 
 This project was setup using [CLion 2018.1](https://download-cf.jetbrains.com/cpp/CLion-2018.1.1.dmg) with installed [SwiftPlugin](https://blog.jetbrains.com/clion/2015/12/swift-plugin-for-clion/) on macOS.
  
 Be sure to install the [swift 4.1 toolchain](https://swift.org/builds/swift-4.1-release/xcode/swift-4.1-RELEASE/swift-4.1-RELEASE-osx.pkg) which is available [here](https://swift.org/download/). 
 
 ### Docker
 
 * `cd` into the project directory
 * use `docker build -t swiftcommandline .` to build the actual project
 * run the currently built image with `docker run swiftcommandline`
 
 This should output something like:
 
 ```
 Missing required options: ["-f, --file"]
 
 Usage: /app/SwiftCommandLine [options]
   -f, --file:
       Path to the output file.
   -c, --compress:
       Use data compression.
   -h, --help:
       Prints a help message.
   -v, --verbose:
       Print verbose messages. Specify multiple times to increase verbosity.
```

...which is the current demo output.

### Findings and pain points

- CLion does not set an executable by default. So when you hit the "run"-Button it just compiles the project. 
   - Just add the executable manually: ![](https://dbecker.net/ds/Screen-Shot-2018-04-12-13-47-03-iHxcKJFBvh.png)
     which is usually located at `.build/debug/<execname>`
- CLion/CMake don't do code completion by default. The built in workaround does an ok-job.
    (See: https://youtrack.jetbrains.com/issue/OC-14894)
- CLion does not provide Quick Documentation for imported libraries.
    (See: https://youtrack.jetbrains.com/issue/OC-14891)
- There is currently no runtime dockerimage based on alpine due to the lack of glib and other swift dependencies on alpine.
    (See: https://github.com/IBM-Swift/swift-ubuntu-docker/issues/7)
    



_This project is just for my personal needs and to test things out. No guarantee of functionality._