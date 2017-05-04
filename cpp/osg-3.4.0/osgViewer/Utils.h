#ifndef OSGVIEWER_UTILS
#define OSGVIEWER_UTILS 1

#include <osg/GraphicsContext>
#include <osgViewer/GraphicsWindow>
#include <osgViewer/api/Win32/GraphicsWindowWin32>

namespace osgViewer {

class Utils {

public:
    static osgViewer::GraphicsWindowWin32* castGraphicsHandleWin32(osg::GraphicsContext* p) {
        return dynamic_cast<osgViewer::GraphicsWindowWin32*>(p);
    }

};

}

#endif /* OSGVIEWER_UTILS */
