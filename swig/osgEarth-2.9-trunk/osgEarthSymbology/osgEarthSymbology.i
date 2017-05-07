%module(directors="1") OsgEarthSymbologyModule;

%include globals.i
%import OpenThreads/OpenThreads.i
%import osg/osg.i
%import osgEarth/osgEarth.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
using OpenThreads;
using osg;
using osgDB;
using osgEarth;
%}

%pragma(csharp) moduleimports=%{
using OpenThreads;
using osg;
using osgDB;
using osgEarth;
%}

%pragma(csharp) imclassimports=%{
using OpenThreads;
using osg;
using osgDB;
using osgEarth;
%}

%define OSGEARTHSYMBOLOGY_EXPORT
%enddef

//#BEGIN #include

%{
#include <osgEarthSymbology/Geometry>
#include <osgEarthSymbology/GeometryFactory>
#include <osgEarthSymbology/GeometryRasterizer>

#include <osgEarthSymbology/Symbol>
#include <osgEarthSymbology/ExtrusionSymbol>
#include <osgEarthSymbology/PolygonSymbol>
#include <osgEarthSymbology/Tags>
#include <osgEarthSymbology/Resource>
#include <osgEarthSymbology/ResourceLibrary>
#include <osgEarthSymbology/Skins>
#include <osgEarthSymbology/Style>
#include <osgEarthSymbology/StyleSheet>

using namespace osgEarth::Symbology;

using osgEarth::Symbology::Geometry;
%}

//#END #include

//#BEGIN Geometry
    %cs_RefUnref(osgEarth::Symbology::Geometry)
    %cs_RefUnref(osgEarth::Symbology::PointSet)
    %cs_RefUnref(osgEarth::Symbology::LineString)
    %cs_RefUnref(osgEarth::Symbology::Ring)
    %cs_RefUnref(osgEarth::Symbology::Polygon)
    %cs_RefUnref(osgEarth::Symbology::MultiGeometry)

    %rename(osgEarth_Geometry) osgEarth::Symbology::Geometry;
    %ignore osgEarth::Symbology::Geometry::crop;
    %ignore osgEarth::Symbology::Geometry::buffer;
    %ignore osgEarth::Symbology::Geometry::geounion;
    %ignore osgEarth::Symbology::Geometry::difference;
    %ignore osgEarth::Symbology::ConstSegmentIterator;
    %ignore osgEarth::Symbology::MultiGeometry::getComponents;

    %include <osgEarthSymbology/Geometry>
    
    %extend osgEarth::Symbology::Geometry {
        public:
        bool my_buffer(double distance, osg::ref_ptr<osgEarth::Symbology::Geometry>& output, const BufferParameters& bp = BufferParameters()) const {
            return self->buffer(distance, output, bp);
        }
        bool my_crop(const class osgEarth::Symbology::Polygon* cropPolygon, osg::ref_ptr<osgEarth::Symbology::Geometry>& output) const {
            return self->crop(cropPolygon, output);
        }
        bool my_geounion(const class osgEarth::Symbology::Geometry* other, osg::ref_ptr<osgEarth::Symbology::Geometry>& output) const {
            return self->geounion(other, output);
        }
        bool my_difference(const class osgEarth::Symbology::Polygon* diffPolygon, osg::ref_ptr<osgEarth::Symbology::Geometry>& output) const {
            return self->difference(diffPolygon, output);
        }
    }

    %extend osgEarth::Symbology::MultiGeometry {
        public:
        std::vector< osg::ref_ptr<osgEarth::Symbology::Geometry> >& my_getComponents() {
            return self->getComponents();
        }
    }

    %template(osgEarth_GeometryRef) osg::ref_ptr<osgEarth::Symbology::Geometry>;
    %template(osgEarth_GeometryObserver) osg::observer_ptr<osgEarth::Symbology::Geometry>;
    %template(osgEarth_GeometryRefVector) std::vector< osg::ref_ptr<osgEarth::Symbology::Geometry> >;
