#!/bin/sh

TEST_SCRIPTS=(tests/*)

for installation_dir in ~/.pyenv/versions/*
do
        VERSION=$(basename $installation_dir)

        echo " === Testing version $VERSION === "
        PYENV_VERSION=$VERSION
        python3 -c "import sys; print(sys.version)"
        python3 -mpip list
        python3 -mpip install numpy

        for ts in ${TEST_SCRIPTS}
        do
                echo $ts

        done

done





