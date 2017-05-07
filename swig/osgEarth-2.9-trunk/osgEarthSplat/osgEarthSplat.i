%module(directors="1") osgEarthSplat;

%include globals.i
%import osg/osg.i
%import osgDB/osgDB.i
%import osgEarth/osgEarth.i
%import osgEarthUtil/osgEarthUtil.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
using osg;
using osgDB;
using osgEarth;
using osgEarthUtil;
using osgEarthSymbology;
%}

%pragma(csharp) moduleimports=%{
using osg;
using osgDB;
using osgEarth;
using osgEarthUtil;
using osgEarthSymbology;
%}

%pragma(csharp) imclassimports=%{
using osg;
using osgDB;
using osgEarth;
using osgEarthUtil;
using osgEarthSymbology;
%}

%define OSGEARTHSPLAT_EXPORT
%enddef

//#BEGIN #include

%{
#include <osgEarthSplat/Export>
#include <osgEarthSplat/Coverage>
#include <osgEarthSplat/Surface>
#include <osgEarthSplat/LandCover>
#include <osgEarthSplat/SplatOptions>

#include <osgEarthSplat/SplatExtension>

#include <osgEarthSplat/Zone>
#include <osgEarthSplat/SplatLayerFactory>

using namespace osgEarth::Splat;
%}

//#END #include

//#BEGIN Coverage
    %cs_RefUnref(osgEarth::Splat::Coverage)
    %include <osgEarthSplat/Coverage>
//#END Coverage

//#BEGIN Surface
    %cs_RefUnref(osgEarth::Splat::Surface)
    %include <osgEarthSplat/Surface>
//#END Surface

//#BEGIN LandCover
    %cs_RefUnref(osgEarth::Splat::LandCoverBiome)
    %cs_RefUnref(osgEarth::Splat::LandCoverLayer)
    %cs_RefUnref(osgEarth::Splat::LandCover)
    %include <osgEarthSplat/LandCover>
//#END LandCover

//#BEGIN SplatOptions
    %include <osgEarthSplat/SplatOptions>
//#END SplatOptions

//#BEGIN SplatExtension
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgEarth::Splat::SplatExtension;
    %cs_RefUnref(osgEarth::Splat::SplatExtension)
    %ignore osgEarth::Splat::SplatExtension::connect;
    %ignore osgEarth::Splat::SplatExtension::disconnect;
    %include <osgEarthSplat/SplatExtension>

    %extend osgEarth::Splat::SplatExtension {
        ExtensionInterface<MapNode>* asExtensionInterface_MapNode() {
            return self;
        }
        ExtensionInterface<Control>* asExtensionInterface_Control() {
            return self;
        }
        bool connect_MapNode(MapNode* mapNode) {
            return self->connect(mapNode);
        }
        bool disconnect_MapNode(MapNode* mapNode) {
            return self->disconnect(mapNode);
        }
        bool connect_Control(Control* control) {
            return self->connect(control);
        }
        bool disconnect_Control(Control* control) {
            return self->disconnect(control);
        }
    }
//#END SplatExtension

//#BEGIN LandCoverTerrainEffect
//    %cs_RefUnref(osgEarth::Splat::LandCoverTerrainEffect)
//    %include <osgEarthSplat/LandCoverTerrainEffect>
//#END LandCoverTerrainEffect

//#BEGIN SplatTerrainEffect
//    %cs_RefUnref(osgEarth::Splat::SplatTerrainEffect)
//    %include <osgEarthSplat/SplatTerrainEffect>
//#END SplatTerrainEffect

//#BEGIN Zone
    %cs_RefUnref(osgEarth::Splat::Zone)
    %cs_RefUnref(osgEarth::Splat::ZoneSwitcher)
    %include <osgEarthSplat/Zone>
//#END Zone

//#BEGIN Surface
    %cs_RefUnref(osgEarth::Splat::Surface)
    %include <osgEarthSplat/Surface>
//#END Surface

//#BEGIN SplatLayerFactory
    %cs_RefUnref(osgEarth::Splat::SplatLayerFactory)
    %ignore osgEarth::Splat::SplatLayerFactory::onInstall/*(class osgEarth::TerrainEngineNode *)*/; // No compila.
    %ignore osgEarth::Splat::SplatLayerFactory::onUninstall/*(class osgEarth::TerrainEngineNode *)*/; // No compila.
    %include <osgEarthSplat/SplatLayerFactory>
//#END SplatLayerFactory
