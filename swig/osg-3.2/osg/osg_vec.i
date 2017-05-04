// OSG_USE_FLOAT_BOUNDINGBOX
// OSG_USE_FLOAT_MATRIX

%{
#include <osg/Vec2b>
#include <osg/Vec3b>
#include <osg/Vec4b>

#include <osg/Vec4ub>

#include <osg/Vec2s>
#include <osg/Vec3s>
#include <osg/Vec4s>

#include <osg/Vec2f>
#include <osg/Vec3f>
#include <osg/Vec4f>

#include <osg/Vec2d>
#include <osg/Vec3d>
#include <osg/Vec4d>

#ifdef OSG_3_2_1
#include <osg/Vec2i>
#include <osg/Vec3i>
#include <osg/Vec4i>

#include <osg/Vec2ub>
#include <osg/Vec3ub>

#include <osg/Vec2us>
#include <osg/Vec3us>
#include <osg/Vec4us>

#include <osg/Vec2ui>
#include <osg/Vec3ui>
#include <osg/Vec4ui>
#endif

#include <osg/Quat>

#include <osg/Matrixf>
#include <osg/Matrixd>

#include <osg/BoundingBox>
#include <osg/BoundingSphere>

#include <osg/Plane>

namespace osg {
    typedef Vec2f Vec2;
    typedef Vec3f Vec3;
    typedef Vec4f Vec4;
    typedef Matrixd Matrix;
    typedef RefMatrixd RefMatrix;

    typedef BoundingBoxd BoundingBox;
    typedef BoundingSphered BoundingSphere;
}
%}

//#BEGIN VEC_IGNORE_HELPER

    %define VEC_IGNORE_HELPER(name)
%extend osg::## name {
public:
    osg::## name::value_type get(int i) {
        return (*self)[i];
    }
    void set(int i,osg::## name::value_type value) {
        (*self)[i]=value;
    }
}
        %ignore osg::## name::operator [];

        %rename(MulAssign) osg::## name::operator *=;
        %rename(DivAssign) osg::## name::operator /=;
        %rename(SumAssign) osg::## name::operator +=;
        %rename(SubAssign) osg::## name::operator -=;

        %rename(Lt) osg::## name::operator <;
        %rename(Eq) osg::## name::operator ==;
        %rename(NotEq) osg::## name::operator !=;

        %rename(Mul) osg::## name::operator *;
        %rename(Div) osg::## name::operator /;
        %rename(Sum) osg::## name::operator +;
        %rename(Sub) osg::## name::operator -;
        //%rename(Power) osg::## name::operator ^;
        %rename(Cross) osg::## name::operator ^;

        %rename(Set) osg::## name::operator =;

        /* ignore all by reference version */
        %ignore osg::## name::x();
        %ignore osg::## name::y();
        %ignore osg::## name::z();
        %ignore osg::## name::w();
        %ignore osg::## name::r();
        %ignore osg::## name::g();
        %ignore osg::## name::b();
        %ignore osg::## name::a();

        %ignore osg::## name::_v;
        %ignore osg::## name::ptr() const;
        %ignore osg::## name::ptr();
    %enddef

//#END VEC_IGNORE_HELPER

//#BEGIN MATRIX_IGNORE_HELPER

    %define MATRIX_IGNORE_HELPER(name)
%extend osg::## name {
public:
    osg::## name::value_type get(int row, int col) {
        return (*self)(row,col);
    }
    void set(int row, int col,osg::## name::value_type value) {
        (*self)(row,col)=value;
    }
}
        %rename(SumAssign) osg::## name::operator +=;
        %rename(SubAssign) osg::## name::operator -=;
        %rename(MulAssign) osg::## name::operator *=;
        %rename(DivAssign) osg::## name::operator /=;

        %rename(Lt) osg::## name::operator <;
        %rename(Eq) osg::## name::operator ==;
        %rename(NotEq) osg::## name::operator !=;

        %rename(Mul) osg::## name::operator *;
        %rename(Div) osg::## name::operator /;
        %rename(Sum) osg::## name::operator +;
        %rename(Sub) osg::## name::operator -;

        %rename(Set) osg::## name::operator =;
        //%ignore osg::## name::operator =;

        %ignore osg::## name::operator ()(int,int);
        %ignore osg::## name::operator ()(int,int) const;

        %ignore osg::## name::ptr() const;
    %enddef

