%module(directors="1") OsgViewerModule;
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

%define OSGVIEWER_EXPORT
%enddef

//#BEGIN #include

%{
#include <osgViewer/View>
#include <osgViewer/ViewerBase>
#include <osgViewer/Viewer>
#include <osgViewer/Scene>

#include <osgViewer/GraphicsWindow>
#include <osgViewer/api/Win32/GraphicsHandleWin32>
#include <osgViewer/api/Win32/GraphicsWindowWin32>

#include <osgViewer/ViewerEventHandlers>
#include <osgViewer/Utils.h>

using namespace osg;
using namespace osgViewer;
%}

//#END #include

//#BEGIN View
    %cs_RefUnref(osgViewer::ViewConfig)
    %cs_RefUnref(osgViewer::DepthPartitionSettings)
    %cs_RefUnref(osgViewer::View)

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgViewer::View;

    %ignore osgViewer::View::getScene() const;
    %ignore osgViewer::View::getSceneData() const;
    %ignore osgViewer::View::getDatabasePager() const;
    %ignore osgViewer::View::getImagePager() const;
    %ignore osgViewer::View::getEventQueue() const;
    %ignore osgViewer::View::getCameraManipulator() const;
    %ignore osgViewer::View::getEventHandlers() const;
    %ignore osgViewer::View::getDisplaySettings() const;
    %ignore osgViewer::View::requestContinuousUpdate;
    %ignore osgViewer::View::computeIntersections;
	// Clase privada.
    %ignore osgViewer::View::StereoSlaveCallback;

    %rename(osgViewer_View) osgViewer::View;

    namespace osgViewer {
        class ViewerBase;
        class Scene;
    }
    %include osgViewer/View

    %template(ViewVector) std::vector< osgViewer::View* >;

    %extend osgViewer::View {
    public:
        osgGA::GUIActionAdapter* asGUIActionAdapter() {
            return self;
        }
    }
//#END View

//#BEGIN ViewerBase
    %cs_RefUnref(osgViewer::ViewerBase)

    %ignore osgViewer::ViewerBase::getViewerStats() const;
    %ignore osgViewer::ViewerBase::getEventVisitor() const;
    %ignore osgViewer::ViewerBase::getUpdateVisitor() const;
    %ignore osgViewer::ViewerBase::getUpdateOperations() const;

    %include osgViewer/ViewerBase
//#END ViewerBase

//#BEGIN Viewer
    %cs_RefUnref(osgViewer::Viewer)

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgViewer::Viewer;

    %ignore osgViewer::Viewer::getViewerStats() const;
    %ignore osgViewer::Viewer::getCameraWithFocus() const;

    %include osgViewer/Viewer

    %extend osgViewer::Viewer {
    public:
        // Nota: no se puede llamar 'asView' ¿?
        osgViewer::View* asOsgViewerView() {
            return self;
        }
    }
//#END ViewerBase

//#BEGIN Scene
    %cs_RefUnref(osgViewer::Scene)

    %ignore osgViewer::Scene::getSceneData() const;
    %ignore osgViewer::Scene::getDatabasePager() const;
    %ignore osgViewer::Scene::getImagePager() const;

    %include osgViewer/Scene

    %template(SceneVector) std::vector< osgViewer::Scene* >;
//#END Scene

//#BEGIN GraphicsWindow
    %cs_RefUnref(osgViewer::GraphicsWindow)
    %cs_RefUnref(osgViewer::GraphicsWindowEmbedded)

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgViewer::GraphicsWindow;

    %ignore osgViewer::GraphicsWindow::getEventQueue() const;
    %ignore osgViewer::GraphicsWindow::requestContinuousUpdate;

    %include osgViewer/GraphicsWindow

    %extend osgViewer::GraphicsWindow {
    public:
        osgGA::GUIActionAdapter* asGUIActionAdapter() {
            return self;
        }
    }

    %extend osgViewer::GraphicsWindowEmbedded {
    public:
        static osgViewer::GraphicsWindowEmbedded* create(osg::GraphicsContext::Traits* traits=0) {
            return new osgViewer::GraphicsWindowEmbedded(traits);
        }
        static osgViewer::GraphicsWindowEmbedded* create(int x, int y, int width, int height) {
            return new osgViewer::GraphicsWindowEmbedded(x, y, width, height);
        }
    }

    %template(GraphicsWindowVector) std::vector< osgViewer::GraphicsWindow* >;
//#END GraphicsWindow

%include osgViewer/api/Win32/GraphicsHandleWin32

//#BEGIN GraphicsWindowWin32
    %cs_RefUnref(osgViewer::GraphicsWindowWin32)
    %cs_RefUnref(osgViewer::GraphicsWindowWin32::WindowData)

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgViewer::GraphicsWindowWin32;

    %ignore osgViewer::GraphicsWindowWin32::WindowData::WindowData(HWND);
    %ignore osgViewer::GraphicsWindowWin32::WindowData::WindowData(HWND, bool);

    %include osgViewer/api/Win32/GraphicsWindowWin32

    %extend osgViewer::GraphicsWindowWin32 {
        public:
        osgViewer::GraphicsHandleWin32* asGraphicsHandleWin32() {
            return self;
        }
    }

    %extend osgViewer::GraphicsWindowWin32::WindowData {
        public:
        static osgViewer::GraphicsWindowWin32::WindowData* create(HWND window, bool installEventHandler = true) {
            return new osgViewer::GraphicsWindowWin32::WindowData(window, installEventHandler);
        }
    }
//#END GraphicsWindowWin32

//#BEGIN ViewerEventHandlers
    %cs_RefUnref(osgViewer::HelpHandler)
    %cs_RefUnref(osgViewer::StatsHandler)
    %cs_RefUnref(osgViewer::WindowSizeHandler)
    %cs_RefUnref(osgViewer::ThreadingHandler)
    %cs_RefUnref(osgViewer::RecordCameraPathHandler)
    %cs_RefUnref(osgViewer::LODScaleHandler)
    %cs_RefUnref(osgViewer::ToggleSyncToVBlankHandler)
    %cs_RefUnref(osgViewer::ScreenCaptureHandler)
    %cs_RefUnref(osgViewer::ScreenCaptureHandler::CaptureOperation)
    %cs_RefUnref(osgViewer::ScreenCaptureHandler::WriteToFile)
    %cs_RefUnref(osgViewer::InteractiveImageHandler)
    %feature("director") osgViewer::ScreenCaptureHandler::CaptureOperation;

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgViewer::InteractiveImageHandler;

    %rename(Execute) osgViewer::ScreenCaptureHandler::CaptureOperation::operator ();

    %include osgViewer/ViewerEventHandlers

    %extend osgViewer::InteractiveImageHandler {
        public:
        osg::Drawable::CullCallback* asCullCallback() {
            return self;
        }
    }
//#END ViewerEventHandlers

//#BEGIN Utils
    %include osgViewer/Utils.h
//#END Utils