//#END Geometry


//#BEGIN GeometryFactory
    %include <osgEarthSymbology/GeometryFactory>
//#END GeometryFactory

//#BEGIN GeometryRasterizer
    %include <osgEarthSymbology/GeometryRasterizer>
//#END GeometryRasterizer


//#BEGIN Symbol
    %cs_RefUnref(osgEarth::Symbology::Symbol)
    %cs_RefUnref(osgEarth::Symbology::SymbolFactory)
    %cs_RefUnref(osgEarth::Symbology::SymbolRegistry)
    %cs_RefUnref(osgEarth::Symbology::SimpleSymbolFactory)

    %include <osgEarthSymbology/Symbol>
//#END Symbol

//#BEGIN ExtrusionSymbol
    %cs_RefUnref(osgEarth::Symbology::ExtrusionSymbol)

    %include <osgEarthSymbology/ExtrusionSymbol>
//#END ExtrusionSymbol

//#BEGIN PolygonSymbol
    %cs_RefUnref(osgEarth::Symbology::PolygonSymbol)

    %include <osgEarthSymbology/PolygonSymbol>
//#END PolygonSymbol

//#BEGIN Tags
    %cs_RefUnref(osgEarth::Symbology::Taggable<osg::Object>)
    %cs_RefUnref(osgEarth::Symbology::Taggable<osgEarth::Symbology::Symbol>)

    %include <osgEarthSymbology/Tags>

    //%template(TaggableReferenced) osgEarth::Symbology::Taggable<osg::Referenced>;
    %template(TaggableObject) osgEarth::Symbology::Taggable<osg::Object>;
    %template(TaggableSymbol) osgEarth::Symbology::Taggable<osgEarth::Symbology::Symbol>;
//#END Tags

//#BEGIN Resource
    %cs_RefUnref(osgEarth::Symbology::Resource)

    %include <osgEarthSymbology/Resource>
//#END Resource

//#BEGIN ResourceLibrary
    %cs_RefUnref(osgEarth::Symbology::ResourceLibrary)

    %include <osgEarthSymbology/ResourceLibrary>
//#END ResourceLibrary

//#BEGIN Skins
    %cs_RefUnref(osgEarth::Symbology::SkinResource)
    %cs_RefUnref(osgEarth::Symbology::SkinSymbol)

    %include <osgEarthSymbology/Skins>
//#END Skins

//#BEGIN Color
    %include <osgEarthSymbology/Color>
    %template(OptionalColor) osgEarth::optional<osgEarth::Symbology::Color>;
//#END Color

//#BEGIN Fill
    %include <osgEarthSymbology/Fill>
    %template(OptionalFill) osgEarth::optional<osgEarth::Symbology::Fill>;
//#END Fill

//#BEGIN Expression
    %include <osgEarthSymbology/Expression>
    %template(OptionalNumericExpression) osgEarth::optional<osgEarth::Symbology::NumericExpression>;
//#END Expression



//#BEGIN Style
    %include <osgEarthSymbology/Style>
    %extend osgEarth::Symbology::Style {
        %template(getOrCreate_ExtrusionSymbol) getOrCreate<ExtrusionSymbol>;
        %template(getOrCreate_PolygonSymbol) getOrCreate<PolygonSymbol>;
        %template(getOrCreate_SkinSymbol) getOrCreate<SkinSymbol>;
    }
//#END Style

//#BEGIN StyleSheet
    %cs_RefUnref(osgEarth::Symbology::StyleSheet)
    %cs_RefUnref(osgEarth::Symbology::StyleSheet::ScriptDef)

    %include <osgEarthSymbology/StyleSheet>
    %extend osg::ref_ptr<osgEarth::Symbology::StyleSheet> {
    public:
        void set(const osgEarth::Symbology::StyleSheet& value) {
            (*self) = value;
        }
    }
    %template(StyleSheetRef) osg::ref_ptr<osgEarth::Symbology::StyleSheet>;
//#END StyleSheet
