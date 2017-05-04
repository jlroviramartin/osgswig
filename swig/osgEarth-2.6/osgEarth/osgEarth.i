#ifndef _OSGEARTH_I_
#define _OSGEARTH_I_

%module(directors="1") OsgEarthModule;

%import swig/swig.i
%import OpenThreads/OpenThreads.i
%import osg/osg.i
%import osgDB/osgDB.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
using OpenThreads;
using osg;
using osgDB;
%}

%pragma(csharp) moduleimports=%{
using OpenThreads;
using osg;
using osgDB;
%}

%pragma(csharp) imclassimports=%{
using OpenThreads;
using osg;
using osgDB;
%}

%define OSGEARTH_EXPORT
%enddef

//#BEGIN #include

%{
#include <osg/StateAttribute>
#include <osg/LOD>

#include <osgEarth/Common>
#include <osgEarth/optional>
#include <osgEarth/URI>
#include <osgEarth/Bounds>
#include <osgEarth/Config>
#include <osgEarth/DateTime>
#include <osgEarth/Units>
#include <osgEarth/GeoCommon>
#include <osgEarth/Containers>
#include <osgEarth/ShaderUtils>

#include <osgEarth/TerrainOptions>
#include <osgEarth/TileSource>
#include <osgEarth/GeoData>
#include <osgEarth/Layer>
#include <osgEarth/Terrain>
#include <osgEarth/TerrainLayer>
#include <osgEarth/ImageLayer>
#include <osgEarth/ElevationLayer>
#include <osgEarth/MaskLayer>
#include <osgEarth/MaskNode>
#include <osgEarth/MaskSource>
#include <osgEarth/ModelLayer>
#include <osgEarth/ModelSource>
#include <osgEarth/Cache>
#include <osgEarth/TileKey>
#include <osgEarth/Profile>
#include <osgEarth/TerrainEffect>
#include <osgEarth/TerrainEngineNode>
#include <osgEarth/MapFrame>
#include <osgEarth/Map>
#include <osgEarth/MapOptions>
#include <osgEarth/MapNode>
#include <osgEarth/MapInfo>
#include <osgEarth/MapNodeOptions>
#include <osgEarth/Viewpoint>
#include <osgEarth/NodeUtils>

#include <osgEarth/GeoTransform>

#include <osgEarth/VirtualProgram>
#include <osgEarth/ShaderGenerator>

#include <osgEarth/Capabilities>
#include <osgEarth/Registry>

using namespace osgEarth;
using namespace osg;
%}

//#END #include

%rename(osgEarth_Layer) osgEarth::Layer;
%rename(osgEarth_ImageLayer) osgEarth::ImageLayer;
%rename(osgEarth_Terrain) osgEarth::Terrain;

%include <osgEarth/Common>

//#BEGIN optional
    %ignore osgEarth::optional::isSetTo;
    %ignore osgEarth::optional::operator=;
    %ignore osgEarth::optional::optional(const optional<T>&);
    %ignore osgEarth::optional::operator==;
    %ignore osgEarth::optional::operator!=;
    %ignore osgEarth::optional::operator>;
    %ignore osgEarth::optional::operator>=;
    %ignore osgEarth::optional::operator<;
    %ignore osgEarth::optional::operator<=;
    %ignore osgEarth::optional::operator->;
    %ignore osgEarth::optional::operator unspecified_bool_type;
    %ignore osgEarth::optional::operator const T*;
    %ignore osgEarth::optional::mutable_value;
    %ignore osgEarth::optional::temp_copy;
    %include <osgEarth/optional>
    %extend osgEarth::optional {
    public:
        void set(const T& value) {
            (*self) = value;
        }
    }
//#BEGIN optional

