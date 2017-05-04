#ifndef OSG_MOVE_WITH_EYE_POINT_TRANSFORM
#define OSG_MOVE_WITH_EYE_POINT_TRANSFORM 1

#include <osgViewer/CompositeViewer>
#include <osgGA/TerrainManipulator>
//#include <osgGA/MatrixManipulator>
#include <osg/Group>
#include <osg/Node>
#include <osg/Depth>
#include <osg/NodeCallback>
#include <osg/Drawable>

// Enlaces:
//  - Delta3D dtcore:MoveEarthySkyWithEyePointTransform
//  - http://lists.openscenegraph.org/pipermail/osg-users-openscenegraph.org/2009-July/030820.html
//      - http://lists.openscenegraph.org/pipermail/osg-users-openscenegraph.org/attachments/20090717/d49f6828/attachment.txt
//  - http://forum.openscenegraph.org/viewtopic.php?t=2314
//      - http://forum.openscenegraph.org/viewtopic.php?p=10980#10980
//  - http://forum.openscenegraph.org/viewtopic.php?t=3170
//  - http://markmail.org/message/6alrek3qff2vczbd
//  - http://markmail.org/message/32b74nt5im6s2gj5
//  - http://www.flipcode.com/archives/Sky_Domes.shtml

//osg::EllipsoidModel *earth;
//osg::Group *root;
//osgViewer::CompositeViewer viewer;
//osgViewer::View *view;

namespace osg {

#ifdef __INTERESANTE__
class MoveSkyWithEyePointTransform : public osg::Transform
{
public:
    MoveSkyWithEyePointTransform()
    {
        skyscale = 6.0;
        skycenterx = skyscale * 26380.0;
        skycentery = skyscale * 37684.0;
    }

    osg::EllipsoidModel* getEllipsoidModel() {
        return this->earth;
    }

    /*const osg::EllipsoidModel* getEllipsoidModel() const {
        return this->earth;
    }*/

    void setEllipsoidModel(osg::EllipsoidModel* earth) {
        this->earth = earth;
    }

    double getSkyscale() const {
        return this->skyscale;
    }

    void setSkyscale(double skyscale) {
        this->skyscale = skyscale;
    }

    osg::Vec2d getSkyCenter() const { 
        return osg::Vec2d(this->skycenterx, this->skycentery);
    }

    void setSkyCenter(osg::Vec3d skycenter) { 
        this->skycenterx = skycenter.x();
        this->skycentery = skycenter.y();
    }

    virtual bool computeLocalToWorldMatrix(osg::Matrix & matrix, osg::NodeVisitor* nv) const
    {
        osgUtil::CullVisitor* cv = dynamic_cast<osgUtil::CullVisitor*>(nv);
        if (cv)
        {
            osg::Vec3d eyePointLocal = cv->getEyeLocal();

            osg::Matrixd lclm;
            // earth is osg::EllipsoidModel*
            earth->computeLocalToWorldTransformFromXYZ(eyePointLocal.x(),
                                                       eyePointLocal.y(),
                                                       eyePointLocal.z(), lclm);

            matrix.preMult(osg::Matrix::scale(skyscale, skyscale, skyscale)
                           * osg::Matrix::translate(-skycenterx, -skycentery, -10000.0)
                           * lclm);
        }
        return true;
    }

private:

    osg::EllipsoidModel *earth;
    double skyscale;
    double skycenterx;
    double skycentery;
};
#endif

class SkyDome;
struct AddCallbackToDrawablesVisitor;
struct DoNotIncludeInNearFarComputationCallback;

class MoveWithEyePointTransform : public osg::Transform
{
public:

    MoveWithEyePointTransform() : m_height(0), m_lockZ(true) {
    }

    /** Get the transformation matrix which moves from local coords to world coords.*/
    virtual bool computeLocalToWorldMatrix(osg::Matrix& matrix,osg::NodeVisitor* nv) const 
    {
        osgUtil::CullVisitor* cv = dynamic_cast<osgUtil::CullVisitor*>(nv);
        if (cv)
        {
            osg::Vec3 eyePointLocal = cv->getEyeLocal();
            matrix.preMultTranslate(osg::Vec3(eyePointLocal.x(),
                                              eyePointLocal.y(),
                                              getLockZ() ? getHeight() : (eyePointLocal.z() + getHeight())));
        }
        return true;
    }

    /** Get the transformation matrix which moves from world coords to local coords.*/
    virtual bool computeWorldToLocalMatrix(osg::Matrix& matrix,osg::NodeVisitor* nv) const
    {
        //std::cout<<"computing transform"<<std::endl;
    
        osgUtil::CullVisitor* cv = dynamic_cast<osgUtil::CullVisitor*>(nv);
        if (cv)
        {
            osg::Vec3 eyePointLocal = cv->getEyeLocal();
            matrix.postMultTranslate(osg::Vec3(-eyePointLocal.x(),
                                               -eyePointLocal.y(),
                                               getLockZ() ? -getHeight() : -(eyePointLocal.z() + getHeight())));
        }
        return true;
    }

    bool getLockZ() const { return m_lockZ; }
    void setLockZ(bool lockZ) { m_lockZ = lockZ; }

    float getHeight() const { return m_height; }
    void setHeight(float height) { m_height = height; }

private:
    bool m_lockZ;
    float m_height;
};

// http://forum.openscenegraph.org/viewtopic.php?t=2314&postdays=0&postorder=asc&start=30
class SkyDome : public MoveWithEyePointTransform
{
public:
    SkyDome();

    float getRadius() const { return m_radius; }
    void setRadius(float radius) { m_radius = radius; }

    int getBinNum() const { return m_binNum; }
    void setBinNum(int binNum) { m_binNum = binNum; }

    double computeDistance(osg::Vec3 eye);

    void prepare();

private:
    float m_radius;
    int m_binNum;
};

}

#endif
