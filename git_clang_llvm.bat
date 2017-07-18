
@echo off
mode con: cols=1024 lines=60
@set PROMPT=.:[$d]:.  
 
 
 REM custom log
 git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) %C(bold green)%ar%C(reset) %C(white)%s%C(reset) %C(dim white)%an%C(reset)%C(bold yellow)%d%C(reset)' --all"
 
 REM setting mergetool to kdiff3
 git config --global --add merge.tool kdiff3
 git config --global --add mergetool.kdiff3.path "C:/Program Files/KDiff3/kdiff3.exe"
 git config --global --add mergetool.kdiff3.trustExitCode false
 
 git config --global --add diff.guitool kdiff3
 git config --global --add difftool.kdiff3.path "C:/Program Files/KDiff3/kdiff3.exe"
 git config --global --add difftool.kdiff3.trustExitCode false

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"



call intro.bat
cls	
echo ____________________________________________________________________________________________
echo.
echo.   (\__/)			
echo.   (=o.O)			git remote add Clang and LLVM
echo.   C(")(")			
echo ____________________________________________________________________________________________
echo.
echo.
x:
	
	
 

rem git log > grep autors 
rem for ()
rem	git add %AUTHOR


echo.git remote add clang http://llvm.org/git/clang.git
git remote add clang http://llvm.org/git/clang.git
echo.
echo ____________________________________________________________________________________________
echo.
git remote --v
echo.
echo.
pause

git checkout upstream/N11_0_branch
echo git fetch --all
git rebase upstream/N11_0_branch

git checkout -b new_branch6
git rebase --continue
call intro.bat
cls	
echo ____________________________________________________________________________________________
echo.
echo.   (\__/)			
echo.   (=o.O)			git log
echo.   C(")(")			
echo.
echo ____________________________________________________________________________________________
echo.

color 9F
call git log -5
echo.
echo.
 pause
  cls
type h.md
cat h.md
 
color A1
pause
cls	
color 76
echo ____________________________________________________________________________________________
echo.
echo.   (\__/)			
echo.   (=o.O)			vanilla LLVM Clang fuzzing
echo.   C(")(")			
echo.
echo ____________________________________________________________________________________________
echo.
echo.

call ./h.bat
pause

cls	
color 13
echo ____________________________________________________________________________________________
echo.
echo.   (\__/)			
echo.   (=o.O)			Clang and LLVM
echo.   C(")(")			
echo.
echo ____________________________________________________________________________________________
echo.
echo.
echo.
echo. Simultaneously Building Clang and LLVM:
echo ____________________________________________________________________________________________
echo.
echo.  Once you have checked out Clang into the llvm source tree it will build along with the rest of llvm. To build all of LLVM and Clang together all at once simply run make from the root LLVM directory.

echo ____________________________________________________________________________________________
echo.

echo.
echo.
echo. Note: Observe that Clang is technically part of a separate Subversion repository. As mentioned above, the latest Clang sources are tied to the latest sources in the LLVM tree. You can update your toplevel LLVM project and all (possibly unrelated) projects inside it with make update. This will run svn update on all subdirectories related to subversion.

echo.
echo. Using Visual Studio
echo ____________________________________________________________________________________________
echo.
echo.
echo.
echo. The following details setting up for and building Clang on Windows using Visual Studio:.  Get the required tools:  Subversion. Source code control program. Get it from: http://subversion.apache.org/packages.html  CMake. This is used for generating Visual Studio solution and project files. Get it from: http://www.cmake.org/cmake/resources/software.html  Visual Studio 2013 or later.   Python. This is needed only if you will be running the tests (which is essential, if you will be developing for clang). Get it from: http://www.python.org/download/.  GnuWin32 tools These are also necessary for running the tests. (Note that the grep from MSYS or Cygwin doesn't work with the tests because of embedded double-quotes in the search strings. The GNU grep does work in this case.) Get them from http://getgnuwin32.sourceforge.net/.
echo.
echo.
pause
echo.
echo.
echo Check out LLVM:
echo ____________________________________________________________________________________________
echo.
echo.
svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
echo Check out Clang:
echo ____________________________________________________________________________________________
echo.
cd llvm\tools
svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
echo ____________________________________________________________________________________________
echo.
echo Note: Some Clang tests are sensitive to the line endings. Ensure that checking out the files does not convert LF line endings to CR+LF. If you use git-svn, make sure your core.autocrlf setting is false.  Run CMake to generate the Visual Studio solution and project files:
cd ..\.. (back to where you started)
mkdir build (for building without polluting the source dir)
cd build

echo ____________________________________________________________________________________________
echo.
echo.
echo. If you are using Visual Studio 2013: cmake -G "Visual Studio 12" ..\llvm
By default, the Visual Studio project files generated by CMake use the 32-bit toolset. If you are developing on a 64-bit version of Windows and want to use the 64-bit toolset, pass the ``-Thost=x64`` flag when generating the Visual Studio solution. This requires CMake 3.8.0 or later.  See the LLVM CMake guide for more information on other configuration options for CMake.  The above, if successful, will have created an LLVM.sln file in the build directory.

echo ____________________________________________________________________________________________
echo.
echo.
echo.Build Clang:  Open LLVM.sln in Visual Studio.  Build the "clang" project for just the compiler driver and front end, or the "ALL_BUILD" project to build everything, including tools.  Try it out (assuming you added llvm/debug/bin to your path). (See the running examples from above.)
  ee Hacking on clang - Testing using Visual Studio on Windows for information on running regression tests on Windows.  Note that once you have checked out both llvm and clang, to synchronize to the latest code base, use the svn update command in both the llvm and llvm\tools\clang directories, as they are separate repositories.