%template(OptionalString) osgEarth::optional<std::string>;
%template(OptionalUInt) osgEarth::optional<unsigned int>;
%template(OptionalInt) osgEarth::optional<int>;
%template(OptionalBool) osgEarth::optional<bool>;
%template(OptionalFloat) osgEarth::optional<float>;
%template(OptionalDouble) osgEarth::optional<double>;
%template(OptionalFilterMode) osgEarth::optional<osg::Texture::FilterMode>;
%template(OptionalRangeMode) osgEarth::optional<osg::LOD::RangeMode>;
%template(OptionalInternalFormatMode) osgEarth::optional<osg::Texture::InternalFormatMode>;
%template(OptionalVec4ub) osgEarth::optional<osg::Vec4ub>;
%template(OptionalVec3f) osgEarth::optional<osg::Vec3f>;
%template(OptionalTexEnvMode) osgEarth::optional<osg::TexEnv::Mode>;

//#BEGIN URI
    %ignore osgEarth::URI::readConfig;
    %ignore osgEarth::URI::operator <;
    %ignore osgEarth::URI::operator ();
    %include <osgEarth/URI>
    %template(OptionalURI) osgEarth::optional<URI>;
//#END URI


//#BEGIN HTTPClient
    %include <osgEarth/HTTPClient>
    %template(OptionalProxySettings) osgEarth::optional<osgEarth::ProxySettings>;
//#END HTTPClient


//#BEGIN Bounds
    %include <osgEarth/Bounds>
    %template(OptionalBounds) osgEarth::optional<osgEarth::Bounds>;
//#END Bounds

//#BEGIN Config
    %include <osgEarth/Config>
    %template(OptionalConfig) osgEarth::optional<osgEarth::Config>;
//#END Config


//#BEGIN Units
    %include <osgEarth/DateTime>
//#END Units

//#BEGIN Units
    %include <osgEarth/Units>
//#END Units


//#BEGIN GeoCommon
    %include <osgEarth/GeoCommon>
    %template(OptionalElevationInterpolation) osgEarth::optional<osgEarth::ElevationInterpolation>;
    %template(OptionalElevationNoDataPolicy) osgEarth::optional<osgEarth::ElevationNoDataPolicy>;
    %template(OptionalGeoInterpolation) osgEarth::optional<osgEarth::GeoInterpolation>;
//#END GeoCommon


//#BEGIN Containers
    %ignore osgEarth::MixinVector::operator=;
    %ignore osgEarth::MixinVector::get_allocator() const;
    %ignore osgEarth::MixinVector::begin() const;
    %ignore osgEarth::MixinVector::end() const;
    %ignore osgEarth::MixinVector::rbegin() const;
    %ignore osgEarth::MixinVector::rend() const;
    %ignore osgEarth::MixinVector::begin();
    %ignore osgEarth::MixinVector::end();
    %ignore osgEarth::MixinVector::rbegin();
    %ignore osgEarth::MixinVector::rend();
    %ignore osgEarth::MixinVector::erase;
    %ignore osgEarth::MixinVector::insert;

    %include <osgEarth/Containers>

    %extend osgEarth::MixinVector<osg::Vec3d,osg::Referenced> {
        public:
        void erase(size_type where) { self->erase( self->begin() + where ); }
        void erase(size_type first, size_type last) { self->erase( self->begin() + first, self->begin() + last ); }
        void insert(size_type where, const osg::Vec3d& value) { self->insert( self->begin() + where, value ); }
        void insert(size_type where, size_type count, const osg::Vec3d& value) { self->insert( self->begin() + where, count, value ); }
    }

    %cs_RefUnref( (osgEarth::MixinVector<osg::Vec3d,osg::Referenced>) )

    %template(MixinVector_Vec3d_Referenced) osgEarth::MixinVector<osg::Vec3d,osg::Referenced>;
//#END Containers


