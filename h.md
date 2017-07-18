

#### vanilla LLVM Clang fuzzing 
___________________________________________
#### switch compiler from MSVC 2013 to LLVM Clang. 

#### increase our test coverage by modern fuzzing techniques___
___________________________________________



![test](https://raw.githubusercontent.com/google/oss-fuzz/master/docs/images/process.png)




https://github.com/google/oss-fuzz

______________________________________________

.
PDF as a service 
 api access to 3rd party apps
user uploads pdf/txt/img/web/3d? cad/cam?
server accepts commands to modify pdf
return new doc
.
 ______________________________________________

android mobile/watch
notifications new pdf to sign etc

  ______________________________________________


There are currently two flavors of Clang that work on Windows: vanilla LLVM Clang, and Clang/C2 with Microsoft Codegen.


1)  LLVM Clang:
______________________________________________

Unnable to generate PDB debugging information with MSVC 2010, 2012, 2013 and 2015.  A 64-bit version is also available, but it doesn't integrate as well with Visual Studio. MSVC 2017?

LibFuzzer https://www.youtube.com/watch?v=FzaR3iH2iZs


2) Visual Studio 2015/2017 with Clang/C2:
______________________________________________

1.1) for mobile projects only. (ATL/MFC projects will have lots of build errors that we need to address)
1.2) we cannot apply clang sanitizers, this will result in undefined behavior sanitaizers to protect from Strict Aliasing errors
1.3) we cannot apply libFuzzing tool to increase our test coverage by fuzzing
1.4) pdb generation:
https://clang.llvm.org/docs/MSVCCompatibility.html
Debug info: Mostly complete. Clang emits relatively complete CodeView debug information if /Z7 or /Zi is passed. Microsoft’s link.exe will transform the CodeView debug information into a PDB that works in Windows debuggers and other tools that consume PDB files like ETW. Work to teach lld about CodeView and PDBs is ongoing.
A simple POC is good idea to check it.
1.5)-fms-extensions -fms-compatibility  -fdelayed-template-parsing

______________________________________________
 about sanitizers and undefined behavior https://blog.regehr.org/archives/1520
 
 

https://blog.regehr.org/archives/1520

Since Visual Studio 2015 Update 1, Microsoft added Clang as an official alternative frontend to its C2 backend code generator. However, this doesn't play well with CMake, yet, mainly since CMake doesn't recognize the alternative platform toolset v140_clang_3_7 correctly, and fails at defining some flags (exceptions and debugging format) and directories correctly. This was last tested with CMake 3.5RC2 and MSVC 2015 Update 2 CTP.

Clang version in Visual C++ 2017 Clang/C2 toolset is getting old: 3.8. One of the things this blocks is the use of range-based loops, which the MS-compiler supports, but Clang only supports from 3.9 upwards.

  ______________________________________________



>Andrew Pardoe [MSFT]
>We are unlikely to be updating Clang/C2 at any time. We originally created Clang/C2 to enable developers to bring code from other platforms to Windows. Now, the MSVC compiler is almost standards-conforming and we expect to be finished this year (https://blogs.msdn.microsoft.com/vcblog/2017/03/07/c-standards-conformance-from-microsoft/). You should be able to use MSVC for almost any code that you previously would have used Clang/C2 for. Soon, MSVC should compile all code that Clang/C2 compiles, and more.
>
>We will keep supporting the Objective C for Windows project (https://github.com/Microsoft/WinObjC/) which uses Clang/C2 but are unlikely to invest in the technology otherwise.





