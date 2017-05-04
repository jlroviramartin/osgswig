%module(directors="1") OsgExtend;
#pragma SWIG nowarn=516,473

%include globals.i
%import OpenThreads/OpenThreads.i
%import osg/osg.i

%typemap(csimports) SWIGTYPE %{
// %typemap(csimports) SWIGTYPE
using osg;
%}

%{
#include <LODEx.h>
#include <MoveWithEyePointTransform.h>

#include <CastUtils.h>

using namespace osg;
%}

//#BEGIN MoveWithEyePointTransform
    %cs_RefUnref(osg::MoveWithEyePointTransform)
    %cs_RefUnref(osg::SkyDome)

    %ignore osg::DoNotIncludeInNearFarComputationCallback;
    %ignore osg::OverrideNearFarValuesCallback;
    %ignore osg::AddCallbackToDrawablesVisitor;    

    %include <MoveWithEyePointTransform.h>
//#END MoveWithEyePointTransform

//#BEGIN LODEx
    %cs_RefUnref(osg::LODEx)
    %cs_RefUnref(osg::LODEx::LODCallback)
    %cs_RefUnref(osg::LODEx::LODExCallback)

    %feature("director") osg::LODEx::LODCallback;

    %include LODEx.h
//#END LODEx

//#BEGIN CastUtils
    %include CastUtils.h
//#END CastUtils