//#BEGIN ShaderUtils
    %ignore osgEarth::osg_LightSourceParameters::glslDefinition;
    %ignore osgEarth::osg_LightSourceParameters::applyState;
    %ignore osgEarth::osg_LightSourceParameters::setUniformsFromOsgLight;
    %ignore osgEarth::osg_LightSourceParameters::osg_LightSourceParameters;
    %ignore osgEarth::osg_LightProducts::glslDefinition;
    %ignore osgEarth::osg_LightProducts::osg_LightProducts;

    %cs_RefUnref(osgEarth::UpdateLightingUniformsHelper)
    %cs_RefUnref(osgEarth::RangeUniformCullCallback)
    %include <osgEarth/ShaderUtils>
    %template(OptionalShaderPolicy) osgEarth::optional<osgEarth::ShaderPolicy>;
//#END ShaderUtils


//#BEGIN TerrainOptions
    %include <osgEarth/TerrainOptions>
//#END TerrainOptions


//#BEGIN TileSource
    %ignore osgEarth::TileSource::operator ==;
    %ignore osgEarth::TileSource::operator !=;
    %ignore osgEarth::TileSource::operator ();
    %cs_RefUnref(osgEarth::TileSource)
    %include <osgEarth/TileSource>
    %template(OptionalTileSourceOptions) osgEarth::optional<osgEarth::TileSourceOptions>;
//#END TileSource


//#BEGIN SpatialReference
    %ignore osgEarth::SpatialReference::operator <;
    %cs_RefUnref(osgEarth::SpatialReference)
    %include <osgEarth/SpatialReference>
//#END SpatialReference

//#BEGIN Config
    %ignore osgEarth::GeoExtent::transform( const SpatialReference* to_srs, GeoExtent& output ) const;
    %ignore osgEarth::GeoPoint::operator ==;
    %ignore osgEarth::GeoPoint::operator !=;
    %ignore osgEarth::GeoCircle::operator ==;
    %ignore osgEarth::GeoCircle::operator !=;
    %ignore osgEarth::GeoExtent::operator ==;
    %ignore osgEarth::GeoExtent::operator !=;
    %ignore osgEarth::GeoExtent::operator ==;
    %ignore osgEarth::GeoExtent::operator !=;
    %ignore osgEarth::GeoHeightField::SortByResolutionFunctor;
    %include <osgEarth/GeoData>
//#END Config


//#BEGIN TileKey
    %typemap(cstype) unsigned int& "out uint";
    %typemap(csin)   unsigned int& "out $csinput";
    %typemap(imtype) unsigned int& "out uint";
    %typemap(cstype) const unsigned int& "uint";
    %typemap(csin)   const unsigned int& "$csinput";
    %typemap(imtype) const unsigned int&  "uint";

    %include <osgEarth/TileKey>

    %typemap(cstype) unsigned int&;
    %typemap(csin)   unsigned int&;
    %typemap(imtype) unsigned int&;
    %typemap(cstype) const unsigned int&;
    %typemap(csin)   const unsigned int&;
    %typemap(imtype) const unsigned int&;
//#END TileKey


//#BEGIN Layer
    %cs_RefUnref(osgEarth::Layer)
    %include <osgEarth/Layer>
//#END Layer

//#BEGIN Terrain
    %ignore osgEarth::Terrain::fireTilesRemoved;
    %ignore osgEarth::Terrain::notifyTilesRemoved;
    %ignore osgEarth::Terrain::getHeight;

    %cs_RefUnref(osgEarth::Terrain)
    %cs_RefUnref(osgEarth::TerrainCallback)
    %cs_RefUnref(osgEarth::TerrainCallbackAdapter)
    %feature("director") osgEarth::TerrainCallback;
    %feature("director") osgEarth::TerrainCallbackAdapter;
    %include <osgEarth/Terrain>
    //%extend osgEarth::Terrain {
    //public:
    //    osgEarth::TerrainResolver* asTerrainResolver() { return dynamic_cast<osgEarth::TerrainResolver*>(self); }
    //}
//#END Terrain

//#BEGIN TerrainLayer
    %ignore osgEarth::TerrainLayerOptions::name();

    %cs_RefUnref(osgEarth::TerrainLayer)
    %include <osgEarth/TerrainLayer>
    %extend osgEarth::TerrainLayerOptions {
        void setName(const std::string& name) {
            (self)->name() = name;
        }
    }
