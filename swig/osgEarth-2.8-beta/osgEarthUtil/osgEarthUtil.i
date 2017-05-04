%module(directors="1") osgEarthUtilModule;

%include globals.i
%import OpenThreads/OpenThreads.i
%import osg/osg.i
%import osgGA/osgGA.i
%import osgEarth/osgEarth.i
%import osgEarthFeatures/osgEarthFeatures.i
%import osgEarthSymbology/osgEarthSymbology.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
using OpenThreads;
using osg;
using osgDB;
using osgGA;
using osgEarth;
using osgEarthSymbology;
using osgEarthFeatures;
%}

%pragma(csharp) moduleimports=%{
using OpenThreads;
using osg;
using osgDB;
using osgGA;
using osgEarth;
using osgEarthSymbology;
using osgEarthFeatures;
%}

%pragma(csharp) imclassimports=%{
using OpenThreads;
using osg;
using osgDB;
using osgGA;
using osgEarth;
using osgEarthSymbology;
using osgEarthFeatures;
%}

%define OSGEARTHUTIL_EXPORT
%enddef

//#BEGIN #include

%{
#include <osgEarthUtil/Ephemeris>
#include <osgEarthUtil/EarthManipulator>
#include <osgEarthUtil/AutoClipPlaneHandler>
#include <osgEarthUtil/Sky>
#include <osgEarthUtil/Ocean>
#include <osgEarthUtil/Controls>
#include <osgEarthUtil/ExampleResources>
#include <osgEarthUtil/LogarithmicDepthBuffer>
//#include <osgEarthUtil/NormalMap>
#include <osgEarthUtil/MouseCoordsTool>
#include <osgEarthUtil/MeasureTool>
#include <osgEarthUtil/LODBlending>
//#include <osgEarthUtil/DetailTexture>
#include <osgEarthUtil/VerticalScale>
//#include <osgEarthUtil/TextureSplatter>
#include <osgEarthUtil/LODBlending>
#include <osgEarthUtil/ContourMap>
#include <osgEarthUtil/Fog>
#include <osgEarthUtil/Shadowing>
//#include <osgEarthUtil/SimplexNoise>

using namespace osgEarth::Util;
using namespace osgEarth::Util::Controls;
%}

//#END #include

//#BEGIN Ephemeris
    %cs_RefUnref(osgEarth::Util::Ephemeris)
    %include <osgEarthUtil/Ephemeris>
//#END #Ephemeris


//#BEGIN EarthManipulator
    %cs_RefUnref(osgEarth::Util::EarthManipulator)
    %cs_RefUnref(osgEarth::Util::EarthManipulator::Settings)
    %cs_RefUnref(osgEarth::Util::EarthManipulator::TetherCallback)
    %ignore osgEarth::Util::EarthManipulator::EventType;
    %ignore osgEarth::Util::EarthManipulator::MouseEvent;

    namespace osgEarth { namespace Util { struct EarthManipulator::ActionOption; } }
    %template(ActionOptionVector) std::vector< osgEarth::Util::EarthManipulator::ActionOption >;

    %include <osgEarthUtil/EarthManipulator>

    /*%extends osgEarth::Util::EarthManipulator {
        public enum EventType {
            EVENT_MOUSE_DOUBLE_CLICK = 1<<2,  // osgGA::GUIEventAdapter::DOUBLECLICK,
            EVENT_MOUSE_DRAG = 1<<3,          // osgGA::GUIEventAdapter::DRAG,
            EVENT_KEY_DOWN = 1<<5,            // osgGA::GUIEventAdapter::KEYDOWN,
            EVENT_SCROLL = 1<<9,              // osgGA::GUIEventAdapter::SCROLL,
            EVENT_MOUSE_CLICK = (1<<16) << 1, // osgGA::GUIEventAdapter::USER << 1,
            EVENT_MULTI_DRAG = (1<<16) << 2,  // osgGA::GUIEventAdapter::USER << 2,
            EVENT_MULTI_PINCH = (1<<16) << 3, // osgGA::GUIEventAdapter::USER << 3,
            EVENT_MULTI_TWIST = (1<<16) << 4, // osgGA::GUIEventAdapter::USER << 4
        }

        public enum MouseEvent {
            MOUSE_LEFT_BUTTON = 1<<0,   // osgGA::GUIEventAdapter::LEFT_MOUSE_BUTTON,
            MOUSE_MIDDLE_BUTTON = 1<<1, // osgGA::GUIEventAdapter::MIDDLE_MOUSE_BUTTON,
            MOUSE_RIGHT_BUTTON = 1<<2   //osgGA::GUIEventAdapter::RIGHT_MOUSE_BUTTON
        }
    }*/
//#END EarthManipulator

//#BEGIN AutoClipPlaneHandler
    %cs_RefUnref(osgEarth::Util::AutoClipPlaneHandler)
    %cs_RefUnref(osgEarth::Util::AutoClipPlaneCullCallback)

    %include <osgEarthUtil/AutoClipPlaneHandler>
//#END AutoClipPlaneHandler


//#BEGIN Sky
    %cs_RefUnref(osgEarth::Util::SkyNode)
    %cs_RefUnref(osgEarth::Util::SkyDriver)

    %include <osgEarthUtil/Sky>
//#END Sky

