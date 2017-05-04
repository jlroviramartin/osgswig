#ifndef _OSGEARTH_DRIVERS_I_
#define _OSGEARTH_DRIVERS_I_

%module(directors="1") OsgEarthDriversModule;

%import OpenThreads/OpenThreads.i
%import osg/osg.i
%import osgEarth/osgEarth.i
%import osgEarthFeatures/osgEarthFeatures.i
%import osgEarthSymbology/osgEarthSymbology.i
%import OsgEarthUtil/OsgEarthUtil.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
using OpenThreads;
using osg;
using osgDB;
using osgEarth;
using osgEarthUtil;
using osgEarthFeatures;
using osgEarthSymbology;
%}

%pragma(csharp) moduleimports=%{
using OpenThreads;
using osg;
using osgDB;
using osgEarth;
using osgEarthUtil;
using osgEarthFeatures;
using osgEarthSymbology;
%}

%pragma(csharp) imclassimports=%{
using OpenThreads;
using osg;
using osgDB;
using osgEarth;
using osgEarthUtil;
using osgEarthFeatures;
using osgEarthSymbology;
%}

//#BEGIN #include

%{
#include <osg/LOD>

#include <osgEarthDrivers/tms/TMSOptions>
#include <osgEarthDrivers/gdal/GDALOptions>

#include <osgEarthDrivers/cache_filesystem/FileSystemCache>
//#include <osgEarthDrivers/cache_sqlite3/Sqlite3CacheOptions>

#include <osgEarthDrivers/engine_mp/MPTerrainEngineOptions>
#include <osgEarthDrivers/engine_quadtree/QuadTreeTerrainEngineOptions>
#include <osgEarthDrivers/engine_osgterrain/OSGTerrainOptions>
#include <osgEarthDrivers/engine_seamless/SeamlessOptions>
#include <osgEarthDrivers/colorramp/ColorRampOptions>

#include <osgEarthDrivers/bing/BingOptions>
#include <osgEarthDrivers/yahoo/YahooOptions>
#include <osgEarthDrivers/debug/DebugOptions>

#include <osgEarthDrivers/ocean_simple/SimpleOceanOptions>
#include <osgEarthDrivers/sky_gl/GLSkyOptions>
#include <osgEarthDrivers/sky_simple/SimpleSkyOptions>

#include <osgEarthDrivers/xyz/XYZOptions>

#include <osgEarthDrivers/feature_ogr/OGRFeatureOptions>
#include <osgEarthDrivers/model_simple/SimpleModelOptions>
#include <osgEarthDrivers/model_feature_stencil/FeatureStencilModelOptions>
#include <osgEarthDrivers/splat_mask/SplatMaskOptions>

#include <osgEarthDrivers/model_feature_geom/FeatureGeomModelOptions>
#include <osgEarthDrivers/mask_feature/FeatureMaskOptions>

#include <osgEarthDrivers/mbtiles/MBTilesOptions>

using namespace osgEarth::Drivers;
%}

//#END #include

//#BEGIN TMSOptions
    %include <osgEarthDrivers/tms/TMSOptions>
//#END TMSOptions

//#BEGIN GDALOptions
    %ignore osgEarth::Drivers::GDALOptions::ExternalDataset::ExternalDataset(GDALDataset* dataset, bool ownsDataset);

    %apply void *VOID_INT_PTR { GDALDataset * };

    %cs_RefUnref(osgEarth::Drivers::GDALOptions::ExternalDataset)
    %include <osgEarthDrivers/gdal/GDALOptions>
    %template(ExternalDatasetRef) osg::ref_ptr<osgEarth::Drivers::GDALOptions::ExternalDataset>;
    %template(ExternalDatasetObserver) osg::observer_ptr<osgEarth::Drivers::GDALOptions::ExternalDataset>;
//#END GDALOptions


//#BEGIN FileSystemCache
    %include <osgEarthDrivers/cache_filesystem/FileSystemCache>
//#END FileSystemCache


//#BEGIN Sqlite3CacheOptions
//    %include <osgEarthDrivers/cache_sqlite3/Sqlite3CacheOptions>
//#END Sqlite3CacheOptions


//#BEGIN BYOTerrainEngineOptions
//    %include <osgEarthDrivers/engine_byo/BYOTerrainEngineOptions>
//#END BYOTerrainEngineOptions


