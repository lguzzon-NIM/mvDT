
import times
import os
import strutils

import mvDT/consts

template getNewPath(aPath: string): string =
  block getNewPath:
    let lPrefix = getFileInfo(aPath).lastWriteTime.format(cPrefix)
    let (dir, name, ext) = splitFile(aPath)
    var lOldName = name
    var lSplit = name.split("--")
    if lSplit.len > 1:
      lOldName = lSplit[1 .. ^1].join()
    let lNewPath = joinPath(dir, lPrefix & lOldName & ext)
    lNewPath

when isMainModule:
  when declared(paramStr):
    for i in 1..paramCount():
      let lParam = paramStr(i)
      if (let lFileExist = fileExists(lParam); let lExist = lFileExist or
          dirExists(lParam); lExist):
        let lNewPath = getNewPath(lParam)
        if lParam == lNewPath:
          echo cOKName%[lParam]
        else:
          if lFileExist:
            moveFile(lParam, lNewPath)
          else:
            moveDir(lParam, lNewPath)
          echo cOKMoved%[lParam, lNewPath]
      else:
        echo cErrorIsNot%[lParam]
  else:
    echo "Error: not declared paramStr!!!"
