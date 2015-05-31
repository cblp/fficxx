#!/bin/bash
set -eu
set -o pipefail

sandbox="$(pwd)/../../../.cabal-sandbox/"
package_db="$sandbox/*-ghc-*-packages.conf.d/"
ghc_sandbox="ghc -package-db $package_db"

rm -rf MySampleGen{,.{hi,o}}
$ghc_sandbox MySampleGen.hs

rm -rf working/ MySample/
./MySampleGen

(   cd ./MySample/
    cabal sandbox --sandbox=$sandbox init
    cabal install
)

rm -rf use_mysample{,.{hi,o}}
$ghc_sandbox use_mysample.hs
LD_LIBRARY_PATH=../cxxlib/lib ./use_mysample