//#BEGIN MPTerrainEngineOptions
    %include <osgEarthDrivers/engine_mp/MPTerrainEngineOptions>
//#END MPTerrainEngineOptions

//#BEGIN MPTerrainEngineNode
//    %ignore osgEarth::Drivers::MPTerrainEngine::MPTerrainEngineNode::ElevationChangedCallback;
//    %cs_RefUnref(osgEarth::Drivers::MPTerrainEngineNode)
//    %include <osgEarthDrivers/engine_mp/MPTerrainEngineNode>
//#END MPTerrainEngineNode


//#BEGIN QuadTreeTerrainEngineOptions
    %include <osgEarthDrivers/engine_quadtree/QuadTreeTerrainEngineOptions>
//#END QuadTreeTerrainEngineOptions

//#BEGIN QuadTreeTerrainEngineNode
//    %cs_RefUnref(osgEarth::Drivers::QuadTreeTerrainEngineNode)
//    %include <osgEarthDrivers/engine_quadtree/QuadTreeTerrainEngineNode>
//#END QuadTreeTerrainEngineNode


//#BEGIN OSGTerrainOptions
    %include <osgEarthDrivers/engine_osgterrain/OSGTerrainOptions>
//#END OSGTerrainOptions

//#BEGIN OSGTerrainEngineNode
//    %cs_RefUnref(osgEarth::Drivers::OSGTerrainEngineNode)
//    %include <osgEarthDrivers/engine_osgterrain/OSGTerrainEngineNode>
//#END OSGTerrainEngineNode


//#BEGIN SeamlessOptions
    %include <osgEarthDrivers/engine_seamless/SeamlessOptions>
//#END SeamlessOptions

//#BEGIN SeamlessEngineNode
//    %cs_RefUnref(osgEarth::Drivers::SeamlessEngineNode)
//    %include <osgEarthDrivers/engine_seamless/SeamlessEngineNode>
//#END SeamlessEngineNode


//#BEGIN ColorRampOptions
    %include <osgEarthDrivers/colorramp/ColorRampOptions>
//#END ColorRampOptions


//#BEGIN SimpleOceanOptions
    %include <osgEarthDrivers/ocean_simple/SimpleOceanOptions>
//#END SimpleOceanOptions


//#BEGIN GLSkyOptions
    %include <osgEarthDrivers/sky_gl/GLSkyOptions>
//#END GLSkyOptions


//#BEGIN SimpleSkyOptions
    %include <osgEarthDrivers/sky_simple/SimpleSkyOptions>
//#END SimpleSkyOptions


//#BEGIN XYZOptions
    %include <osgEarthDrivers/xyz/XYZOptions>
//#END XYZOptions


//#BEGIN BingOptions
    %include <osgEarthDrivers/bing/BingOptions>
//#END BingOptions


//#BEGIN YahooOptions
    %include <osgEarthDrivers/yahoo/YahooOptions>
//#END YahooOptions


//#BEGIN DebugOptions
    %include <osgEarthDrivers/debug/DebugOptions>
//#END DebugOptions


//#BEGIN OGRFeatureOptions
    %include <osgEarthDrivers/feature_ogr/OGRFeatureOptions>
    %extend osgEarth::Drivers::OGRFeatureOptions {
    public:
        void setGeometry(Symbology::Geometry* pgeom) {
            (self)->geometry() = pgeom;
        }
    }
//#END OGRFeatureOptions

//#BEGIN FeatureGeomModelOptions
    %include <osgEarthDrivers/model_feature_geom/FeatureGeomModelOptions>
//#END FeatureGeomModelOptions


//#BEGIN SimpleModelOptions
    %include <osgEarthDrivers/model_simple/SimpleModelOptions>
//#END SimpleModelOptions

//#BEGIN FeatureStencilModelOptions
    %include <osgEarthDrivers/model_feature_stencil/FeatureStencilModelOptions>
//#END FeatureStencilModelOptions

//#BEGIN SplatMaskOptions
    %include <osgEarthDrivers/splat_mask/SplatMaskOptions>
//#END SplatMaskOptions

//#BEGIN FeatureMaskOptions
	%include <osgEarthDrivers/mask_feature/FeatureMaskOptions>
//#END FeatureMaskOptions


//#BEGIN MBTilesOptions
	%include <osgEarthDrivers/mbtiles/MBTilesOptions>
//#END MBTilesOptions


#endif
