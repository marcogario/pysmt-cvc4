# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    pushd .
    cd CVC4/contrib
    ./get-antlr-3.4
    cd ../
    ./autogen.sh
    ./configure --with-antlr-dir=$PWD/antlr-3.4 ANTLR=$PWD/antlr-3.4/bin/antlr3 --enable-optimized --enable-language-bindings=python
    make
    popd
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c 'import sys; import CVC4; sys.exit(CVC4.version())'
}
