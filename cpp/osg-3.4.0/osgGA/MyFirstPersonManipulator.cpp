#include "MyFirstPersonManipulator.h"

namespace osgGA {

struct MyNodeCallback : public osg::NodeCallback {
public:

    virtual void operator()(osg::Node* node, osg::NodeVisitor* nv) {
        OSG_INFO << "<----- Callback " << nv->className();
        traverse(node,nv);
    }
};

MyFirstPersonManipulator::MyFirstPersonManipulator( int flags )
    : inherited(flags) {

    addNestedCallback(new MyNodeCallback());
}

MyFirstPersonManipulator::MyFirstPersonManipulator( const MyFirstPersonManipulator& fpm,
                                                    const osg::CopyOp& copyOp )
    : inherited(fpm, copyOp) {

    addNestedCallback(new MyNodeCallback());
}

bool MyFirstPersonManipulator::handleKeyDown( const osgGA::GUIEventAdapter& ea, osgGA::GUIActionAdapter& us ) {
    return false;
}

}
