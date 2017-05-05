@setlocal

@call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86

@set PROJECT=swig_osg-3.4_osgEarth-trunk.proj

@msbuild /t:Test                                         %PROJECT%

@msbuild /t:Clean                                        %PROJECT%
@msbuild /t:swig                                         %PROJECT%
@msbuild /t:BuildVcxproj;CppCompile /p:Platform=x64      %PROJECT%
@msbuild /t:BuildVcxproj;CppCompile /p:Platform=Win32    %PROJECT%
@msbuild /t:BuildCsproj;CSharpCompile /p:Platform=anycpu %PROJECT%

@msbuild /t:NuGet          %PROJECT%

:exit
