import Foundation
import CommandLineKit

let cli = CommandLine()

let filePath = StringOption(shortFlag: "f", longFlag: "file", required: true,
        helpMessage: "Path to the output file.")
let compress = BoolOption(shortFlag: "c", longFlag: "compress",
        helpMessage: "Use data compression.")
let help = BoolOption(shortFlag: "h", longFlag: "help",
        helpMessage: "Prints a help message.")
let verbosity = CounterOption(shortFlag: "v", longFlag: "verbose",
        helpMessage: "Print verbose messages. Specify multiple times to increase verbosity.")

cli.addOptions(filePath, compress, help, verbosity)

do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(1)
}