//#END MATRIX_IGNORE_HELPER

%ignore osg::operator*;

//#BEGIN Vec

    %ignore osg::Vec2d::operator Vec2f;
    %ignore osg::Vec3d::operator Vec3f;
    %ignore osg::Vec4d::operator Vec4f;
    %ignore osg::Quat::operator =;

    VEC_IGNORE_HELPER(Vec2b)
    VEC_IGNORE_HELPER(Vec3b)
    VEC_IGNORE_HELPER(Vec4b)

    VEC_IGNORE_HELPER(Vec4ub)

    VEC_IGNORE_HELPER(Vec2s)
    VEC_IGNORE_HELPER(Vec3s)
    VEC_IGNORE_HELPER(Vec4s)

    VEC_IGNORE_HELPER(Vec2f)
    VEC_IGNORE_HELPER(Vec3f)
    VEC_IGNORE_HELPER(Vec4f)

    VEC_IGNORE_HELPER(Vec2d)
    VEC_IGNORE_HELPER(Vec3d)
    VEC_IGNORE_HELPER(Vec4d)

#ifdef OSG_3_2_1
    VEC_IGNORE_HELPER(Vec2i)
    VEC_IGNORE_HELPER(Vec3i)
    VEC_IGNORE_HELPER(Vec4i)

    VEC_IGNORE_HELPER(Vec2ub)
    VEC_IGNORE_HELPER(Vec3ub)

    VEC_IGNORE_HELPER(Vec2us)
    VEC_IGNORE_HELPER(Vec3us)
    VEC_IGNORE_HELPER(Vec4us)

    VEC_IGNORE_HELPER(Vec2ui)
    VEC_IGNORE_HELPER(Vec3ui)
    VEC_IGNORE_HELPER(Vec4ui)
#endif

    VEC_IGNORE_HELPER(Quat)

    namespace osg {
        //This is a little macro trick to prevent a swig error
        #define X_AXIS(a,b,c) X_AXIS=Vec3f(1.0,0.0,0.0);
        #define Y_AXIS(a,b,c) Y_AXIS=Vec3f(0.0,1.0,0.0);
        #define Z_AXIS(a,b,c) Z_AXIS=Vec3f(0.0,0.0,1.0);
    }

    %include osg/Vec2b
    %include osg/Vec3b
    %include osg/Vec4b

    %include osg/Vec4ub

    %include osg/Vec2s
    %include osg/Vec3s
    %include osg/Vec4s

    %include osg/Vec2f
    %include osg/Vec3f
    %include osg/Vec4f

    %include osg/Vec2d
    %include osg/Vec3d
    %include osg/Vec4d

#ifdef OSG_3_2_1
    %include osg/Vec2i
    %include osg/Vec3i
    %include osg/Vec4i

    %include osg/Vec2ub
    %include osg/Vec3ub

    %include osg/Vec2us
    %include osg/Vec3us
    %include osg/Vec4us

    %include osg/Vec2ui
    %include osg/Vec3ui
    %include osg/Vec4ui
