%module(directors="1") OsgEarthDriversModule;

%include globals.i
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
#include <osgEarthDrivers/engine_rex/RexTerrainEngineOptions>

#include <osgEarthDrivers/colorramp/ColorRampOptions>
//#include <osgEarthDrivers/osg/ColorRampOptions>

#include <osgEarthDrivers/bing/BingOptions>
#include <osgEarthDrivers/yahoo/YahooOptions>
#include <osgEarthDrivers/debug/DebugOptions>

#include <osgEarthDrivers/ocean_simple/SimpleOceanOptions>
#include <osgEarthDrivers/sky_gl/GLSkyOptions>
#include <osgEarthDrivers/sky_simple/SimpleSkyOptions>

#include <osgEarthDrivers/xyz/XYZOptions>

#include <osgEarthDrivers/feature_ogr/OGRFeatureOptions>
#include <osgEarthDrivers/model_simple/SimpleModelOptions>
//#include <osgEarthDrivers/model_feature_stencil/FeatureStencilModelOptions>
#include <osgEarthDrivers/splat_mask/SplatMaskOptions>

#include <osgEarthDrivers/model_feature_geom/FeatureGeomModelOptions>
#include <osgEarthDrivers/mask_feature/FeatureMaskOptions>

#include <osgEarthDrivers/mbtiles/MBTilesOptions>

#include <osgEarthDrivers/arcgis/ArcGISOptions>
#include <osgEarthDrivers/kml/KMLOptions>
#include <osgEarthDrivers/feature_wfs/WFSFeatureOptions>
#include <osgEarthDrivers/feature_tfs/TFSFeatureOptions>

// Extensions
/*#include <osgEarthExtensions/terrainshader/TerrainShaderOptions>
#include <osgEarthExtensions/terrainshader/TerrainShaderExtension>

#include <osgEarthExtensions/noise/NoiseOptions>
#include <osgEarthExtensions/noise/NoiseExtension>
#include <osgEarthExtensions/noise/NoiseTerrainEffect>

#include <osgEarthExtensions/bumpmap/BumpMapOptions>
#include <osgEarthExtensions/bumpmap/BumpMapExtension>
#include <osgEarthExtensions/bumpmap/BumpMapTerrainEffect>

#include <osgEarthExtensions/billboard/BillboardOptions>
#include <osgEarthExtensions/billboard/BillboardExtension>*/

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


//#BEGIN MPTerrainEngineOptions
    %include <osgEarthDrivers/engine_mp/MPTerrainEngineOptions>
//#END MPTerrainEngineOptions

//#BEGIN RexTerrainEngineOptions
    %include <osgEarthDrivers/engine_rex/RexTerrainEngineOptions>
//#END RexTerrainEngineOptions


//#BEGIN ColorRampOptions
    %include <osgEarthDrivers/colorramp/ColorRampOptions>
    //%include <osgEarthDrivers/osg/ColorRampOptions>
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
//    %include <osgEarthDrivers/model_feature_stencil/FeatureStencilModelOptions>
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

//#BEGIN ArcGISOptions
    %include <osgEarthDrivers/arcgis/ArcGISOptions>
//#END ArcGISOptions

//#BEGIN KMLOptions
    %include <osgEarthDrivers/kml/KMLOptions>
//#END KMLOptions

//#BEGIN WFSFeatureOptions
    %include <osgEarthDrivers/feature_wfs/WFSFeatureOptions>
//#END WFSFeatureOptions

//#BEGIN TFSFeatureOptions
    %include <osgEarthDrivers/feature_tfs/TFSFeatureOptions>
//#END TFSFeatureOptions


// Extensions
/*
//#BEGIN TerrainShaderOptions
    %include <osgEarthExtensions/terrainshader/TerrainShaderOptions>
//#END TerrainShaderOptions

//#BEGIN TerrainShaderExtension
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgEarth::TerrainShader::TerrainShaderExtension;
    %cs_RefUnref(osgEarth::TerrainShader::TerrainShaderExtension)

    %include <osgEarthExtensions/terrainshader/TerrainShaderExtension>

    %extend osgEarth::TerrainShader::TerrainShaderExtension {
        ExtensionInterface<MapNode>* asExtensionInterface_MapNode() {
            return self;
        }
    }
//#END TerrainShaderExtension



//#BEGIN NoiseOptions
    %include <osgEarthExtensions/noise/NoiseOptions>
//#END NoiseOptions

//#BEGIN NoiseExtension
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgEarth::Noise::NoiseExtension;
    %cs_RefUnref(osgEarth::Noise::NoiseExtension)

    %include <osgEarthExtensions/noise/NoiseExtension>

    %extend osgEarth::Noise::NoiseExtension {
        ExtensionInterface<MapNode>* asExtensionInterface_MapNode() {
            return self;
        }
    }
//#END NoiseExtension

//#BEGIN NoiseTerrainEffect
    %cs_RefUnref(osgEarth::Noise::NoiseTerrainEffect)
    %include <osgEarthExtensions/noise/NoiseTerrainEffect>
//#END NoiseTerrainEffect



//#BEGIN BumpMapOptions
    %include <osgEarthExtensions/bumpmap/BumpMapOptions>
//#END BumpMapOptions

//#BEGIN BumpMapExtension
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgEarth::BumpMap::BumpMapExtension;
    %cs_RefUnref(osgEarth::BumpMap::BumpMapExtension)

    %include <osgEarthExtensions/bumpmap/BumpMapExtension>

    %extend osgEarth::BumpMap::BumpMapExtension {
        ExtensionInterface<MapNode>* asExtensionInterface_MapNode() {
            return self;
        }
    }
//#END BumpMapExtension

//#BEGIN BumpMapTerrainEffect
    %cs_RefUnref(osgEarth::BumpMap::BumpMapTerrainEffect)
    %include <osgEarthExtensions/bumpmap/BumpMapTerrainEffect>
//#END BumpMapTerrainEffect



//#BEGIN BillboardOptions
    %include <osgEarthExtensions/billboard/BillboardOptions>
//#END BillboardOptions

//#BEGIN BillboardExtension
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgEarth::Billboard::BillboardExtension;
    %cs_RefUnref(osgEarth::Billboard::BillboardExtension)

    %include <osgEarthExtensions/billboard/BillboardExtension>

    %extend osgEarth::Billboard::BillboardExtension {
        ExtensionInterface<MapNode>* asExtensionInterface_MapNode() {
            return self;
        }
    }
//#END BillboardExtension
*/
