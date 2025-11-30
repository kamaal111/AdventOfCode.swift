set dotenv-load

PN := "pnpm"
PNR := PN + " run"

# List available commands
default:
    just --list --unsorted

# Download Advent of Code input
input year day:
    {{ PNR }} input --year {{ year }} --day {{ day }}

# Make Advent of Code day
day year day:
    {{ PNR }} day --year {{ year }} --day {{ day }}

# Run all Swift tests
test:
    swift test
