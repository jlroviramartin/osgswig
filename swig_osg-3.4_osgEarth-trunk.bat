@setlocal

@call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86

@set PROJECT=swig_osg-3.4_osgEarth-trunk.proj

@msbuild /t:Test                                         %PROJECT%

@rem msbuild /t:Clean                                        %PROJECT%
@rem msbuild /t:swig                                         %PROJECT%
@rem msbuild /t:BuildVcxproj;CppCompile /p:Platform=x64      %PROJECT%
@rem msbuild /t:BuildVcxproj;CppCompile /p:Platform=Win32    %PROJECT%
@msbuild /t:BuildCsproj;CSharpCompile /p:Platform=anycpu %PROJECT%

@rem msbuild /t:NuGetDependencies;NuGet          %PROJECT%

:exit
