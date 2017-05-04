%module(directors="1") OsgTerrainModule;
#pragma SWIG nowarn=516,473

%include globals.i
%import osg/osg.i
%import osgDB/osgDB.i
%import osgGA/osgGA.i
%import osgUtil/osgUtil.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
// %typemap(csimports) SWIGTYPE
using osg;
using osgDB;
using osgGA;
using osgUtil;
%}

%define OSGTERRAIN_EXPORT
%enddef

//#BEGIN #include

%{
#include <osgTerrain/TerrainTechnique>
#include <osgTerrain/ValidDataOperator>
#include <osgTerrain/Layer>
#include <osgTerrain/Locator>
#include <osgTerrain/GeometryTechnique>
#include <osgTerrain/TerrainTile>
#include <osgTerrain/Terrain>

using namespace osgTerrain;
%}

//#END #include

//#BEGIN TerrainTechnique
    %cs_RefUnref(osgTerrain::TerrainTechnique)
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgTerrain::TerrainTechnique;

    %include osgTerrain/TerrainTechnique

    %extend osgTerrain::TerrainTechnique {
        public:
        osg::Observer* asObserver() {
            return self;
        }
    }
//#END TerrainTechnique

//#BEGIN ValidDataOperator
    %cs_RefUnref(osgTerrain::ValidDataOperator)
    %cs_RefUnref(osgTerrain::ValidRange)
    %cs_RefUnref(osgTerrain::NoDataValue)

    %rename(Execute) osgTerrain::ValidDataOperator::operator ();

    %include osgTerrain/ValidDataOperator
//#END ValidDataOperator

//#BEGIN Layer

    namespace osgTerrain {
        class Locator;
    }

    %cs_RefUnref(osgTerrain::Layer)
    %cs_RefUnref(osgTerrain::ImageLayer)
    %cs_RefUnref(osgTerrain::ContourLayer)
    %cs_RefUnref(osgTerrain::HeightFieldLayer)
    %cs_RefUnref(osgTerrain::ProxyLayer)
    %cs_RefUnref(osgTerrain::CompositeLayer)
    %cs_RefUnref(osgTerrain::SwitchLayer)

    %include osgTerrain/Layer
//#END Layer

//#BEGIN Locator
    %cs_RefUnref(osgTerrain::Locator)
    %include osgTerrain/Locator
//#END Locator

//#BEGIN GeometryTechnique
    %cs_RefUnref(osgTerrain::GeometryTechnique)
    %include osgTerrain/GeometryTechnique
//#END GeometryTechnique

//#BEGIN TerrainTile
    %cs_RefUnref(osgTerrain::TerrainTile)
    %cs_RefUnref(osgTerrain::TerrainTile::TileLoadedCallback)
    %cs_RefUnref(osgTerrain::WhiteListTileLoadedCallback)
    %feature("director") osgTerrain::TerrainTile::TileLoadedCallback;

    %rename(Lt) osgTerrain::TileID::operator <;
    %rename(Eq) osgTerrain::TileID::operator ==;
    %rename(NotEq)  osgTerrain::TileID::operator !=;

    %include osgTerrain/TerrainTile

    %template(TerrainTile_TileLoadedCallbackRef)      osg::ref_ptr<osgTerrain::TerrainTile::TileLoadedCallback>;
    %template(TerrainTile_TileLoadedCallbackObserver) osg::observer_ptr<osgTerrain::TerrainTile::TileLoadedCallback>;
//#END TerrainTile

//#BEGIN Terrain
    %cs_RefUnref(osgTerrain::Terrain)
    %include osgTerrain/Terrain
//#END Terrain