//#END TerrainLayer

//#BEGIN ImageLayer
    %ignore osgEarth::ImageLayerTileProcessor::ImageLayerTileProcessor( const ImageLayerOptions& options = ImageLayerOptions() );
    %ignore osgEarth::ImageLayerTileProcessor::init( const ImageLayerOptions& options, const osgDB::Options* dbOptions, bool layerInTargetProfile );
    %ignore osgEarth::ImageLayerTileProcessor::process( osg::ref_ptr<osg::Image>& image ) const;
    %cs_RefUnref(osgEarth::ImageLayer)

    %include <osgEarth/ImageLayer>

    %template(OptionalImageLayerOptions) osgEarth::optional<osgEarth::ImageLayerOptions>;
    %template(ImageLayerRef) osg::ref_ptr<osgEarth::ImageLayer>;
    %template(ImageLayerObserver) osg::observer_ptr<osgEarth::ImageLayer>;
    %template(ImageLayerVector) std::vector< osg::ref_ptr<osgEarth::ImageLayer> >;
//#END ImageLayer

//#BEGIN ElevationLayer
    %cs_RefUnref(osgEarth::ElevationLayer)

    %include <osgEarth/ElevationLayer>

    %template(OptionalElevationLayerOptions) osgEarth::optional<osgEarth::ElevationLayerOptions>;
    %template(ElevationLayerRef) osg::ref_ptr<osgEarth::ElevationLayer>;
    %template(ElevationLayerObserver) osg::observer_ptr<osgEarth::ElevationLayer>;
    %template(XElevationLayerVector) std::vector< osg::ref_ptr<osgEarth::ElevationLayer> >;
    %template(MixinVector_ElevationLayer) osg::MixinVector< osg::ref_ptr< osgEarth::ElevationLayer > >;
//#END ElevationLayer

//#BEGIN MaskSource
    %cs_RefUnref(osgEarth::MaskSource)
    %include <osgEarth/MaskSource>
    %template(OptionalMaskSourceOptions) osgEarth::optional<osgEarth::MaskSourceOptions>;
//#END MaskSource

//#BEGIN MaskNode
    %cs_RefUnref(osgEarth::MaskNode)
    %include <osgEarth/MaskNode>
//#END MaskNode

//#BEGIN MaskLayer
    %cs_RefUnref(osgEarth::MaskLayer)

    %include <osgEarth/MaskLayer>
    
    %template(MaskLayerRef) osg::ref_ptr<osgEarth::MaskLayer>;
    %template(MaskLayerObserver) osg::observer_ptr<osgEarth::MaskLayer>;
    %template(MaskLayerVector) std::vector< osg::ref_ptr<osgEarth::MaskLayer> >;
//#END MaskLayer

//#BEGIN ModelSource
    %ignore osgEarth::ModelSource::initialize;
    %cs_RefUnref(osgEarth::ModelSource)
    %include <osgEarth/ModelSource>
    %template(OptionalModelSourceOptions) osgEarth::optional<osgEarth::ModelSourceOptions>;
//#END ModelSource

//#BEGIN ModelLayer
    //%cs_RefUnref(osgEarth::ModelLayerOptions)
    %cs_RefUnref(osgEarth::ModelLayer)
    %include <osgEarth/ModelLayer>
    %template(ModelLayerRef) osg::ref_ptr<osgEarth::ModelLayer>;
    %template(ModelLayerObserver) osg::observer_ptr<osgEarth::ModelLayer>;
    %template(ModelLayerVector) std::vector< osg::ref_ptr<osgEarth::ModelLayer> >;
//#END ModelLayer

//#BEGIN Cache
    %cs_RefUnref(osgEarth::Cache)
    %include <osgEarth/Cache>
//#END Cache

//#BEGIN Profile
    %cs_RefUnref(osgEarth::Profile)
    %include <osgEarth/Profile>
//#END Profile