//#BEGIN Ocean
    %cs_RefUnref(osgEarth::Util::OceanNode)
    %cs_RefUnref(osgEarth::Util::OceanDriver)

    %include <osgEarthUtil/Ocean>
//#END Ocean


//#BEGIN Controls
    %cs_RefUnref(osgEarth::Util::Controls::ControlEventHandler)
    %cs_RefUnref(osgEarth::Util::Controls::Control)
    %cs_RefUnref(osgEarth::Util::Controls::LabelControl)
    %cs_RefUnref(osgEarth::Util::Controls::ButtonControl)
    %cs_RefUnref(osgEarth::Util::Controls::ImageControl)
    %cs_RefUnref(osgEarth::Util::Controls::HSliderControl)
    %cs_RefUnref(osgEarth::Util::Controls::CheckBoxControl)
    %cs_RefUnref(osgEarth::Util::Controls::Frame)
    %cs_RefUnref(osgEarth::Util::Controls::RoundedFrame)
    %cs_RefUnref(osgEarth::Util::Controls::Container)
    %cs_RefUnref(osgEarth::Util::Controls::VBox)
    %cs_RefUnref(osgEarth::Util::Controls::HBox)
    %cs_RefUnref(osgEarth::Util::Controls::Grid)
    %cs_RefUnref(osgEarth::Util::Controls::RefNodeVector)
    %cs_RefUnref(osgEarth::Util::Controls::ControlNode)
    %cs_RefUnref(osgEarth::Util::Controls::ControlNodeBin)
    %cs_RefUnref(osgEarth::Util::Controls::ControlCanvas)

    %include <osgEarthUtil/Controls>
//#END Controls

//#BEGIN ExampleResources
    %ignore osgEarth::Util::ViewpointControlFactory;

    %include <osgEarthUtil/ExampleResources>
//#END ExampleResources

//#BEGIN LogarithmicDepthBuffer
    %cs_RefUnref(osgEarth::Util::Controls::ControlEventHandler)
    %cs_RefUnref(osgEarth::Util::Controls::Control)
    %include <osgEarthUtil/LogarithmicDepthBuffer>
//#END LogarithmicDepthBuffer

//#BEGIN MouseCoordsTool
    %cs_RefUnref(osgEarth::Util::MouseCoordsTool)
    %cs_RefUnref(osgEarth::Util::MouseCoordsTool::Callback)
    %cs_RefUnref(osgEarth::Util::MouseCoordsLabelCallback)

    %include <osgEarthUtil/MouseCoordsTool>
//#END MouseCoordsTool

//#BEGIN MeasureTool
    %cs_RefUnref(osgEarth::Util::MeasureToolHandler)
    %cs_RefUnref(osgEarth::Util::MeasureToolHandler::MeasureToolEventHandler)

    %include <osgEarthUtil/MeasureTool>

    %extend osgEarth::Util::MeasureToolHandler {
    public:
        MapNodeObserver* asMapNodeObserver() {
            return dynamic_cast<MapNodeObserver*>(self);
        }
    }
//#END MeasureTool

//#BEGIN LODBlending
    %cs_RefUnref(osgEarth::Util::LODBlending)
    %include <osgEarthUtil/LODBlending>
//#END LODBlending

//#BEGIN DetailTexture
//    %ignore osgEarth::Util::DetailTexture::setNumOctaves( unsigned value );
//
//    %cs_RefUnref(osgEarth::Util::DetailTexture)
//    %include <osgEarthUtil/DetailTexture>
//#END DetailTexture

//#BEGIN VerticalScale
    %cs_RefUnref(osgEarth::Util::VerticalScale)
    %include <osgEarthUtil/VerticalScale>
//#END VerticalScale

//#BEGIN NormalMap
//    %cs_RefUnref(osgEarth::Util::NormalMap)
//    %include <osgEarthUtil/NormalMap>
//#END NormalMap

//#BEGIN TextureSplatter
//    %ignore osgEarth::Util::TextureSplatter::getInvert;
//    %ignore osgEarth::Util::TextureSplatter::setInvert;
//    %cs_RefUnref(osgEarth::Util::TextureSplatter)
//    %include <osgEarthUtil/TextureSplatter>
//#END TextureSplatter

//#BEGIN LODBlending
    %cs_RefUnref(osgEarth::Util::LODBlending)
    %include <osgEarthUtil/LODBlending>
//#END LODBlending

//#BEGIN ContourMap
    %cs_RefUnref(osgEarth::Util::ContourMap)
    %include <osgEarthUtil/ContourMap>
//#END ContourMap

//#BEGIN Fog
    %ignore osgEarth::Util::FogEffect::FogEffect(osg::StateSet* stateSet );
    %cs_RefUnref(osgEarth::Util::FogEffect)
    %include <osgEarthUtil/Fog>
//#END Fog

//#BEGIN Shadowing
    %cs_RefUnref(osgEarth::Util::ShadowCaster)
    %include <osgEarthUtil/Shadowing>
//#END Shadowing

//#BEGIN SimplexNoise
//    %include <osgEarthUtil/SimplexNoise>
//#END SimplexNoise

//#BEGIN LODBlending
    %cs_RefUnref(osgEarth::Util::LODBlending)
    %include <osgEarthUtil/LODBlending>
//#END LODBlending
