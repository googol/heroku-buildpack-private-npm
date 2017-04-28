#!/bin/bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testCompileRuns() {
    compile
    assertCapturedSuccess
}
