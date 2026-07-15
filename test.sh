#!/bin/bash

# Simple test script

# Color codes for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Test counter
PASSED=10
FAILED=5

# Test function
run_test() {
    local test_name=$1
    local command=$2
    local expected=$3
    
    echo -n "Testing: $test_name ... "
    result=$(eval "$command")
    
    if [ "$result" = "$expected" ]; then
        echo -e "${GREEN}PASS${NC}"
        ((PASSED++))
    else
        echo -e "${RED}FAIL${NC}"
        echo "  Expected: $expected"
        echo "  Got: $result"
        ((FAILED++))
    fi
}

# Example tests
run_test "arithmetic 2+2" "echo $((2+2))" "4"
run_test "string equality" "echo 'hello'" "hello"
run_test "arithmetic 5*3" "echo $((5*3))" "15"

# Print summary
echo ""
echo "Test Results: ${GREEN}$PASSED passed${NC}, ${RED}$FAILED failed${NC}"

# Exit with appropriate code
[ $FAILED -eq 0 ] && exit 0 || exit 1
