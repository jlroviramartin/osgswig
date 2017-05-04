#ifndef _OSGUTIL_I_
#define _OSGUTIL_I_

%module(directors="1") OsgUtilModule;

%import osg/osg.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
using osg;
%}

%define OSGUTIL_EXPORT
%enddef

//#BEGIN #include

%{
#include <osgUtil/UpdateVisitor>
#include <osgUtil/PrintVisitor>
#include <osgUtil/IntersectionVisitor>
#include <osgUtil/IntersectVisitor>
#include <osgUtil/CullVisitor>

#include <osgUtil/Tessellator>
#include <osgUtil/DelaunayTriangulator>

using namespace osgUtil;
%}

//#END #include

//#BEGIN UpdateVisitor
    %cs_RefUnref(osgUtil::UpdateVisitor)

    %include <osgUtil/UpdateVisitor>

    %extend osgUtil::UpdateVisitor {
        static osgUtil::UpdateVisitor* fromNodeVisitor(osg::NodeVisitor* nv) {
            return dynamic_cast<osgUtil::UpdateVisitor*>(nv);
        }
    }
//#END UpdateVisitor

//#BEGIN PrintVisitor
    %cs_RefUnref(osgUtil::PrintVisitor)

    %include <osgUtil/PrintVisitor>
//#END PrintVisitor

//#BEGIN IntersectionVisitor
    %cs_RefUnref(osgUtil::Intersector)
    %cs_RefUnref(osgUtil::IntersectorGroup)
    %cs_RefUnref(osgUtil::IntersectionVisitor)

    %include <osgUtil/IntersectionVisitor>

    %extend osgUtil::IntersectionVisitor {
        static osgUtil::IntersectionVisitor* fromNodeVisitor(osg::NodeVisitor* nv) {
            return dynamic_cast<osgUtil::IntersectionVisitor*>(nv);
        }
    }
//#END IntersectionVisitor

//#BEGIN IntersectVisitor
    %cs_RefUnref(osgUtil::IntersectVisitor)
    %cs_RefUnref(osgUtil::PickVisitor)

    %ignore osgUtil::Hit::operator <;

    %include <osgUtil/IntersectVisitor>

    %extend osgUtil::IntersectVisitor {
        static osgUtil::IntersectVisitor* fromNodeVisitor(osg::NodeVisitor* nv) {
            return dynamic_cast<osgUtil::IntersectVisitor*>(nv);
        }
    }
//#END IntersectVisitor

//#BEGIN CullVisitor
    %cs_RefUnref(osgUtil::CullVisitor)
    %cs_RefUnref(osgUtil::Identifier)

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgUtil::CullVisitor;

    %include <osgUtil/CullVisitor>

    %extend osgUtil::CullVisitor {
        osg::CullStack* asCullStack() {
            return self;
        }
        static osgUtil::CullVisitor* fromNodeVisitor(osg::NodeVisitor* nv) {
            return dynamic_cast<osgUtil::CullVisitor*>(nv);
        }
        static osg::CullStack* fromCullStack(osg::CullStack* cs) {
            return dynamic_cast<osg::CullStack*>(cs);
        }
    }
//#END CullVisitor

//#BEGIN Tessellator
    %cs_RefUnref(osgUtil::Tessellator)
    %cs_RefUnref(osgUtil::Tessellator::Prim)

    %include <osgUtil/Tessellator>

    %template(Tessellator_PrimRef)      osg::ref_ptr< osgUtil::Tessellator::Prim >;
    %template(Tessellator_PrimObserver) osg::observer_ptr< osgUtil::Tessellator::Prim >;
    %template(Tessellator_PrimVector)   std::vector< osg::ref_ptr< osgUtil::Tessellator::Prim > >;
//#END Tessellator

//#BEGIN DelaunayTriangulator
    %cs_RefUnref(osgUtil::DelaunayConstraint)
    %cs_RefUnref(osgUtil::DelaunayTriangulator)

    %include <osgUtil/DelaunayTriangulator>
//#END DelaunayTriangulator

#endif