echo.
echo.Clang Compiler Driver (Drop-in Substitute for GCC)  The clang tool is the compiler driver and front-end, which is designed to be a drop-in replacement for the gcc command. Here are some examples of how to use the high-level driver:
echo.
echo.


pause
cls

echo.
echo ______________git clone  llvm + clang______________________________________________________________________________
echo.
echo.
git clone http://llvm.org/git/llvm.git
echo.
cd llvm/tools
git clone http://llvm.org/git/clang.git
echo.
echo.
echo. check out compiler-rt (required to build the sanitizers), run:

echo.
echo.
% cd llvm/projects
 git clone http://llvm.org/git/compiler-rt.git
echo. check out libomp (required for OpenMP support), run:

echo.
echo.
cd llvm/projects
git clone http://llvm.org/git/openmp.git
echo.
echo.  check out libcxx and libcxxabi (optional), run:

echo.
echo.
cd llvm/projects
git clone http://llvm.org/git/libcxx.git
echo.
echo.
git clone http://llvm.org/git/libcxxabi.git
echo.
echo.  check out the Test Suite Source Code (optional), run:

echo.
echo.
cd llvm/projects
git clone http://llvm.org/git/test-suite.git
echo.
echo. Since the upstream repository is in Subversion, you should use git pull --rebase instead of git pull to avoid generating a non-linear history in your clone. To configure git pull to pass --rebase by default on the master branch, run the following command:
echo.
echo.

git config branch.master.rebase true


echo.
echo ____________________________________________________________________________________________
echo.
echo.
echo.Check out LLVM:
echo ____________________________________________________________________________________________

echo.
echo.Change directory to where you want the llvm directory placed.
svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
echo Check out Clang:
echo ____________________________________________________________________________________________
cd llvm/tools
svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
cd ../..
echo.
echo. Check out extra Clang tools: (optional)
echo ____________________________________________________________________________________________
cd llvm/tools/clang/tools
echo.
svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra
cd ../../../..

echo.
echo.Check out Compiler-RT (optional):
echo ____________________________________________________________________________________________
cd llvm/projects
echo.
svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt
cd ../..

echo.
echo.Check out libcxx: (only required to build and run Compiler-RT tests on OS X, optional otherwise)
cd llvm/projects
echo ____________________________________________________________________________________________
echo.
svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx
cd ../..

echo.
echo.Build LLVM and Clang:
echo ____________________________________________________________________________________________
echo.
mkdir build (in-tree build is not supported)
cd build
cmake -G "Unix Makefiles" ../llvm
echo.
echo.
make

echo.
echo.
echo.This builds both LLVM and Clang for debug mode.  Note: For subsequent Clang development, you can just run make clang.  CMake allows you to generate project files for several IDEs: Xcode, Eclipse CDT4, CodeBlocks, Qt-Creator (use the CodeBlocks generator), KDevelop3. For more details see Building LLVM with CMake page.

echo ____________________________________________________________________________________________
echo If you intend to use Clang's C++ support, you may need to tell it how to find your C++ standard library headers. In general, Clang will detect the best version of libstdc++ headers available and use them - it will look both for system installations of libstdc++ as well as installations adjacent to Clang itself. If your configuration fits neither of these scenarios, you can use the -DGCC_INSTALL_PREFIX cmake option to tell Clang where the gcc containing the desired libstdc++ is installed.  Try it out (assuming you add llvm/build/bin to your path):


pause
cls
echo ____________________________________________________________________________________________
clang --help
echo.
clang file.c -fsyntax-only (check for correctness)
clang file.c -S -emit-llvm -o - (print out unoptimized llvm code)
clang file.c -S -emit-llvm -o - -O3
clang file.c -S -O3 -o - (output native machine code)

echo.
echo.Run the testsuite:
echo ____________________________________________________________________________________________
make check-clang

echo.
echo.
echo.
echo. The 'clang' driver is designed to work as closely to GCC as possible to maximize portability. The only major difference between the two is that Clang defaults to gnu99 mode while GCC defaults to gnu89 mode. If you see weird link-time errors relating to inline functions, try passing -std=gnu89 to clang.  Examples of using Clang


pause


cat ~/t.c
typedef float V __attribute__((vector_size(16)));
V foo(V a, V b) { return a+b*a; }

echo.Preprocessing:
 clang ~/t.c -E 
 # 1 "/Users/sabre/t.c" 1

typedef float V __attribute__((vector_size(16)));

V foo(V a, V b) { return a+b*a; }

echo.Type checking:
clang -fsyntax-only ~/t.c
echo GCC options:
 clang -fsyntax-only ~/t.c -pedantic
/Users/sabre/t.c:2:17: warning: extension used
typedef float V __attribute__((vector_size(16)));
                ^

echo.
echo.1 diagnostic generated.  Pretty printing from the AST:  Note, the -cc1 argument indicates the compiler front-end, and not the driver, should be run. The compiler front-end has several additional Clang specific features which are not exposed through the GCC compatible driver interface.

clang -cc1 ~/t.c -ast-print
typedef float V __attribute__(( vector_size(16) ));
V foo(V a, V b) {
   return a + b * a;
}

echo.Code generation with LLVM:
clang ~/t.c -S -emit-llvm -o -
define <4 x float> @foo(<4 x float> %a, <4 x float> %b) {

echo. entry:
         %mul = mul <4 x float> %b, %a
         %add = add <4 x float> %mul, %a
         ret <4 x float> %add
}
clang -fomit-frame-pointer -O3 -S -o - t.c # On x86_64

_foo:
Leh_func_begin1:
	mulps	%xmm0, %xmm1
	addps	%xmm1, %xmm0
	ret
Leh_func_end1:



