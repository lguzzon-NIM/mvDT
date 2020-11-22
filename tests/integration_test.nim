
import unittest

when defined(js):
  discard
else:
  import os
  import osproc
  import strutils

  # import mvDT
  import mvDT/consts

  include "../scripts/nim/scriptsEnvVarNames.nim"

  suite "integration-test suite":
    test "excecuting the app with no params":
      let lApp = getEnv(gcApplicationToTestEnvVarName)
      let lExec = join([lApp], " ")
      assert("" == execProcess(lExec))
    test "excecuting the app with one wrong param":
      let lApp = getEnv(gcApplicationToTestEnvVarName)
      let lParam = "1qw21qw"
      let lExec = join([lApp, lParam], " ")
      assert(cErrorIsNot%[lParam] & "\n" == execProcess(lExec))
    test "excecuting the app with one wrong params":
      let lApp = getEnv(gcApplicationToTestEnvVarName)
      let lParam1 = "1qw21qw"
      let lParam2 = "1qw22y"
      let lExec = join([lApp, lParam1, lParam2], " ")
      assert(cErrorIsNot%[lParam1] & "\n" & cErrorIsNot%[lParam2] & "\n" ==
          execProcess(lExec))
