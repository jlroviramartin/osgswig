// http://www.3drealtimesimulation.com/osg/code/osgcode_bbox1.htm

// +----------------------------------------------------------------------------------+
// |
// |  Simple Node Visitor to calculate the Bounding Box extents of the visited Node
// |
// |
// |  usage example:
// |
// |
// |    CalculateBoundingBox bbox ;
// |
// |    node->accept( bbox  );
// |
// |    osg::BoundingBox boxExtents = bboxCalc.bbox();
// |
// +----------------------------------------------------------------------------------+
#include <osg/NodeVisitor>
#include <osg/BoundingBox>
#include <osg/BoundingSphere>
#include <osg/MatrixTransform>
#include <osg/Billboard>

class CalculateBoundingBox : public osg::NodeVisitor {
public:
    CalculateBoundingBox() : m_boundingBox(), NodeVisitor( NodeVisitor::TRAVERSE_ALL_CHILDREN ) {
        m_transformMatrix.makeIdentity();
    }

    virtual ~CalculateBoundingBox() {}

    //   Handle nodes of the type osg::Geode
    virtual void apply( osg::Geode &geode ) {
        osg::BoundingBox bbox;
        // update bounding box for each drawable
        for(  unsigned int i = 0; i < geode.getNumDrawables(); ++i ) {
            // expand the overall bounding box
            bbox.expandBy( geode.getDrawable( i )->getBound());
        }

		if (bbox.valid()) {
            // transform corners by current matrix
            osg::BoundingBox bboxTrans;
            for( unsigned int i = 0; i < 8; ++i ) {
                osg::Vec3 xvec = bbox.corner( i ) * m_transformMatrix;
                bboxTrans.expandBy( xvec );
            }

            // update the overall bounding box size
            m_boundingBox.expandBy( bboxTrans );
		}
        // continue traversing through the graph
        traverse( geode );
    }

    //   Handle nodes of the type osg::MatrixTransform
    virtual void apply( osg::MatrixTransform &node ) {
        osg::Matrix oldtransformMatrix = m_transformMatrix;
        m_transformMatrix *= node.getMatrix();

        // continue traversing through the graph
        traverse( node );

        m_transformMatrix = oldtransformMatrix;
    }

    //    Handle nodes of the type osg::Billboard
    virtual void apply( osg::Billboard &node ) {
        // important to handle billboard so that its size will
        // not affect the geode size continue traversing the graph
        traverse( node );
    }

	// return teh bounding box
    const osg::BoundingBox &getBoundBox() const { return m_boundingBox; }

protected:
    osg::BoundingBox m_boundingBox;          // the overall resultant bounding box
    osg::Matrix      m_transformMatrix;      // the current transform matrix
};
