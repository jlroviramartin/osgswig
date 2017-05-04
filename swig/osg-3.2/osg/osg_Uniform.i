%{
#include <osg/Uniform>
%}


//#BEGIN Uniform
    %cs_RefUnref(osg::Uniform)
    %cs_RefUnref(osg::Uniform::Callback)

    %feature("director") osg::Uniform::Callback;

    %ignore osg::Uniform::apply;
    %rename(Lt)    osg::Uniform::operator <;
    %rename(Eq)    osg::Uniform::operator ==;
    %rename(NotEq) osg::Uniform::operator !=;
    %rename(Execute) osg::Uniform::Callback::operator ();

    %include osg/Uniform

    %template(UniformRef)      osg::ref_ptr<osg::Uniform>;
    %template(UniformObserver) osg::observer_ptr<osg::Uniform>;
//#END Uniform

%define MATRIX_HELPER(name, tname, type, nrow, ncol)
    %ignore osg::MatrixTemplate<type, nrow, ncol>::operator [];
    %ignore osg::MatrixTemplate<type, nrow, ncol>::operator ();

    %rename(Set)   osg::MatrixTemplate<type, nrow, ncol>::operator =;

    %template(Base ## name) osg::MatrixTemplate<type, nrow, ncol>;
    %template(name)         osg::tname<type>;
%enddef

    %extend osg::MatrixTemplate {
    public:
        osg::MatrixTemplate::value_type get(int row, int col) {
            return (*self)(row, col);
        }
        void set(int row, int col,osg::MatrixTemplate::value_type value) {
            (*self)(row, col)=value;
        }
    }

    MATRIX_HELPER(Matrix2,   Matrix2Template,   float, 2, 2)
    MATRIX_HELPER(Matrix2x3, Matrix2x3Template, float, 2, 3)
    MATRIX_HELPER(Matrix2x4, Matrix2x4Template, float, 2, 4)
    MATRIX_HELPER(Matrix3x2, Matrix3x2Template, float, 3, 2)
    MATRIX_HELPER(Matrix3,   Matrix3Template,   float, 3, 3)
    MATRIX_HELPER(Matrix3x4, Matrix3x4Template, float, 3, 4)
    MATRIX_HELPER(Matrix4x2, Matrix4x2Template, float, 4, 2)
    MATRIX_HELPER(Matrix4x3, Matrix4x3Template, float, 4, 3)

    MATRIX_HELPER(Matrix2d,   Matrix2Template,   double, 2, 2)
    MATRIX_HELPER(Matrix2x3d, Matrix2x3Template, double, 2, 3)
    MATRIX_HELPER(Matrix2x4d, Matrix2x4Template, double, 2, 4)
    MATRIX_HELPER(Matrix3x2d, Matrix3x2Template, double, 3, 2)
    MATRIX_HELPER(Matrix3d,   Matrix3Template,   double, 3, 3)
    MATRIX_HELPER(Matrix3x4d, Matrix3x4Template, double, 3, 4)
    MATRIX_HELPER(Matrix4x2d, Matrix4x2Template, double, 4, 2)
    MATRIX_HELPER(Matrix4x3d, Matrix4x3Template, double, 4, 3)
