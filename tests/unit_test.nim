
import unittest

import mvDT
import mvDT/consts


suite "unit-test suite":
    test "getMessage":
        assert(cHelloWorld == getMessage())