#endif

    %include osg/Quat

    namespace osg {
        typedef Vec2f Vec2;
        typedef Vec3f Vec3;
        typedef Vec4f Vec4;
    }

    %template(Vec2bVector)    std::vector<osg::Vec2b>;
    %template(Vec3bVector)    std::vector<osg::Vec3b>;
    %template(Vec4bVector)    std::vector<osg::Vec4b>;

    %template(Vec4ubVector)   std::vector<osg::Vec4ub>;

    %template(Vec2sVector)    std::vector<osg::Vec2s>;
    %template(Vec3sVector)    std::vector<osg::Vec3s>;
    %template(Vec4sVector)    std::vector<osg::Vec4s>;

    %template(Vec2Vector)     std::vector<osg::Vec2>;
    %template(Vec3Vector)     std::vector<osg::Vec3>;
    %template(Vec4Vector)     std::vector<osg::Vec4>;

    %template(Vec2dVector)    std::vector<osg::Vec2d>;
    %template(Vec3dVector)    std::vector<osg::Vec3d>;
    %template(Vec4dVector)    std::vector<osg::Vec4d>;

#ifdef OSG_3_2_1
    %template(Vec2iVector)    std::vector<osg::Vec2i>;
    %template(Vec3iVector)    std::vector<osg::Vec3i>;
    %template(Vec4iVector)    std::vector<osg::Vec4i>;

    %template(Vec2ubVector)   std::vector<osg::Vec2ub>;
    %template(Vec3ubVector)   std::vector<osg::Vec3ub>;

    %template(Vec2usVector)    std::vector<osg::Vec2us>;
    %template(Vec3usVector)    std::vector<osg::Vec3us>;
    %template(Vec4usVector)    std::vector<osg::Vec4us>;

    %template(Vec2uiVector)    std::vector<osg::Vec2ui>;
    %template(Vec3uiVector)    std::vector<osg::Vec3ui>;
    %template(Vec4uiVector)    std::vector<osg::Vec4ui>;
#endif

    // osgUtils::Tesselator::Prim::__vertices
    %template(PVec3Vector) std::vector< osg::Vec3* >;

//#END Vec

//#BEGIN Matrix

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::RefMatrixd;
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::RefMatrixf;

    %cs_RefUnref(osg::RefMatrixd)
    %cs_RefUnref(osg::RefMatrixf)

    MATRIX_IGNORE_HELPER(Matrixd)
    MATRIX_IGNORE_HELPER(Matrixf)

    %include osg/Matrixd
    %include osg/Matrixf

    namespace osg {
        typedef Matrixd Matrix;
        typedef RefMatrixd RefMatrix;
    }

    %template(MatrixfVector) std::vector< osg::Matrixf >;
    %template(MatrixdVector) std::vector< osg::Matrixd >;

    %extend osg::RefMatrixd {
        osg::Matrixd* asMatrixd() {
            return self;
        }
    }
    %extend osg::RefMatrixf {
        osg::Matrixf* asMatrixf() {
            return self;
        }
    }

//#END Matrix

//#BEGIN Bounding

    %ignore osg::BoundingBoxImpl::xMin();
    %ignore osg::BoundingBoxImpl::yMin();
    %ignore osg::BoundingBoxImpl::zMin();
    %ignore osg::BoundingBoxImpl::xMax();
    %ignore osg::BoundingBoxImpl::yMax();
    %ignore osg::BoundingBoxImpl::zMax();
    %ignore osg::BoundingSphereImpl::center() const;
    %ignore osg::BoundingSphereImpl::radius() const;

    %include osg/BoundingBox
    %include osg/BoundingSphere

    namespace osg {
        %template(BoundingBoxf) BoundingBoxImpl<Vec3f>;
        %template(BoundingSpheref) BoundingSphereImpl<Vec3f>;

        %template(BoundingBoxd) BoundingBoxImpl<Vec3d>;
        %template(BoundingSphered) BoundingSphereImpl<Vec3d>;

        typedef BoundingBoxd BoundingBox;
        typedef BoundingSphered BoundingSphere;
    }

//#END Bounding

//#BEGIN Plane

    %ignore osg::Plane::operator =;
    %ignore osg::Plane::operator ==;
    %ignore osg::Plane::operator !=;
    %ignore osg::Plane::operator <;
    %ignore osg::Plane::ptr() const;
    %ignore osg::Plane::operator [];

    %include osg/Plane

//#END Plane
