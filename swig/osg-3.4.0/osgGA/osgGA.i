%module(directors="1") OsgGAModule;
#pragma SWIG nowarn=516,473

%include globals.i
%import osg/osg.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
// %typemap(csimports) SWIGTYPE
using osg;
%}

%define OSGGA_EXPORT
%enddef

//#BEGIN #include

%{
#include <osgGA/Event>
#include <osgGA/EventHandler>
#include <osgGA/EventQueue>
#include <osgGA/EventVisitor>

#include <osgGA/GUIEventHandler>
#include <osgGA/GUIEventAdapter>
#include <osgGA/GUIActionAdapter>

#include <osgGA/CameraManipulator>
#include <osgGA/StandardManipulator>
#include <osgGA/OrbitManipulator>
#include <osgGA/TrackballManipulator>
#include <osgGA/AnimationPathManipulator>
#include <osgGA/DriveManipulator>
#include <osgGA/KeySwitchMatrixManipulator>
#include <osgGA/SphericalManipulator>
#include <osgGA/FirstPersonManipulator>
#include <osgGA/FlightManipulator>
#include <osgGA/FlightManipulator>
#include <osgGA/UFOManipulator>
#include <osgGA/TerrainManipulator>

#ifdef OSG_3_2_1
#include <osgGA/Device>
#endif
#include <osgGA/EventQueue>
#include <osgGA/EventVisitor>

#include <MyFirstPersonManipulator.h>

using namespace osgGA;
%}

//#END #include

//#BEGIN Event
    %cs_RefUnref(osgGA::Event)
    %include osgGA/Event
//#END Event

//#BEGIN EventHandler
    %cs_RefUnref(osgGA::EventHandler)
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgGA::EventHandler;
    %include osgGA/EventHandler

    %extend osgGA::EventHandler {
        osg::Drawable::EventCallback* asEventCallback() {
            return self;
        }
    }
//#END EventHandler

//#BEGIN EventQueue
    %cs_RefUnref(osgGA::EventQueue)
    %include osgGA/EventQueue
//#END EventQueue

//#BEGIN EventVisitor
    %cs_RefUnref(osgGA::EventVisitor)
    %ignore osgGA::EventVisitor::apply;
    %feature("director") osgGA::EventVisitor;
    %include osgGA/EventVisitor
//#END EventVisitor


//#BEGIN GUIEventAdapter
    %cs_RefUnref(osgGA::GUIEventAdapter)
    %cs_RefUnref(osgGA::GUIEventAdapter::TouchData)
    %cs_RefUnref(osgGA::PointerData)

    %rename(_object) osgGA::PointerData::object;
    %ignore osgGA::TouchData::begin() const;
    %ignore osgGA::TouchData::end() const;

    %include osgGA/GUIEventAdapter

    %template(GUIEventAdapterRef)      osg::ref_ptr< osgGA::GUIEventAdapter >;
    %template(GUIEventAdapterObserver) osg::observer_ptr< osgGA::GUIEventAdapter >;
    //%template(GUIEventAdapterRefList) std::list< osg::ref_ptr< osgGA::GUIEventAdapter > >;
//#END GUIEventAdapter

//#BEGIN GUIActionAdapter
    %include osgGA/GUIActionAdapter
//#END GUIActionAdapter

//#BEGIN GUIEventHandler
    %cs_RefUnref(osgGA::GUIEventHandler)
    %feature("director") osgGA::GUIEventHandler;

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgGA::GUIEventHandler;
    %rename(Execute) osgGA::GUIEventHandler::operator ();
    //%rename(_event) osgGA::GUIEventHandler::event;
    %ignore osgGA::GUIEventHandler::event;

    %include osgGA/GUIEventHandler

    %extend osgGA::GUIEventHandler {
        osg::Drawable::EventCallback* asEventCallback() {
            return self;
        }
    }

    %template(GUIEventHandlerRef)      osg::ref_ptr<osgGA::GUIEventHandler>;
    %template(GUIEventHandlerObserver) osg::observer_ptr<osgGA::GUIEventHandler>;
//#END GUIEventHandler

//#BEGIN CameraManipulator
    %cs_RefUnref(osgGA::CameraManipulator)
    %cs_RefUnref(osgGA::CameraManipulator::CoordinateFrameCallback)
    %feature("director") osgGA::CameraManipulator;
    //%feature("director") osgGA::CameraManipulator::CoordinateFrameCallback;

    %ignore osgGA::CameraManipulator::handle;
    %ignore osgGA::CameraManipulator::getCoordinateFrameCallback() const;
    %ignore osgGA::CameraManipulator::getNode() const;

    %include osgGA/CameraManipulator
//#END CameraManipulator

//#BEGIN StandardManipulator
    %cs_RefUnref(osgGA::StandardManipulator)
    %cs_RefUnref(osgGA::StandardManipulator::AnimationData)
    %feature("director") osgGA::StandardManipulator;

    %ignore osgGA::StandardManipulator::getNode() const;

    %include osgGA/StandardManipulator
//#END StandardManipulator

