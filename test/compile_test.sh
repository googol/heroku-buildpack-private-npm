#!/bin/bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testCompileWithoutNpmTokenIsNoOp() {
    compile

    assertCapturedSuccess
    if [ -f "$HOME/.npmrc" ]; then
        fail "npmrc was written even though no NPM_TOKEN was present"
    fi
}

testCompileWithNpmTokenCreatesProperNpmrc() {
    echo "00000000-0000-0000-0000-000000000000" > "$ENV_DIR/NPM_TOKEN"

    compile
    
    assertFileMD5 "7738ff0e43d2ed3822b443cee90f6372" "/etc/npmrc"
}
