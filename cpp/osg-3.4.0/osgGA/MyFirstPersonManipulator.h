#ifndef OSG_MY_FIRST_PERSON_MANIPULATOR
#define OSG_MY_FIRST_PERSON_MANIPULATOR 1

#include <osgGA/FirstPersonManipulator>

namespace osgGA {

class MyFirstPersonManipulator : public osgGA::FirstPersonManipulator
{
        typedef osgGA::FirstPersonManipulator inherited;

public:

    MyFirstPersonManipulator( int flags = DEFAULT_SETTINGS );
    MyFirstPersonManipulator( const MyFirstPersonManipulator& fpm,
                              const osg::CopyOp& copyOp = osg::CopyOp::SHALLOW_COPY );

protected:

    virtual bool handleKeyDown( const osgGA::GUIEventAdapter& ea, osgGA::GUIActionAdapter& us );
};

}

#endif /* OSG_MY_FIRST_PERSON_MANIPULATOR */
