#ifndef OSG_LODEX
#define OSG_LODEX 1

#include <osg/LOD>

namespace osg {

class /*OSG_EXPORT*/ LODEx : public LOD
{
    public :

        LODEx() { _lodCallback = NULL; }

        LODEx(const LODEx& lod, const CopyOp& copyop=CopyOp::SHALLOW_COPY)
            : LOD(lod, copyop),
              _lodCallback(lod._lodCallback) { }

        META_Node(osg, LODEx);

        virtual void ascend(NodeVisitor& nv) {
            if (_lodCallback == NULL) {
                LOD::ascend(nv);
                return;
            }
            _lodCallback->ascend(*this, nv);
        }

        virtual void traverse(NodeVisitor& nv) {
            if (_lodCallback == NULL) {
                LOD::traverse(nv);
                return;
            }
            _lodCallback->traverse(*this, nv);
        }

        struct LODExCallback : public osg::Object
        {
            LODExCallback() { }

            LODExCallback(const LODExCallback& callback, const CopyOp& copyop)
                : osg::Object(callback, copyop) { }

            META_Object(osg, LODExCallback);

            virtual void ascend(LODEx& lod, NodeVisitor& nv) { lod.LOD::ascend(nv); }
            virtual void traverse(LODEx& lod, NodeVisitor& nv) { lod.LOD::traverse(nv); }
        };

        void setLODCallback(LODExCallback* callback) { _lodCallback = callback; }

        LODExCallback* getLODCallback() { return _lodCallback.get(); }

        const LODExCallback* getLODCallback() const { return _lodCallback.get(); }

    private:
        virtual ~LODEx() { }

        ref_ptr<LODExCallback> _lodCallback;
};

}

#endif