//#BEGIN OrbitManipulator
    %cs_RefUnref(osgGA::OrbitManipulator)
    %cs_RefUnref(osgGA::OrbitManipulator::OrbitAnimationData)
    %feature("director") osgGA::OrbitManipulator;

    %include osgGA/OrbitManipulator
//#END OrbitManipulator

//#BEGIN TrackballManipulator
    %cs_RefUnref(osgGA::TrackballManipulator)
    %feature("director") osgGA::TrackballManipulator;

    %include osgGA/TrackballManipulator
//#END TrackballManipulator

//#BEGIN AnimationPathManipulator
    %cs_RefUnref(osgGA::AnimationPathManipulator)
    %feature("director") osgGA::AnimationPathManipulator;

    %cs_RefUnref(osgGA::AnimationPathManipulator::AnimationCompletedCallback)
    //%feature("director") osgGA::AnimationPathManipulator::AnimationCompletedCallback;

    // Hasck: evita un problema de swig al añadir 'feature("director")' a AnimationCompletedCallback
    %cs_RefUnref(osgGA::AnimationPathManipulatorAnimationCompletedCallback)
    %feature("director") osgGA::AnimationPathManipulatorAnimationCompletedCallback;

    %ignore osgGA::AnimationPathManipulator::getAnimationCompletedCallback() const;
    %ignore osgGA::AnimationPathManipulator::getAnimationPath() const;

    %include osgGA/AnimationPathManipulator

    %inline %{
        namespace osgGA{
            struct AnimationPathManipulatorAnimationCompletedCallback : public virtual osgGA::AnimationPathManipulator::AnimationCompletedCallback {
            };
        }
    %}
//#END AnimationPathManipulator

//#BEGIN DriveManipulator
    %cs_RefUnref(osgGA::DriveManipulator)
    %include osgGA/DriveManipulator
//#END DriveManipulator

//#BEGIN KeySwitchMatrixManipulator
    %cs_RefUnref(osgGA::KeySwitchMatrixManipulator)
    %feature("director") osgGA::KeySwitchMatrixManipulator;

    %ignore osgGA::KeySwitchMatrixManipulator::getKeyManipMap() const;
    %ignore osgGA::KeySwitchMatrixManipulator::getCurrentMatrixManipulator() const;
    %ignore osgGA::KeySwitchMatrixManipulator::getMatrixManipulatorWithKey(unsigned int) const;
    %ignore osgGA::KeySwitchMatrixManipulator::getMatrixManipulatorWithIndex(unsigned int) const;

    %include osgGA/KeySwitchMatrixManipulator
//#END KeySwitchMatrixManipulator

//#BEGIN SphericalManipulator
    %cs_RefUnref(osgGA::SphericalManipulator)
    %feature("director") osgGA::SphericalManipulator;

    %include osgGA/SphericalManipulator
//#END SphericalManipulator

//#BEGIN FirstPersonManipulator
    %cs_RefUnref(osgGA::FirstPersonManipulator)
    %cs_RefUnref(osgGA::FirstPersonManipulator::FirstPersonAnimationData)
    %feature("director") osgGA::FirstPersonManipulator;

    %include osgGA/FirstPersonManipulator
//#END FirstPersonManipulator

//#BEGIN FlightManipulator
    %cs_RefUnref(osgGA::FlightManipulator)
    %feature("director") osgGA::FlightManipulator;

    %include osgGA/FlightManipulator
//#END FlightManipulator

//#BEGIN UFOManipulator
    %cs_RefUnref(osgGA::UFOManipulator)
    %feature("director") osgGA::UFOManipulator;

    %include osgGA/UFOManipulator
//#END UFOManipulator

//#END TerrainManipulator
    %cs_RefUnref(osgGA::TerrainManipulator)
    %feature("director") osgGA::TerrainManipulator;

    %include osgGA/TerrainManipulator
//#END TerrainManipulator

#ifdef OSG_3_2_1
//#BEGIN Device
    %cs_RefUnref(osgGA::Device)

    %include osgGA/Device

    %template(DeviceRef)      osg::ref_ptr<osgGA::Device>;
    %template(DeviceObserver) osg::observer_ptr<osgGA::Device>;
//#END Device
#endif

//#BEGIN EventQueue
    %cs_RefUnref(osgGA::EventQueue)
    %include osgGA/EventQueue
//#END EventQueue

//#BEGIN EventVisitor
    %cs_RefUnref(osgGA::EventVisitor)
    %feature("director") osgGA::EventVisitor;

    %ignore osgGA::EventVisitor::apply;

    %include osgGA/EventVisitor

    %extend osgGA::EventVisitor {
        static osgGA::EventVisitor* fromNodeVisitor(osg::NodeVisitor* nv) {
            return dynamic_cast<osgGA::EventVisitor*>(nv);
        }
    }
//#END EventVisitor

//#BEGIN MyFirstPersonManipulator
    %cs_RefUnref(osgGA::MyFirstPersonManipulator)
    %feature("director") osgGA::MyFirstPersonManipulator;

    %include <MyFirstPersonManipulator.h>
//#END MyFirstPersonManipulator
