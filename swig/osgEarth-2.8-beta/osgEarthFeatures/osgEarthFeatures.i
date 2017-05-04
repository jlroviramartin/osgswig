%module(directors="1") OsgEarthFeaturesModule;

%include globals.i
%import OpenThreads/OpenThreads.i
%import osg/osg.i
%import osgEarth/osgEarth.i
%import osgEarthSymbology/osgEarthSymbology.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
using OpenThreads;
using osg;
using osgDB;
using osgEarth;
using osgEarthSymbology;
%}

%pragma(csharp) moduleimports=%{
using OpenThreads;
using osg;
using osgDB;
using osgEarth;
using osgEarthSymbology;
%}

%pragma(csharp) imclassimports=%{
using OpenThreads;
using osg;
using osgDB;
using osgEarth;
using osgEarthSymbology;
%}

%define OSGEARTHFEATURES_EXPORT
%enddef

//#BEGIN #include

%{
#include <osgEarthFeatures/GeometryUtils>
#include <osgEarthFeatures/Feature>
#include <osgEarthFeatures/FeatureCursor>
#include <osgEarthFeatures/FeatureSource>
#include <osgEarthFeatures/FeatureDisplayLayout>
#include <osgEarthFeatures/FeatureModelSource>

#include <osgEarthFeatures/FeatureListSource>

using namespace osgEarth::Features;
%}

//#END #include

//#BEGIN GeometryUtils
    %include <osgEarthFeatures/GeometryUtils>
//#END GeometryUtils

//#BEGIN Feature
    %cs_RefUnref(osgEarth::Features::FeatureProfile)
    %cs_RefUnref(osgEarth::Features::RefFeatureID)
    %cs_RefUnref(osgEarth::Features::Feature)

    namespace osgEarth { namespace Features {
        enum AttributeType;
        struct AttributeValueUnion;
    } }
    %template(Pair_AttributeType_AttributeValueUnion) std::pair<osgEarth::Features::AttributeType, osgEarth::Features::AttributeValueUnion>;

    %include <osgEarthFeatures/Feature>

    %template(AttributeTable) std::map< std::string, osgEarth::Features::AttributeValue >;
    %template(FeatureSchema) std::map< std::string, osgEarth::Features::AttributeType >;
    %template(FeatureRef) osg::ref_ptr<osgEarth::Features::Feature>;
    %template(FeatureObserver) osg::observer_ptr<osgEarth::Features::Feature>;
    //%template(FeatureList) std::list< osg::ref_ptr< osgEarth::Features::Feature > >;
//#END Feature


//#BEGIN FeatureCursor
    %cs_RefUnref(osgEarth::Features::FeatureCursor)
    %cs_RefUnref(osgEarth::Features::FeatureListCursor)
    %cs_RefUnref(osgEarth::Features::GeometryFeatureCursor)

    %include <osgEarthFeatures/FeatureCursor>
//#END FeatureCursor


//#BEGIN FeatureSource
    %cs_RefUnref(osgEarth::Features::FeatureSource)
    %cs_RefUnref(osgEarth::Features::FeatureSourceDriver)

    %include <osgEarthFeatures/FeatureSource>

    %template(OptionalFeatureSourceOptions) osgEarth::optional<osgEarth::Features::FeatureSourceOptions>;
    %template(FeatureSourceRef) osg::ref_ptr<osgEarth::Features::FeatureSource>;
    %template(FeatureSourceObserver) osg::observer_ptr<osgEarth::Features::FeatureSource>;
//#END FeatureSource

//#BEGIN FeatureDisplayLayout
    %cs_RefUnref(osgEarth::Features::FeatureDisplayLayout)

    %include <osgEarthFeatures/FeatureDisplayLayout>
//#END FeatureDisplayLayout

//#BEGIN FeatureDisplayLayout
    %cs_RefUnref(osgEarth::Features::FeatureNodeFactory)
    %cs_RefUnref(osgEarth::Features::GeomFeatureNodeFactory)
    %cs_RefUnref(osgEarth::Features::FeatureModelSource)

    %include <osgEarthFeatures/FeatureModelSource>

    %template(OptionalFeatureDisplayLayout) osgEarth::optional<osgEarth::Features::FeatureDisplayLayout>;
//#END FeatureDisplayLayout


//#BEGIN FeatureListSource
    %cs_RefUnref(osgEarth::Features::FeatureListSource)

    %include <osgEarthFeatures/FeatureListSource>
//#END FeatureListSource
