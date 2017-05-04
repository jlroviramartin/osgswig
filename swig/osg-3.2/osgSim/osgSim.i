#ifndef _OSGSIM_I_
#define _OSGSIM_I_

%module(directors="1") OsgSimModule;

%import osg/osg.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
using osg;
%}

%define OSGSIM_EXPORT
%enddef

//#BEGIN #include

%{
#include <osgSim/OverlayNode>

using namespace osgSim;
%}

//#END #include

//#BEGIN OverlayNode
    %cs_RefUnref(osgSim::OverlayNode)
    %include osgSim/OverlayNode
//#END OverlayNode

#endif
