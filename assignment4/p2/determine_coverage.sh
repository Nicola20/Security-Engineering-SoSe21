#!/bin/sh
alias firefox='/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe'
PROJECT_DIR="/mnt/c/wsl_share/1_FS_Master/Security_Engineering/Security-Engineering-SoSe21/assignment4/p2"
echo $PROJECT_DIR
BIN_DIR="$PROJECT_DIR/bin"
COV_DIR="$PROJECT_DIR/coverage"
TEST_DIR="$PROJECT_DIR/tests"

cd $TEST_DIR
testgen "vec_tests_tg.ts"
gprbuild "$PROJECT_DIR/p2_vectors_tg.gpr"
"$BIN_DIR/vec_tests_tg"
gcov "$BIN_DIR/vec_tests_tg"
mv *.gcov $COV_DIR
lcov --capture --directory $PROJECT_DIR --output-file "$COV_DIR/lcov/coverage.info"
genhtml -o "$COV_DIR/lcov/" "$COV_DIR/lcov/coverage.info"
firefox ../coverage/lcov/index.html

