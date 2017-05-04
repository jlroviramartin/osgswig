#include "MoveWithEyePointTransform.h"
#include <math.h>
#include <cmath>

namespace osg {

struct DoNotIncludeInNearFarComputationCallback : public osg::NodeCallback
{
    virtual void operator()(osg::Node* node, osg::NodeVisitor* nv)
    {
        osgUtil::CullVisitor* cv = dynamic_cast<osgUtil::CullVisitor*>(nv);
        if( cv )
        {
            // Default value
            osg::CullSettings::ComputeNearFarMode oldMode = cv->getComputeNearFarMode();
            cv->setComputeNearFarMode(osg::CullSettings::DO_NOT_COMPUTE_NEAR_FAR);
            traverse(node, nv);
            cv->setComputeNearFarMode(oldMode);
        }
        else
        {
            traverse(node, nv);
        }
    }
};

struct OverrideNearFarValuesCallback : public osg::Drawable::DrawCallback
{
    OverrideNearFarValuesCallback(SkyDome* skyDome) : m_skyDome(skyDome) {}

    virtual void drawImplementation(osg::RenderInfo& renderInfo, const osg::Drawable* drawable) const
    {
        osg::Camera* currentCamera = renderInfo.getCurrentCamera();
        if (currentCamera)
        {
            // Get the current camera position.
            osg::Vec3 eye, center, up;
            renderInfo.getCurrentCamera()->getViewMatrixAsLookAt(eye, center, up);

            // Get the max distance we need the far plane to be at,
            // which is the distance between the eye and the skydome's
            // center, plus the skydome's radius.
            //double distance = (m_skyDome->getCenter() - eye).length() + m_skyDome->getRadius();
            double distance = m_skyDome->computeDistance(eye);

            // Save old values.
            osg::ref_ptr<osg::RefMatrixd> oldProjectionMatrix = new osg::RefMatrix;
            oldProjectionMatrix->set(renderInfo.getState()->getProjectionMatrix());

            // Get the individual values
            double left, right, bottom, top, zNear, zFar;
            oldProjectionMatrix->getFrustum(left, right, bottom, top, zNear, zFar);

            // Build a new projection matrix with a modified far plane
            osg::ref_ptr<osg::RefMatrixd> projectionMatrix = new osg::RefMatrix;
            projectionMatrix->makeFrustum(left, right, bottom, top, zNear, distance);
            renderInfo.getState()->applyProjectionMatrix(projectionMatrix.get());

            // Draw the drawable
            drawable->drawImplementation(renderInfo);

            // Reset the far plane to the old value.
            renderInfo.getState()->applyProjectionMatrix(oldProjectionMatrix.get());
        }
        else
        {
            drawable->drawImplementation(renderInfo);
        }
    }

    //osg::ref_ptr<SkyDome> m_skyDome;
    SkyDome* m_skyDome;
};

struct AddCallbackToDrawablesVisitor : public osg::NodeVisitor
{
    AddCallbackToDrawablesVisitor(SkyDome* skyDome)
        : osg::NodeVisitor(osg::NodeVisitor::TRAVERSE_ALL_CHILDREN), m_skyDome(skyDome) {}

    virtual void apply(osg::Geode& node)
    {
        for (unsigned int i = 0; i < node.getNumDrawables(); i++)
        {
            node.getDrawable(i)->setDrawCallback(new OverrideNearFarValuesCallback(m_skyDome));
            // Do not use display lists otherwise the callback will only
            // be called once on initial compile.
            node.getDrawable(i)->setUseDisplayList(false);
        }
    }

    //osg::ref_ptr<SkyDome> m_skyDome;
    SkyDome* m_skyDome;
};

SkyDome::SkyDome()
    : m_radius(5000), m_binNum(9)
{
    // Setup rendering so that the skydome does not affect the automatic
    // near/far plane calculation.
    setCullCallback(new DoNotIncludeInNearFarComputationCallback);
}

void SkyDome::prepare() {
    AddCallbackToDrawablesVisitor visitor(this);
    this->accept(visitor);

    // Transparent bin is #10 by default so render just before
    // transparent objects.
    osg::StateSet* ss = getOrCreateStateSet();
    ss->setRenderBinDetails(getBinNum(), "RenderBin");
    ss->setAttributeAndModes(new osg::Depth(osg::Depth::LEQUAL, 1.0, 1.0), osg::StateAttribute::ON);
}

double SkyDome::computeDistance(osg::Vec3 eye) {
    //osg::Vec3 center(eye.x(), eye.y(), getHeight());
    //double distance = (center - eye).length() + getRadius();
    double distance = abs((getHeight() - eye.z())) + getRadius();
    if (isNaN(distance) || !_finite(distance)) {
        return getRadius();
    }
    return distance;
}

}