//#BEGIN Cache
    %cs_RefUnref(osgEarth::Cache)
    %include <osgEarth/Cache>
//#END Cache

//#BEGIN CachePolicy
    %include <osgEarth/CachePolicy>
    %template(OptionalCachePolicyUsage) osgEarth::optional<osgEarth::CachePolicy::Usage>;
//#END CachePolicy


//#BEGIN TerrainEffect
    %cs_RefUnref(osgEarth::TerrainEffect)
    %include <osgEarth/TerrainEffect>
//#END TerrainEffect

//#BEGIN TerrainEngineNode
    %ignore osgEarth::TerrainEngineNodeFactory;
    // No funciona!!!
    //%ignore osgEarth::TerrainDecorator::onInstall( osgEarth::TerrainEngineNode* engine );
    //%ignore osgEarth::TerrainDecorator::onUninstall( osgEarth::TerrainEngineNode* engine );
    %cs_RefUnref(osgEarth::TerrainEngineNode)
    %cs_RefUnref(osgEarth::TerrainDecorator)

namespace osgEarth
{
    class TerrainDecorator : public osg::Group
    {
    protected:
        TerrainDecorator();
        virtual ~TerrainDecorator();
    };
}

    %include <osgEarth/TerrainEngineNode>
//#END TerrainEngineNode


//#BEGIN MapFrame
    %ignore osgEarth::MapFrame::getElevationLayerByUID;
    %ignore osgEarth::MapFrame::getElevationLayerByName;
    %include <osgEarth/MapFrame>
//#END MapFrame

//#BEGIN MapOptions
    %include <osgEarth/MapOptions>
    %template(OptionalCoordinateSystemType) osgEarth::optional<osgEarth::MapOptions::CoordinateSystemType>;
    %template(OptionalProfileOptions) osgEarth::optional<osgEarth::ProfileOptions>;
    %template(OptionalCacheOptions) osgEarth::optional<osgEarth::CacheOptions>;
    %template(OptionalCachePolicy) osgEarth::optional<osgEarth::CachePolicy>;
//#END MapOptions

//#BEGIN Map
    %cs_RefUnref(osgEarth::Map)
    %include <osgEarth/Map>
//#END Map

//#BEGIN MapNodeOptions
    %include <osgEarth/MapNodeOptions>
//#END MapNodeOptions

//#BEGIN MapNode
    %cs_RefUnref(osgEarth::MapNode)
    %cs_RefUnref(osgEarth::MapNode::TileRangeData)
    %include <osgEarth/MapNode>
    %extend osgEarth::MapNode {
        static osgEarth::MapNode* asMapNode(osg::Node* node) {
            return dynamic_cast<MapNode*>(node);
        }
    }
//#END MapNode

//#BEGIN MapInfo
    %include <osgEarth/MapInfo>
//#END MapInfo

//#BEGIN Viewpoint
    %cs_RefUnref(osgEarth::GeoTransform)
    %include <osgEarth/GeoTransform>
//#END Viewpoint


//#BEGIN Viewpoint
    %include <osgEarth/Viewpoint>
//#END Viewpoint


//#BEGIN VirtualProgram
    %ignore osgEarth::VirtualProgram::ShaderEntry::ShaderEntry;
    %ignore osgEarth::VirtualProgram::ShaderEntry::accept;
    %cs_RefUnref(osgEarth::ShaderComp::AcceptCallback)
    %cs_RefUnref(osgEarth::VirtualProgram)
    %include <osgEarth/VirtualProgram>
//#END VirtualProgram

//#BEGIN ShaderGenerator
    %cs_RefUnref(osgEarth::ShaderGenerator)
    %include <osgEarth/ShaderGenerator>
//#END ShaderGenerator


//#BEGIN Capabilities
    %cs_RefUnref(osgEarth::Capabilities)
    %include <osgEarth/Capabilities>
//#END Capabilities

//#BEGIN Registry
    %cs_RefUnref(osgEarth::Registry)
    %include <osgEarth/Registry>
//#END Registry

#endif
