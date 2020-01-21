
import times
import os
import strutils

template getNewPath(aPath: string): string =
  block getNewPath:
    let lPrefix = getFileInfo(aPath).lastWriteTime.format("yyyyMMdd-HHmm--")
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
          echo "'" & lParam & "' name are OK !!!"
        else:
          if lFileExist:
            moveFile(lParam, lNewPath)
          else:
            moveDir(lParam, lNewPath)
          echo "'" & lParam & "' --> " & "'" & lNewPath & "'"
      else:
        echo "'" & lParam & "' is not a file or a directory!!!"
  else:
    echo "Error: not declared paramStr!!!"
