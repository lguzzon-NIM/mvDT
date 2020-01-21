
import times
import os

template getNewPath(aPath: string): string =
  block getNewPath:
    let lPrefix = getFileInfo(aPath).lastWriteTime.format("yyyyMMdd-HHmm--")
    let (dir, name, ext) = splitFile(aPath)
    joinPath(dir, lPrefix & name & ext)

when isMainModule:
  when declared(paramStr):
    for i in 1..paramCount():
      let lParam = paramStr(i)
      if fileExists(lParam):
        moveFile(lParam, getNewPath(lParam))
      elif dirExists(lParam):
        moveDir(lParam, getNewPath(lParam))
      else:
        echo "'" & lParam & "' does not exist!!!"
  else:
    echo "Error: not declared paramStr!!!"
