#ifndef _OSG_I_
#define _OSG_I_

%module(directors="1") OsgModule;
#pragma SWIG nowarn=516,473

%include "globals.i"
%include "GL.i"
%import OpenThreads/OpenThreads.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
using OpenThreads;
%}

%define OPENTHREAD_EXPORT_DIRECTIVE
%enddef

%define OSG_EXPORT
%enddef

//#BEGIN #include

%{
//#include <OpenThreads/Mutex>
//#include <OpenThreads/Block>
//#include <OpenThreads/Thread>

#include <osg/ref_ptr>
#include <osg/observer_ptr>

#include <osg/Referenced>
#include <osg/Observer>

#include <osg/Notify>

#include <osg/Timer>

#include <osg/GL>
#include <osg/GLU>
#include <osg/GLObjects>
#include <osg/GLExtensions>
#include <osg/GL2Extensions>

#include <osg/CopyOp>
#include <osg/Object>

#include <osg/ApplicationUsage>

#include <osg/buffered_value>

#include <osg/BufferObject>

#include <osg/Uniform>
#include <osg/MixinVector>
#include <osg/Array>

#include <osg/AnimationPath>

#include <osg/StateAttributeCallback>
#include <osg/Image>

#include <osg/Node>
#include <osg/Geode>
#include <osg/Group>
#include <osg/ProxyNode>
#include <osg/Drawable>
#include <osg/Geometry>
#include <osg/ShapeDrawable>
#include <osg/Transform>
#include <osg/MatrixTransform>
#include <osg/CullSettings>
#include <osg/CullStack>
#include <osg/Billboard>
#include <osg/LOD>
#include <osg/PagedLOD>
#include <osg/Switch>
#include <osg/ClearNode>
#include <osg/Projection>
#include <osg/OccluderNode>
#include <osg/ClipNode>
#include <osg/OcclusionQueryNode>

// StateAttribute
#include <osg/StateAttribute>
#include <osg/CullFace>
#include <osg/Depth>
#include <osg/Stencil>
#include <osg/StencilTwoSided>
#include <osg/ColorMask>
#include <osg/ColorMatrix>
#include <osg/Scissor>
#include <osg/Material>
#include <osg/LogicOp>
#include <osg/FrontFace>
#include <osg/Hint>
#include <osg/TexEnv>
#include <osg/TexEnvCombine>
#include <osg/TexEnvFilter>
#include <osg/TexGen>
#include <osg/TexMat>
#include <osg/BlendFunc>
#include <osg/AlphaFunc>
#include <osg/PolygonOffset>
#include <osg/PolygonStipple>
#include <osg/PolygonMode>
#include <osg/LineWidth>
#include <osg/FrameBufferObject>
#include <osg/Multisample>
#include <osg/ClipPlane>
#include <osg/ClampColor>
#include <osg/BufferIndexBinding>
#include <osg/Point>
#include <osg/PointSprite>
#include <osg/LightModel>
#include <osg/ShadeModel>
#include <osg/BlendColor>
#include <osg/BlendEquation>
#include <osg/Viewport>

#include <osg/GraphicsContext>
#include <osg/Camera>
#include <osg/DisplaySettings>
#include <osg/View>

#include <osg/CameraView>
#include <osg/PositionAttitudeTransform>
#include <osg/Sequence>

#include <osg/Shape>

#include <osg/NodeVisitor>
#include <osg/ComputeBoundsVisitor>
#include <osg/NodeCallback>

#include <osg/PrimitiveSet>
#include <osg/StateSet>

#include <osg/Light>
#include <osg/LightSource>
#include <osg/Texture>
#include <osg/Texture1D>
#include <osg/Texture2D>
#include <osg/Texture2DArray>
#include <osg/Texture2DMultisample>
#include <osg/Texture3D>
#include <osg/TextureCubeMap>
#include <osg/TextureRectangle>

#include <osg/TexGenNode>

#include <osg/State>

#include <osg/OperationThread>

#include <osg/CoordinateSystemNode>

#include <osg/TransferFunction>

#include <osg/Shader>
#include <osg/ShaderAttribute>
#include <osg/ShaderComposer>
#include <osg/Program>

#include <LODEx.h>
#include <CalculateBoundingBox.h>
#include <MoveWithEyePointTransform.h>

#include <CastUtils.h>

using namespace osg;
%}

// ShadeModel
#define OSG_GL_FIXED_FUNCTION_AVAILABLE

/*
1>osg_wrap.obj : error LNK2019: símbolo externo "class osg::StateSet * __cdecl osg::initOQState(void)" (?initOQState@osg@@YAPAVStateSet@1@XZ) sin resolver al que se hace referencia en la función _CSharp_initOQState@0
1>osg_wrap.obj : error LNK2019: símbolo externo "class osg::StateSet * __cdecl osg::initOQDebugState(void)" (?initOQDebugState@osg@@YAPAVStateSet@1@XZ) sin resolver al que se hace referencia en la función _CSharp_initOQDebugState@0
1>osg_wrap.obj : error LNK2019: símbolo externo "public: __thiscall osg::QueryGeometry::QueryGeometry(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)" (??0QueryGeometry@osg@@QAE@ABV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@Z) sin resolver al que se hace referencia en la función _CSharp_new_QueryGeometry__SWIG_0@4
1>osg_wrap.obj : error LNK2019: símbolo externo "public: void __thiscall osg::QueryGeometry::reset(void)" (?reset@QueryGeometry@osg@@QAEXXZ) sin resolver al que se hace referencia en la función _CSharp_QueryGeometry_reset@4
1>osg_wrap.obj : error LNK2019: símbolo externo "public: unsigned int __thiscall osg::QueryGeometry::getNumPixels(class osg::Camera const *)" (?getNumPixels@QueryGeometry@osg@@QAEIPBVCamera@2@@Z) sin resolver al que se hace referencia en la función _CSharp_QueryGeometry_getNumPixels@8
1>osg_wrap.obj : error LNK2019: símbolo externo "public: static void __cdecl osg::QueryGeometry::deleteQueryObject(unsigned int,unsigned int)" (?deleteQueryObject@QueryGeometry@osg@@SAXII@Z) sin resolver al que se hace referencia en la función _CSharp_QueryGeometry_deleteQueryObject@8
1>osg_wrap.obj : error LNK2019: símbolo externo "public: static void __cdecl osg::QueryGeometry::flushDeletedQueryObjects(unsigned int,double,double &)" (?flushDeletedQueryObjects@QueryGeometry@osg@@SAXINAAN@Z) sin resolver al que se hace referencia en la función _CSharp_QueryGeometry_flushDeletedQueryObjects@16
1>osg_wrap.obj : error LNK2019: símbolo externo "public: static void __cdecl osg::QueryGeometry::discardDeletedQueryObjects(unsigned int)" (?discardDeletedQueryObjects@QueryGeometry@osg@@SAXI@Z) sin resolver al que se hace referencia en la función _CSharp_QueryGeometry_discardDeletedQueryObjects@4
*/
%ignore osg::initOQState;
%ignore osg::initOQDebugState;
%ignore osg::QueryGeometry::QueryGeometry;
%ignore osg::QueryGeometry::reset;
%ignore osg::QueryGeometry::getNumPixels;
%ignore osg::QueryGeometry::deleteQueryObject;
%ignore osg::QueryGeometry::flushDeletedQueryObjects;
%ignore osg::QueryGeometry::discardDeletedQueryObjects;

//#END #include

%rename(_lock) *::lock;
%rename(Set)   *::operator =;

%template(BoolVector)   std::vector<bool>;

%template(FloatFloatPair)       std::pair<float,float>;
%template(FloatFloatPairVector) std::vector< std::pair<float,float> >;

%template(UIntUIntMap)       std::map<unsigned int,unsigned int>;
%template(UIntUIntMapVector) std::vector< std::map<unsigned int,unsigned int> >;

%template(StringVector)    std::vector<std::string>;
%template(StringDeque)     std::deque<std::string>;
//%template(StringList)      std::list<std::string>;
//%template(StringSet)       std::set<std::string>;
%template(StringStringMap) std::map<std::string, std::string>;

//#BEGIN ref_ptr
    %warnfilter(SWIGWARN_LANG_IDENTIFIER) osg::ref_ptr; // 503

    %ignore osg::ref_ptr::operator =;
    %ignore osg::ref_ptr::operator !;
    %ignore osg::ref_ptr::operator <;
    %ignore osg::ref_ptr::operator ==;
    %ignore osg::ref_ptr::operator !=;
    %ignore osg::ref_ptr::operator .;
    %ignore osg::ref_ptr::operator *;
    %ignore osg::ref_ptr::operator ->;
    %ignore osg::ref_ptr::operator unspecified_bool_type;

    %import osg/ref_ptr
    %extend osg::ref_ptr {
    public:
        void set(T* ptr) {
            (*self) = ptr;
        }
    }
//#END ref_ptr

//#BEGIN observer_ptr
    %warnfilter(SWIGWARN_LANG_IDENTIFIER) osg::observer_ptr; // 503

    %ignore osg::observer_ptr::operator =;
    %ignore osg::observer_ptr::operator !;
    %ignore osg::observer_ptr::operator <;
    %ignore osg::observer_ptr::operator >;
    %ignore osg::observer_ptr::operator ==;
    %ignore osg::observer_ptr::operator !=;
    %ignore osg::observer_ptr::operator .;
    %ignore osg::observer_ptr::operator *;
    %ignore osg::observer_ptr::operator ->;

    %import osg/observer_ptr
//#END observer_ptr

//#BEGIN Referenced
    %cs_RefUnref(osg::Referenced)

    %ignore osg::Referenced::operator =;

    %rename(_ref) osg::Referenced::ref;
    %rename(_unref) osg::Referenced::unref;
    %rename(_unref_nodelete) osg::Referenced::unref_nodelete;

    %include osg/Referenced

    %template(ReferencedRef)      osg::ref_ptr<osg::Referenced>;
    %template(ReferencedObserver) osg::observer_ptr<osg::Referenced>;
//#END Referenced

//#BEGIN observer_ptr
    // Evita un warning muy molesto!
    %warnfilter(SWIGWARN_LANG_IDENTIFIER) osg::observer_ptr; // 503
    %warnfilter(SWIGWARN_PARSE_KEYWORD)   osg::observer_ptr; // 314

    %ignore osg::observer_ptr::operator =;
    %ignore osg::observer_ptr::operator ==;
    %ignore osg::observer_ptr::operator !=;
    %ignore osg::observer_ptr::operator <;
    %ignore osg::observer_ptr::operator >;
    %ignore osg::observer_ptr::operator !;
    %ignore osg::ObserverSet::getObserverdObject() const;
    // ?????
    %ignore osg::ObserverSet::addObserver;
    %ignore osg::ObserverSet::removeObserver;

    // No funciona.
    //%rename(_lock) osg::observer_ptr::lock;
    //%rename(_lock) osg::observer_ptr::lock(ref_ptr&) const;

    %import osg/observer_ptr
//#END observer_ptr

//#BEGIN Notify

    %cs_RefUnref(osg::NotifyHandler)
    %cs_RefUnref(osg::StandardNotifyHandler)
    %cs_RefUnref(osg::WinDebugNotifyHandler)

    %feature("director") osg::NotifyHandler;

    %include osg/Notify

//#END Notify

//#BEGIN Observer
    %ignore osg::ObserverSet::getObservers() const;

    %include osg/Observer

    //%template(ObserverSet) std::set<osg::Observer*>;
//#END Observer

//#BEGIN Timer
    %include osg/Timer
//#END Timer

%import osg/GL
%import osg/GLU
%import osg/GLObjects
%import osg/GLExtensions
%import osg/GL2Extensions

//#BEGIN CopyOp
    %ignore osg::CopyOp::operator ();

    %include osg/CopyOp
//#END CopyOp

//#BEGIN Object
    %cs_RefUnref(osg::Object)

    %rename(OSGObject) osg::Object;

    %ignore osg::Object::setName(char const *);
    %ignore osg::Object::getUserData() const;
    %ignore osg::Object::getUserDataContainer() const;

    %include osg/Object

    %template(OSGObjectRef)      osg::ref_ptr<osg::Object>;
    %template(OSGObjectObserver) osg::observer_ptr<osg::Object>;
    %template(OSGObjectVector)   std::vector<osg::Object*>;
    //%template(OSGObjectRefList)  std::list< osg::ref_ptr<osg::Object> >;
//#END Object

//#BEGIN ApplicationUsage

    %cs_RefUnref(osg::ApplicationUsage)

    #include <osg/ApplicationUsage>

//#END ApplicationUsage

%include osg_vec.i

#ifdef OSG_3_2_1
%include osg_Uniform.i
#endif

//#BEGIN buffered_value
    %include osg/buffered_value
//#END buffered_value

//#BEGIN BufferObject
    %cs_RefUnref(osg::GLBufferObject)
    %cs_RefUnref(osg::GLBufferObjectSet)
    %cs_RefUnref(osg::GLBufferObjectManager)
    %cs_RefUnref(osg::BufferObject)
    %cs_RefUnref(osg::BufferData)
    %cs_RefUnref(osg::VertexBufferObject)
    %cs_RefUnref(osg::ElementBufferObject)
    %cs_RefUnref(osg::PixelBufferObject)
    %cs_RefUnref(osg::PixelDataBufferObject)
    %cs_RefUnref(osg::UniformBufferObject)

    %ignore osg::GLBufferObject::getGLObjectID() const;
    %ignore osg::GLBufferObjectManager::getNumberActiveGLBufferObjects() const;
    %ignore osg::GLBufferObjectManager::getNumberOrphanedGLBufferObjects() const;
    %ignore osg::GLBufferObjectManager::getCurrGLBufferObjectPoolSize() const;
    %ignore osg::BufferObject::getProfile() const;
    %ignore osg::BufferObject::getBufferData(unsigned int) const;
    %ignore osg::BufferData::getBufferObject() const;
    %ignore osg::BufferData::getModifiedCallback() const;
    %ignore osg::VertexBufferObject::getArray(unsigned int) const;
    %ignore osg::ElementBufferObject::getDrawElements(unsigned int) const;
    %ignore osg::PixelBufferObject::getImage() const;
    %ignore osg::BufferObjectProfile::operator <;
    %ignore osg::BufferObjectProfile::operator ==;
    %ignore osg::BufferObjectProfile::operator =;

	// Clase privada.
    %ignore osg::GLBufferObject::BufferEntry;

    %include osg/BufferObject
//#END BufferObject

//#BEGIN MixinVector

    // Evita un warning muy molesto!
    %warnfilter(SWIGWARN_LANG_IDENTIFIER) osg::MixinVector; // 503

    %ignore osg::MixinVector::begin() const;
    %ignore osg::MixinVector::end() const;
    %ignore osg::MixinVector::rbegin() const;
    %ignore osg::MixinVector::rend() const;
    %ignore osg::MixinVector::at(size_type) const;
    %ignore osg::MixinVector::back() const;
    %ignore osg::MixinVector::front() const;
    %ignore osg::MixinVector::asVector() const;
    %ignore osg::MixinVector::get_allocator() const;
    %ignore osg::MixinVector::operator =;
    %ignore osg::MixinVector::operator [];
    %ignore osg::MixinVector::operator ==;
    %ignore osg::MixinVector::operator !=;
    %ignore osg::MixinVector::operator <;
    %ignore osg::MixinVector::operator >;
    %ignore osg::MixinVector::operator <=;
    %ignore osg::MixinVector::operator >=;

    %ignore osg::MixinVector::erase(iterator where);
    %ignore osg::MixinVector::erase(iterator first,iterator last);
    %ignore osg::MixinVector::insert(iterator where,const value_type& value);
    %ignore osg::MixinVector::insert(iterator where,InputIterator first, InputIterator last);
    %ignore osg::MixinVector::insert(iterator where,size_type count, const value_type& value);

    %ignore osg::MixinVector::begin();
    %ignore osg::MixinVector::end();
    %ignore osg::MixinVector::rbegin();
    %ignore osg::MixinVector::rend();
    %ignore osg::MixinVector::at(size_type);
    %ignore osg::MixinVector::back();
    %ignore osg::MixinVector::front();

    %template(ByteVector)     std::vector<GLbyte>;
    %template(ShortVector)    std::vector<GLshort>;
    %template(IntVector)      std::vector<GLint>;
    %template(UByteVector)    std::vector<GLubyte>;
    %template(UShortVector)   std::vector<GLushort>;
    %template(UIntVector)     std::vector<GLuint>;
    %template(FloatVector)    std::vector<GLfloat>;
    %template(DoubleVector)   std::vector<GLdouble>;

    %include osg/MixinVector

    namespace osg {
        %template(ByteMixinVector)    MixinVector<GLbyte>;
        %template(ShortMixinVector)   MixinVector<GLshort>;
        %template(IntMixinVector)     MixinVector<GLint>;
        %template(UByteMixinVector)   MixinVector<GLubyte>;
        %template(UShortMixinVector)  MixinVector<GLushort>;
        %template(UIntMixinVector)    MixinVector<GLuint>;
        %template(FloatMixinVector)   MixinVector<GLfloat>;
        %template(DoubleMixinVector)  MixinVector<GLdouble>;

        %template(Vec2bMixinVector)   MixinVector<Vec2b>;
        %template(Vec3bMixinVector)   MixinVector<Vec3b>;
        %template(Vec4bMixinVector)   MixinVector<Vec4b>;

        %template(Vec4ubMixinVector)  MixinVector<Vec4ub>;

        %template(Vec2sMixinVector)   MixinVector<Vec2s>;
        %template(Vec3sMixinVector)   MixinVector<Vec3s>;
        %template(Vec4sMixinVector)   MixinVector<Vec4s>;

        %template(Vec2MixinVector)    MixinVector<Vec2>;
        %template(Vec3MixinVector)    MixinVector<Vec3>;
        %template(Vec4MixinVector)    MixinVector<Vec4>;

        %template(Vec2dMixinVector)   MixinVector<Vec2d>;
        %template(Vec3dMixinVector)   MixinVector<Vec3d>;
        %template(Vec4dMixinVector)   MixinVector<Vec4d>;

#ifdef OSG_3_2_1
        %template(Vec2ubMixinVector)  MixinVector<Vec2ub>;
        %template(Vec3ubMixinVector)  MixinVector<Vec3ub>;

        %template(Vec2usMixinVector)  MixinVector<Vec2us>;
        %template(Vec3usMixinVector)  MixinVector<Vec3us>;
        %template(Vec4usMixinVector)  MixinVector<Vec4us>;

        %template(Vec2iMixinVector)   MixinVector<Vec2i>;
        %template(Vec3iMixinVector)   MixinVector<Vec3i>;
        %template(Vec4iMixinVector)   MixinVector<Vec4i>;

        %template(Vec2uiMixinVector)  MixinVector<Vec2ui>;
        %template(Vec3uiMixinVector)  MixinVector<Vec3ui>;
        %template(Vec4uiMixinVector)  MixinVector<Vec4ui>;
#endif

        %template(MatrixfMixinVector) MixinVector<Matrixf>;
        %template(MatrixdMixinVector) MixinVector<Matrixd>;
    }

//#END MixinVector

//#BEGIN Array

    %cs_RefUnref(osg::Array)
    %cs_RefUnref(osg::TemplateArray)
    %cs_RefUnref(osg::IndexArray)
    %cs_RefUnref(osg::TemplateIndexArray)

    %ignore osg::Array::getVertexBufferObject() const;
    %ignore osg::TemplateArray::TemplateArray(unsigned int,const T*);
    %ignore osg::TemplateIndexArray::TemplateIndexArray(unsigned int,const T*);

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::TemplateIndexArray;
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::TemplateArray;

    %include osg/Array

    %template(ArrayRef)      osg::ref_ptr<osg::Array>;
    %template(ArrayObserver) osg::observer_ptr<osg::Array>;

    %extend osg::Array {
        osg::ByteArray* asByteArray() {return dynamic_cast<osg::ByteArray*>(self);}
        osg::ShortArray* asShortArray() {return dynamic_cast<osg::ShortArray*>(self);}
        osg::IntArray* asIntArray() {return dynamic_cast<osg::IntArray*>(self);}
        osg::UByteArray* asUByteArray() {return dynamic_cast<osg::UByteArray*>(self);}
        osg::UShortArray* asUShortArray() {return dynamic_cast<osg::UShortArray*>(self);}
        osg::UIntArray* asUIntArray() {return dynamic_cast<osg::UIntArray*>(self);}
        osg::FloatArray* asFloatArray() {return dynamic_cast<osg::FloatArray*>(self);}
        osg::DoubleArray* asDoubleArray() {return dynamic_cast<osg::DoubleArray*>(self);}

        osg::Vec2bArray* asVec2bArray() {return dynamic_cast<osg::Vec2bArray*>(self);}
        osg::Vec3bArray* asVec3bArray() {return dynamic_cast<osg::Vec3bArray*>(self);}
        osg::Vec4bArray* asVec4bArray() {return dynamic_cast<osg::Vec4bArray*>(self);}

        osg::Vec4ubArray* asVec4ubArray() {return dynamic_cast<osg::Vec4ubArray*>(self);}

        osg::Vec2sArray* asVec2sArray() {return dynamic_cast<osg::Vec2sArray*>(self);}
        osg::Vec3sArray* asVec3sArray() {return dynamic_cast<osg::Vec3sArray*>(self);}
        osg::Vec4sArray* asVec4sArray() {return dynamic_cast<osg::Vec4sArray*>(self);}

        osg::Vec2Array* asVec2Array() {return dynamic_cast<osg::Vec2Array*>(self);}
        osg::Vec3Array* asVec3Array() {return dynamic_cast<osg::Vec3Array*>(self);}
        osg::Vec4Array* asVec4Array() {return dynamic_cast<osg::Vec4Array*>(self);}

        osg::Vec2dArray* asVec2dArray() {return dynamic_cast<osg::Vec2dArray*>(self);}
        osg::Vec3dArray* asVec3dArray() {return dynamic_cast<osg::Vec3dArray*>(self);}
        osg::Vec4dArray* asVec4dArray() {return dynamic_cast<osg::Vec4dArray*>(self);}

#ifdef OSG_3_2_1
        osg::Vec2ubArray* asVec2ubArray() {return dynamic_cast<osg::Vec2ubArray*>(self);}
        osg::Vec3ubArray* asVec3ubArray() {return dynamic_cast<osg::Vec3ubArray*>(self);}

        osg::Vec2usArray* asVec2usArray() {return dynamic_cast<osg::Vec2usArray*>(self);}
        osg::Vec3usArray* asVec3usArray() {return dynamic_cast<osg::Vec3usArray*>(self);}
        osg::Vec4usArray* asVec4usArray() {return dynamic_cast<osg::Vec4usArray*>(self);}

        osg::Vec2iArray* asVec2iArray() {return dynamic_cast<osg::Vec2iArray*>(self);}
        osg::Vec3iArray* asVec3iArray() {return dynamic_cast<osg::Vec3iArray*>(self);}
        osg::Vec4iArray* asVec4iArray() {return dynamic_cast<osg::Vec4iArray*>(self);}

        osg::Vec2uiArray* asVec2uiArray() {return dynamic_cast<osg::Vec2uiArray*>(self);}
        osg::Vec3uiArray* asVec3uiArray() {return dynamic_cast<osg::Vec3uiArray*>(self);}
        osg::Vec4uiArray* asVec4uiArray() {return dynamic_cast<osg::Vec4uiArray*>(self);}
#endif

        osg::MatrixfArray* asMatrixfArray() {return dynamic_cast<osg::MatrixfArray*>(self);}

#ifdef OSG_3_2_1
        osg::MatrixdArray* asMatrixdArray() {return dynamic_cast<osg::MatrixdArray*>(self);}
#endif
    };

    %extend osg::TemplateArray {
        TemplateArray(const std::vector<T>& vec) {
            TemplateArray<T,ARRAYTYPE,DataSize,DataType>* arr = new TemplateArray<T,ARRAYTYPE,DataSize,DataType>(vec.size());
            for (std::vector<T>::size_type i = 0; i < vec.size(); i++) {
                (*arr)[i] = vec[i];
            }
            return arr;
        }
        MixinVector<T>* asMixinVector() {
            return self;
        }
        size_type size() {
            return (self)->size();
        }
        T get(size_type i) {
            return (self)->at(i);
        }
        void set(size_type i, const T& value) {
            (self)->at(i) = value;
        }
        void push_back(const T& value) {
            (self)->push_back(value);
        }
        void pop_back() {
            (self)->pop_back();
        }
        T back() {
            return (self)->back();
        }
    }

    %extend osg::TemplateIndexArray {
        TemplateIndexArray(const std::vector<T>& vec) {
            TemplateIndexArray<T,ARRAYTYPE,DataSize,DataType>* arr = new TemplateIndexArray<T,ARRAYTYPE,DataSize,DataType>(vec.size());
            for (std::vector<T>::size_type i = 0; i < vec.size(); i++) {
                (*arr)[i] = vec[i];
            }
            return arr;
        }
        MixinVector<T>* asMixinVector() {
            return self;
        }
        size_type size() {
            return (self)->size();
        }
        T get(size_type i) {
            return (self)->at(i);
        }
        void set(size_type i, const T& value) {
            (self)->at(i) = value;
        }
        void push_back(const T& value) {
            (self)->push_back(value);
        }
        void pop_back() {
            (self)->pop_back();
        }
        T back() {
            return (self)->back();
        }
    }

    %template(ArrayVector)    std::vector<osg::Array*>;
    %template(ArrayRefVector) std::vector< osg::ref_ptr<osg::Array> > ;

    %template(ByteArray)      osg::TemplateIndexArray< GLbyte, osg::Array::ByteArrayType,1,GL_BYTE>;
    %template(ShortArray)     osg::TemplateIndexArray< GLshort, osg::Array::ShortArrayType,1,GL_SHORT>;
    %template(IntArray)       osg::TemplateIndexArray< GLint, osg::Array::IntArrayType,1,GL_INT>;
    %template(UByteArray)     osg::TemplateIndexArray< GLubyte, osg::Array::UByteArrayType,1,GL_UNSIGNED_BYTE>;
    %template(UShortArray)    osg::TemplateIndexArray< GLushort, osg::Array::UShortArrayType,1,GL_UNSIGNED_SHORT>;
    %template(UIntArray)      osg::TemplateIndexArray< GLuint, osg::Array::UIntArrayType,1,GL_UNSIGNED_INT>;

    %template(Vec2bArray)     osg::TemplateArray< osg::Vec2b, osg::Array::Vec2bArrayType,2,GL_BYTE>;
    %template(Vec3bArray)     osg::TemplateArray< osg::Vec3b, osg::Array::Vec3bArrayType,3,GL_BYTE>;
    %template(Vec4bArray)     osg::TemplateArray< osg::Vec4b, osg::Array::Vec4bArrayType,4,GL_BYTE>;

    %template(Vec4ubArray)    osg::TemplateArray< osg::Vec4ub, osg::Array::Vec4ubArrayType,4,GL_UNSIGNED_BYTE>;

    %template(Vec2sArray)     osg::TemplateArray< osg::Vec2s, osg::Array::Vec2sArrayType,2,GL_SHORT>;
    %template(Vec3sArray)     osg::TemplateArray< osg::Vec3s, osg::Array::Vec3sArrayType,3,GL_SHORT>;
    %template(Vec4sArray)     osg::TemplateArray< osg::Vec4s, osg::Array::Vec4sArrayType,4,GL_SHORT>;

    %template(Vec2Array)      osg::TemplateArray< osg::Vec2f, osg::Array::Vec2ArrayType,2,GL_FLOAT>;
    %template(Vec3Array)      osg::TemplateArray< osg::Vec3f, osg::Array::Vec3ArrayType,3,GL_FLOAT>;
    %template(Vec4Array)      osg::TemplateArray< osg::Vec4f, osg::Array::Vec4ArrayType,4,GL_FLOAT>;

    %template(Vec2dArray)     osg::TemplateArray< osg::Vec2d, osg::Array::Vec2dArrayType,2,GL_DOUBLE>;
    %template(Vec3dArray)     osg::TemplateArray< osg::Vec3d, osg::Array::Vec3dArrayType,3,GL_DOUBLE>;
    %template(Vec4dArray)     osg::TemplateArray< osg::Vec4d, osg::Array::Vec4dArrayType,4,GL_DOUBLE>;

#ifdef OSG_3_2_1
    %template(Vec2ubArray)    osg::TemplateArray< osg::Vec2ub, osg::Array::Vec2ubArrayType,2,GL_UNSIGNED_BYTE>;
    %template(Vec3ubArray)    osg::TemplateArray< osg::Vec3ub, osg::Array::Vec3ubArrayType,3,GL_UNSIGNED_BYTE>;

    %template(Vec2usArray)    osg::TemplateArray< osg::Vec2us, osg::Array::Vec2usArrayType,2,GL_UNSIGNED_SHORT>;
    %template(Vec3usArray)    osg::TemplateArray< osg::Vec3us, osg::Array::Vec3usArrayType,3,GL_UNSIGNED_SHORT>;
    %template(Vec4usArray)    osg::TemplateArray< osg::Vec4us, osg::Array::Vec4usArrayType,4,GL_UNSIGNED_SHORT>;

    %template(Vec2iArray)     osg::TemplateArray< osg::Vec2i, osg::Array::Vec2iArrayType,2,GL_INT>;
    %template(Vec3iArray)     osg::TemplateArray< osg::Vec3i, osg::Array::Vec3iArrayType,3,GL_INT>;
    %template(Vec4iArray)     osg::TemplateArray< osg::Vec4i, osg::Array::Vec4iArrayType,4,GL_INT>;

    %template(Vec2uiArray)    osg::TemplateArray< osg::Vec2ui, osg::Array::Vec2uiArrayType,2,GL_UNSIGNED_INT>;
    %template(Vec3uiArray)    osg::TemplateArray< osg::Vec3ui, osg::Array::Vec3uiArrayType,3,GL_UNSIGNED_INT>;
    %template(Vec4uiArray)    osg::TemplateArray< osg::Vec4ui, osg::Array::Vec4uiArrayType,4,GL_UNSIGNED_INT>;
#endif

    %template(FloatArray)     osg::TemplateArray< float, osg::Array::FloatArrayType,1,GL_FLOAT>;
    %template(DoubleArray)    osg::TemplateArray< double, osg::Array::DoubleArrayType,1,GL_DOUBLE>;

    %template(MatrixfArray)   osg::TemplateArray< osg::Matrixf, osg::Array::MatrixArrayType,16,GL_FLOAT>;

#ifdef OSG_3_2_1
    %template(MatrixdArray)   osg::TemplateArray< osg::Matrixd, osg::Array::MatrixArrayType,16,GL_DOUBLE>;
#endif

//#END Array

//#BEGIN Node
    %cs_RefUnref(osg::Node)
    %cs_RefUnref(osg::Node::ComputeBoundingSphereCallback)

    %ignore osg::Node::asTerrain;
    %ignore osg::Node::getParents() const;
    %ignore osg::Node::getParent(unsigned int) const;
    %ignore osg::Node::getUpdateCallback() const;
    %ignore osg::Node::getEventCallback() const;
    %ignore osg::Node::getCullCallback() const;
    %ignore osg::Node::getDescriptions() const;
    %ignore osg::Node::getDescription(unsigned int);
    %ignore osg::Node::getStateSet() const;
    %ignore osg::Node::getComputeBoundingSphereCallback() const;
    %ignore osg::NodeAcceptOp::operator ();

    namespace osg {
        class Group;
        class Transform;
        class Node;
        class Switch;
        class Geode;
        class Camera;
    }

    //namespace osgTerrain {
    //    class Terrain;
    //}

    %include osg/Node

    %template(NodePath)      std::vector<osg::Node*>;
    %template(NodePathList)  std::vector< std::vector<osg::Node*> >;

    %template(NodeRef)       osg::ref_ptr<osg::Node>;
    %template(NodeObserver)  osg::observer_ptr<osg::Node>;
    %template(NodeRefVector) std::vector< osg::ref_ptr<Node> >;
//#END Node

//#BEGIN NodeCallback
    %cs_RefUnref(osg::NodeCallback)
    %feature("director") osg::NodeCallback;

    %rename(Execute) osg::NodeCallback::operator ();
    %ignore osg::NodeCallback::getNestedCallback() const;

    namespace osg {
        class NodeVisitor;
    }

    %include osg/NodeCallback

    %template(NodeCallbackRef)      osg::ref_ptr<osg::NodeCallback>;
    %template(NodeCallbackObserver) osg::observer_ptr<osg::NodeCallback>;
//#END NodeCallback

//#BEGIN AnimationPath
    %cs_RefUnref(osg::AnimationPath)
    %cs_RefUnref(osg::AnimationPathCallback)

    %ignore osg::AnimationPath::getTimeControlPointMap() const;
    %ignore osg::AnimationPathCallback::getAnimationPath() const;

    %include osg/AnimationPath

    %template(AnimationPathRef)      osg::ref_ptr<osg::AnimationPath>;
    %template(AnimationPathObserver) osg::observer_ptr<osg::AnimationPath>;

    %template(DoubleControlPointMap) std::map<double,osg::AnimationPath::ControlPoint>;
//#END AnimationPath

//#BEGIN StateAttributeCallback
    %cs_RefUnref(osg::StateAttributeCallback)
    %rename(Execute) osg::StateAttributeCallback::operator ();
    %include <osg/StateAttributeCallback>
//#END StateAttributeCallback

//#BEGIN Image
    %cs_RefUnref(osg::Image)

    %ignore osg::Image::data() const;
    %ignore osg::Image::data(int,int,int) const;
    %ignore osg::Image::data(int,int) const;
    %ignore osg::Image::data(int) const;
    %ignore osg::Image::getMipmapData(unsigned int) const;
    %ignore osg::Image::getPixelBufferObject() const;
    %ignore osg::Image::DataIterator;
    %ignore osg::Image::UpdateCallback;
    %ignore osg::Image::DimensionsChangedCallback;

    %apply (unsigned char *BUFFER_PTR) { unsigned char* data };
    %include <osg/Image>
    %clear unsigned char* data;

    %template(ImageRef)      osg::ref_ptr<osg::Image>;
    %template(ImageObserver) osg::observer_ptr<osg::Image>;
//#END Image

//#BEGIN Geode
    %cs_RefUnref(osg::Geode)

    %ignore osg::Geode::getDrawable(unsigned int) const;

    %include osg/Geode

    %template(GeodeRef)      osg::ref_ptr<osg::Geode>;
    %template(GeodeObserver) osg::observer_ptr<osg::Geode>;
//#END Geode

//#BEGIN Group
    %cs_RefUnref(osg::Group)

    %ignore osg::Group::getChild(unsigned int) const;

    %include osg/Group

    %template(GroupVector) std::vector<osg::Group*>;
//#END Group

//#BEGIN ProxyNode
    %cs_RefUnref(osg::ProxyNode)

    %ignore osg::ProxyNode::getDatabaseOptions() const;
    %ignore osg::ProxyNode::getDatabaseRequest(unsigned int) const;

    %include osg/ProxyNode
//#END ProxyNode

//#BEGIN Drawable
%{
    namespace osg { typedef unsigned int AttributeType; }
%}

    %cs_RefUnref(osg::Drawable)
    %cs_RefUnref(osg::Drawable::ComputeBoundingBoxCallback)
    %cs_RefUnref(osg::Drawable::UpdateCallback)
    %cs_RefUnref(osg::Drawable::EventCallback)
    %cs_RefUnref(osg::Drawable::CullCallback)
    %cs_RefUnref(osg::Drawable::DrawCallback)

    //%feature("director") osg::Drawable;
    %feature("director") osg::Drawable::ComputeBoundingBoxCallback;
    %feature("director") osg::Drawable::UpdateCallback;
    %feature("director") osg::Drawable::EventCallback;
    %feature("director") osg::Drawable::CullCallback;
    %feature("director") osg::Drawable::DrawCallback;

    %rename(_event) osg::Drawable::EventCallback::event;

    %ignore osg::Drawable::asGeometry() const;
    %ignore osg::Drawable::getParents() const;
    %ignore osg::Drawable::getParent(unsigned int) const;
    %ignore osg::Drawable::getStateSet() const;
    %ignore osg::Drawable::getComputeBoundingBoxCallback() const;
    %ignore osg::Drawable::getShape() const;
    %ignore osg::Drawable::getUpdateCallback() const;
    %ignore osg::Drawable::getEventCallback() const;
    %ignore osg::Drawable::getCullCallback() const;
    %ignore osg::Drawable::getDrawCallback() const;

    %ignore osg::Drawable::supports(const Drawable::AttributeFunctor&) const;
    %ignore osg::Drawable::accept(Drawable::AttributeFunctor&);
    %ignore osg::Drawable::supports(const Drawable::ConstAttributeFunctor&) const;
    %ignore osg::Drawable::accept(Drawable::ConstAttributeFunctor&);
    %ignore osg::Drawable::supports(const PrimitiveFunctor&) const;
    %ignore osg::Drawable::accept(PrimitiveFunctor&);
    %ignore osg::Drawable::supports(const PrimitiveIndexFunctor&) const;
    %ignore osg::Drawable::accept(PrimitiveIndexFunctor&);
    %ignore osg::Drawable::getExtensions(unsigned int,bool);
    %ignore osg::Drawable::setExtensions(unsigned int,Drawable::Extensions*);

    %include osg/Drawable

    %template(DrawableRef)       osg::ref_ptr< osg::Drawable >;
    %template(DrawableObserver)  osg::observer_ptr< osg::Drawable >;
    %template(DrawableRefVector) std::vector< osg::ref_ptr< osg::Drawable > >;
//#END Drawable

//#BEGIN Geometry
    %cs_RefUnref(osg::Geometry)

    %ignore deprecated_osg::Geometry;

    %ignore osg::Geometry::getVertexArray() const;
    %ignore osg::Geometry::getVertexData() const;
    %ignore osg::Geometry::getNormalArray() const;
    %ignore osg::Geometry::getNormalData() const;
    %ignore osg::Geometry::getColorArray() const;
    %ignore osg::Geometry::getColorData() const;
    %ignore osg::Geometry::getSecondaryColorArray() const;
    %ignore osg::Geometry::getSecondaryColorData() const;
    %ignore osg::Geometry::getFogCoordArray() const;
    %ignore osg::Geometry::getFogCoordData() const;
    %ignore osg::Geometry::getTexCoordArray(unsigned int) const;
    %ignore osg::Geometry::getTexCoordData(unsigned int) const;
    %ignore osg::Geometry::getTexCoordArrayList() const;
    %ignore osg::Geometry::getVertexAttribArray(unsigned int) const;
    %ignore osg::Geometry::getVertexAttribData(unsigned int) const;
    %ignore osg::Geometry::getVertexAttribArrayList() const;
    %ignore osg::Geometry::getPrimitiveSetList() const;
    %ignore osg::Geometry::getPrimitiveSet(unsigned int) const;
    %ignore osg::Geometry::getVertexIndices() const;
    %ignore osg::Geometry::getNormalIndices() const;
    %ignore osg::Geometry::getColorIndices() const;
    %ignore osg::Geometry::getSecondaryColorIndices() const;
    %ignore osg::Geometry::getFogCoordIndices() const;
    %ignore osg::Geometry::getTexCoordIndices(unsigned int) const;
    %ignore osg::Geometry::getVertexAttribIndices(unsigned int) const;
    %ignore osg::Geometry::getInternalOptimizedGeometry() const;

    %include osg/Geometry

    //%template(ArrayDataVector) std::vector<osg::ArrayData>;
//#END Geometry

//#BEGIN ShapeDrawable
    %cs_RefUnref(osg::TessellationHints)
    %cs_RefUnref(osg::ShapeDrawable)

    %ignore osg::ShapeDrawable::getTessellationHints() const;
    //%ignore osg::ShapeDrawable::supports(const Drawable::AttributeFunctor&) const;
    %ignore osg::ShapeDrawable::supports(const AttributeFunctor&) const;
    %ignore osg::ShapeDrawable::supports(const Drawable::ConstAttributeFunctor&) const;
    %ignore osg::ShapeDrawable::accept(Drawable::ConstAttributeFunctor&) const;
    %ignore osg::ShapeDrawable::supports(const PrimitiveFunctor&) const;
    %ignore osg::ShapeDrawable::accept(PrimitiveFunctor& pf) const;

    %include osg/ShapeDrawable
//#END ShapeDrawable

//#BEGIN Transform
    %cs_RefUnref(osg::Transform)

    %ignore osg::Transform::asMatrixTransform() const;
    %ignore osg::Transform::asPositionAttitudeTransform() const;

    namespace osg {
        class MatrixTransform;
        class PositionAttitudeTransform;
    }

    %include osg/Transform
//#END Transform

//#BEGIN MatrixTransform
    %cs_RefUnref(osg::MatrixTransform)

    %ignore osg::MatrixTransform::asMatrixTransform() const;

    %include osg/MatrixTransform
//#END MatrixTransform

//#BEGIN CullSettings
    %cs_RefUnref(osg::ClampProjectionMatrixCallback)

    %ignore osg::CullSettings::getClampProjectionMatrixCallback() const;
    %ignore osg::CullSettings::operator =;

    %include osg/CullSettings
//#END CullSettings

//#BEGIN CullStack
    %cs_RefUnref(osg::CullStack)

    %include osg/CullStack
//#END CullStack

//#BEGIN Billboard
    %cs_RefUnref(osg::Billboard)

    %ignore osg::Billboard::getPositionList() const;

    %include osg/Billboard
//#END Billboard

//#BEGIN LOD
    %cs_RefUnref(osg::LOD)

    %include osg/LOD
//#END LOD

//#BEGIN PagedLOD
    %cs_RefUnref(osg::PagedLOD)

    %ignore osg::PagedLOD::getDatabaseOptions() const;
    %ignore osg::PagedLOD::getDatabaseRequest(unsigned int) const;
    %ignore osg::PerRangeData::operator =;

    %include osg/PagedLOD
//#END PagedLOD

//#BEGIN Switch
    %cs_RefUnref(osg::Switch)

    %include osg/Switch
//#END Switch

//#BEGIN ClearNode
    %cs_RefUnref(osg::ClearNode)

    %include <osg/ClearNode>
//#END ClearNode

//#BEGIN Projection
    %cs_RefUnref(osg::Projection)

    %include osg/Projection
//#END Projection

//#BEGIN OccluderNode
    %cs_RefUnref(osg::OccluderNode)

    %include osg/OccluderNode
//#END OccluderNode

//#BEGIN ClipNode
    %cs_RefUnref(osg::ClipNode)

    %include osg/ClipNode
//#END ClipNode

//#BEGIN OcclusionQueryNode
    %cs_RefUnref(osg::OcclusionQueryNode)

    %include osg/OcclusionQueryNode
//#END OcclusionQueryNode

//#BEGIN StateAttribute
    %cs_RefUnref(osg::StateAttribute)

    %ignore osg::StateAttribute::asTexture() const;
    %ignore osg::StateAttribute::getParent(unsigned int) const;
    %ignore osg::StateAttribute::getShaderComponent() const;
    %ignore osg::StateAttribute::getUpdateCallback() const;
    %ignore osg::StateAttribute::getEventCallback() const;
    %ignore osg::StateAttribute::operator <;
    %ignore osg::StateAttribute::operator ==;
    %ignore osg::StateAttribute::operator !=;

    %include osg/StateAttribute

    %template(StateAttributeRef)      osg::ref_ptr<osg::StateAttribute>;
    %template(StateAttributeObserver) osg::observer_ptr<osg::StateAttribute>;
    %template(StateAttributeUIntPair) std::pair< osg::ref_ptr<osg::StateAttribute>, unsigned int>;


    %template(StateAttributeTypeUIntPair)                  std::pair<osg::StateAttribute::Type, unsigned int>;
    %template(AttributeList)                     std::map< std::pair<osg::StateAttribute::Type, unsigned int>, std::pair<osg::ref_ptr<osg::StateAttribute>, unsigned int> >;
    %template(TextureAttributeList) std::vector< std::map< std::pair<osg::StateAttribute::Type, unsigned int>, std::pair<osg::ref_ptr<osg::StateAttribute>, unsigned int> > >;
//#END StateAttribute

//#BEGIN CullFace
    %cs_RefUnref(osg::CullFace)

    %include <osg/CullFace>
//#END CullFace

//#BEGIN Depth
    %cs_RefUnref(osg::Depth)

    %include <osg/Depth>
//#END Depth

//#BEGIN Stencil
    %cs_RefUnref(osg::Stencil)

    %include <osg/Stencil>
//#END Stencil

//#BEGIN StencilTwoSided
    %cs_RefUnref(osg::StencilTwoSided)

    %include <osg/StencilTwoSided>
//#END StencilTwoSided

//#BEGIN ColorMask
    %cs_RefUnref(osg::ColorMask)

    %include <osg/ColorMask>
//#END ColorMask

//#BEGIN ColorMatrix
    %cs_RefUnref(osg::ColorMatrix)

    %ignore osg::ColorMatrix::getMatrix() const;

    %include <osg/ColorMatrix>
//#END ColorMatrix

//#BEGIN Scissor
    %cs_RefUnref(osg::ColorMatrix)

    %ignore osg::Scissor::x() const;
    %ignore osg::Scissor::y() const;
    %ignore osg::Scissor::width() const;
    %ignore osg::Scissor::height() const;

    %include <osg/Scissor>
//#END Scissor

//#BEGIN Material
    %cs_RefUnref(osg::Material)

    %include <osg/Material>
//#END Material

//#BEGIN LogicOp
    %cs_RefUnref(osg::LogicOp)

    %include <osg/LogicOp>
//#END LogicOp

//#BEGIN FrontFace
    %cs_RefUnref(osg::FrontFace)

    %include <osg/FrontFace>
//#END FrontFace

//#BEGIN PolygonMode
    %cs_RefUnref(osg::PolygonMode)

    %include <osg/PolygonMode>
//#END PolygonMode

//#BEGIN LineWidth
    %cs_RefUnref(osg::LineWidth)

    %include <osg/LineWidth>
//#END LineWidth

//#BEGIN FrameBufferObject
    %cs_RefUnref(osg::FrameBufferObject)

    %include <osg/FrameBufferObject>
//#END FrameBufferObject

//#BEGIN Multisample
    %cs_RefUnref(osg::Multisample)

    %include <osg/Multisample>
//#END Multisample

//#BEGIN PolygonOffset
    %cs_RefUnref(osg::PolygonOffset)

    %include <osg/PolygonOffset>
//#END PolygonOffset

//#BEGIN PolygonStipple
    %cs_RefUnref(osg::PolygonStipple)

    %include <osg/PolygonStipple>
//#END PolygonStipple

//#BEGIN TexEnv
    %ignore osg::TexEnv::getColor() const;

    %cs_RefUnref(osg::TexEnv)

    %include <osg/TexEnv>
//#END TexEnv

//#BEGIN TexEnvCombine
    %cs_RefUnref(osg::TexEnvCombine)

    %include <osg/TexEnvCombine>
//#END TexEnvCombine

//#BEGIN TexEnvFilter
    %cs_RefUnref(osg::TexEnvFilter)

    %include <osg/TexEnvFilter>
//#END TexEnvFilter

//#BEGIN TexMat
    %cs_RefUnref(osg::TexMat)

    %ignore osg::TexMat::getMatrix() const;

    %include <osg/TexMat>
//#END TexMat

//#BEGIN TexGen
    %cs_RefUnref(osg::TexGen)

    %ignore osg::TexGen::getPlane(Coord) const;

    %include <osg/TexGen>
//#END TexGen

//#BEGIN BlendFunc
    %cs_RefUnref(osg::BlendFunc)

    %include <osg/BlendFunc>
//#END BlendFunc

//#BEGIN AlphaFunc
    %cs_RefUnref(osg::AlphaFunc)

    %include <osg/AlphaFunc>
//#END AlphaFunc

//#BEGIN Hint
    %cs_RefUnref(osg::Hint)

    %include <osg/Hint>
//#END Hint

//#BEGIN ClipPlane
    %cs_RefUnref(osg::ClipPlane)

    %include <osg/ClipPlane>
//#END ClipPlane

//#BEGIN ClampColor
    %cs_RefUnref(osg::ClampColor)

    %include <osg/ClampColor>
//#END ClampColor

//#BEGIN BufferIndexBinding
    %cs_RefUnref(osg::BufferIndexBinding)
    %cs_RefUnref(osg::UniformBufferBinding)
    %cs_RefUnref(osg::TransformFeedbackBufferBinding)

    %include <osg/BufferIndexBinding>
//#END BufferIndexBinding

//#BEGIN Point
    %cs_RefUnref(osg::Point)

    %include <osg/Point>
//#END Point

//#BEGIN PointSprite
    %cs_RefUnref(osg::PointSprite)

    %include <osg/PointSprite>
//#END PointSprite

//#BEGIN LightModel
    %cs_RefUnref(osg::LightModel)

    %include <osg/LightModel>
//#END LightModel

//#BEGIN ShadeModel
    %cs_RefUnref(osg::ShadeModel)

    %include <osg/ShadeModel>
//#END ShadeModel

//#BEGIN BlendColor
    %cs_RefUnref(osg::BlendColor)

    %include <osg/BlendColor>
//#END BlendColor

//#BEGIN BlendEquation
    %cs_RefUnref(osg::BlendEquation)

    %include <osg/BlendEquation>
//#END BlendEquation

//#BEGIN OperationThread
    %cs_RefUnref(osg::RefBlock)
    %cs_RefUnref(osg::RefBlockCount)
    %cs_RefUnref(osg::Operation)
    %cs_RefUnref(osg::OperationQueue)
    %cs_RefUnref(osg::OperationThread)

    %ignore osg::OperationThread::getParent() const;
    %ignore osg::OperationThread::getOperationQueue() const;

    %rename(Execute) osg::Operation::operator ();

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::RefBlock;
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::RefBlockCount;
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::OperationThread;

    %include osg/OperationThread

    /*%extend osg::RefBlock {
        public:
        OpenThreads::Block* asBlock() {
            return self;
        }
    }

    %extend osg::RefBlockCount {
        public:
        OpenThreads::BlockCount* asBlockCount() {
            return self;
        }
    }

    %extend osg::OperationThread {
        public:
        OpenThreads::Thread* asThread() {
            return self;
        }
    }*/

    %template(OperationRef)      osg::ref_ptr<osg::Operation>;
    %template(OperationObserver) osg::observer_ptr<osg::Operation>;
    // %template(OperationThreadSet) std::set<osg::OperationThread*>;
//#END OperationThread

//#BEGIN DisplaySettings
    %cs_RefUnref(osg::DisplaySettings)

    %include osg/DisplaySettings

    %template(DisplaySettingsRef)      osg::ref_ptr<osg::DisplaySettings>;
    %template(DisplaySettingsObserver) osg::observer_ptr<osg::DisplaySettings>;
//#END DisplaySettings

//#BEGIN GraphicsContext
%{
    namespace osg {
        typedef std::vector<osg::GraphicsContext::ScreenSettings> ScreenSettingsList;
    }
%}

    %cs_RefUnref(osg::GraphicsContext)
    %cs_RefUnref(osg::GraphicsContext::WindowingSystemInterface)
    %cs_RefUnref(osg::GraphicsContext::Traits)

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::GraphicsContext::Traits;

    %ignore osg::GraphicsContext::getState() const;
    %ignore osg::GraphicsContext::getGraphicsThread() const;
    %ignore osg::GraphicsContext::getSwapCallback() const;
    %ignore osg::GraphicsContext::getResizedCallback() const;
    %ignore osg::GraphicsContext::getCameras() const;

    %template(ContextVector)           std::vector<osg::GraphicsContext*>;
    %template(GraphicsContextRef)      osg::ref_ptr<osg::GraphicsContext>;
    %template(GraphicsContextObserver) osg::observer_ptr<osg::GraphicsContext>;

    %include osg/GraphicsContext

    %extend osg::GraphicsContext::Traits {
        public:
        ScreenIdentifier* asScreenIdentifier() {
            return self;
        }
    }
//#END GraphicsContext

//#BEGIN Camera
    namespace osg {
        class GraphicsContext;
    }

    %cs_RefUnref(osg::Camera)
    %cs_RefUnref(osg::Camera::DrawCallback)
    %feature("director") osg::Camera::DrawCallback;

    %rename(Execute) osg::Camera::DrawCallback::operator ();
   
    %ignore osg::Camera::getView() const;
    %ignore osg::Camera::getStats() const;
    %ignore osg::Camera::getDisplaySettings() const;
    %ignore osg::Camera::getColorMask();
    %ignore osg::Camera::getViewport();
    %ignore osg::Camera::getProjectionMatrix() const;
    %ignore osg::Camera::getViewMatrix() const;
    %ignore osg::Camera::getBufferAttachmentMap() const;
    %ignore osg::Camera::getCameraThread() const;
    %ignore osg::Camera::getGraphicsContext() const;
    %ignore osg::Camera::getRenderer() const;
    %ignore osg::Camera::getRenderingCache() const;
    %ignore osg::Camera::getInitialDrawCallback() const;
    %ignore osg::Camera::getPreDrawCallback() const;
    %ignore osg::Camera::getPostDrawCallback() const;
    %ignore osg::Camera::getFinalDrawCallback() const;

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::Camera;

    %include osg/Camera

    %extend osg::Camera {
        osg::CullSettings* asCullSettings() {
            return self;
        }
    }

    %template(CameraRef)      osg::ref_ptr<osg::Camera>;
    %template(CameraObserver) osg::observer_ptr<osg::Camera>;
    //%template(CameraVector)   std::vector<osg::Camera*>;
    //%template(CameraList)     std::list<osg::Camera*>;    
//#END Camera

//#BEGIN View
    %cs_RefUnref(osg::View)

    %ignore osg::View::getStats() const;
    %ignore osg::View::getLight() const;
    %ignore osg::View::getCamera() const;
    %ignore osg::View::getFrameStamp() const;
    %ignore osg::View::getSlave(unsigned int) const;

    %ignore osg::Slave::operator =;

    %include osg/View
//#END View

//#BEGIN Viewport
    %cs_RefUnref(osg::Viewport)

    %ignore osg::META_StateAttribute;
    %ignore osg::Viewport::x() const;
    %ignore osg::Viewport::y() const;
    %ignore osg::Viewport::width() const;
    %ignore osg::Viewport::height() const;

    %include osg/Viewport
//#END Viewport

//#BEGIN CameraView
    %cs_RefUnref(osg::CameraView)
    %include osg/CameraView
//#END CameraView

//#BEGIN PositionAttitudeTransform
    %cs_RefUnref(osg::PositionAttitudeTransform)
    %include osg/PositionAttitudeTransform
//#END PositionAttitudeTransform

//#BEGIN Sequence
    %cs_RefUnref(osg::Sequence)
    %include osg/Sequence
//#END Sequence

//#BEGIN Shape
    %cs_RefUnref(osg::Shape)
    %cs_RefUnref(osg::Sphere)
    %cs_RefUnref(osg::Box)
    %cs_RefUnref(osg::Cone)
    %cs_RefUnref(osg::Cylinder)
    %cs_RefUnref(osg::Capsule)
    %cs_RefUnref(osg::InfinitePlane)
    %cs_RefUnref(osg::TriangleMesh)
    %cs_RefUnref(osg::ConvexHull)
    %cs_RefUnref(osg::HeightField)
    %cs_RefUnref(osg::CompositeShape)

    %feature("director") osg::ShapeVisitor;
    %feature("director") osg::ConstShapeVisitor;

    %ignore osg::TriangleMesh::getVertices() const;
    %ignore osg::TriangleMesh::getIndices() const;
    %ignore osg::HeightField::getFloatArray() const;
    %ignore osg::HeightField::getHeightList() const;
    %ignore osg::HeightField::getHeight(unsigned int,unsigned int) const;
    %ignore osg::CompositeShape::getShape() const;
    %ignore osg::CompositeShape::getChild(unsigned int) const;

    namespace osg {
        class Sphere;
        class Box;
        class Cone;
        class Cylinder;
        class Capsule;
        class InfinitePlane;
        class TriangleMesh;
        class ConvexHull;
        class HeightField;
        class CompositeShape;
    }

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::InfinitePlane;

    %include osg/Shape

    %template(HeightFieldRef) osg::ref_ptr<osg::HeightField>;

    %extend osg::InfinitePlane {
        osg::Plane* asPlane() {
            return self;
        }
    }    
//#END Shape

//#BEGIN NodeVisitor
    %cs_RefUnref(osg::NodeVisitor)
    %cs_RefUnref(osg::NodeVisitor::DatabaseRequestHandler)
    %cs_RefUnref(osg::NodeVisitor::ImageRequestHandler)
    %feature("director") osg::NodeVisitor;
    //%feature("director") osg::NodeVisitor::DatabaseRequestHandler;
    //%feature("director") osg::NodeVisitor::ImageRequestHandler;

    %ignore osg::NodeVisitor::getUserData() const;
    %ignore osg::NodeVisitor::getNodePath() const;
    %ignore osg::NodeVisitor::getDatabaseRequestHandler() const;
    %ignore osg::NodeVisitor::getImageRequestHandler() const;

    %include osg/NodeVisitor
//#END NodeVisitor

//#BEGIN ComputeBoundsVisitor
    %cs_RefUnref(osg::ComputeBoundsVisitor)

    %include osg/ComputeBoundsVisitor
//#END ComputeBoundsVisitor

//#BEGIN PrimitiveSet
    %cs_RefUnref(osg::PrimitiveSet)
    %cs_RefUnref(osg::DrawArrays)
    %cs_RefUnref(osg::DrawArrayLengths)
    %cs_RefUnref(osg::DrawElements)
    %cs_RefUnref(osg::DrawElementsUByte)
    %cs_RefUnref(osg::DrawElementsUShort)
    %cs_RefUnref(osg::DrawElementsUInt)

    %ignore osg::PrimitiveSet::getDrawElements() const;
    %ignore osg::DrawElements::getDrawElements() const;
    %ignore osg::DrawElements::getElementBufferObject() const;

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::DrawArrayLengths;
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::DrawElementsUByte;
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::DrawElementsUShort;
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::DrawElementsUInt;

    %apply GLubyte INPUT[] { const GLubyte* ptr }
    %apply GLushort INPUT[] { const GLushort* ptr }
    %apply GLuint INPUT[] { const GLuint* ptr }
    %include osg/PrimitiveSet
    %clear const GLubyte* ptr;
    %clear const GLushort* ptr;
    %clear const GLuint* ptr;

    %extend osg::DrawArrayLengths {
        osg::MixinVector<GLint>* asMixinVector() {
            return self;
        }
    }

    %extend osg::DrawElementsUByte {
        osg::MixinVector<GLubyte>* asMixinVector() {
            return self;
        }
    }

    %extend osg::DrawElementsUShort {
        osg::MixinVector<GLushort>* asMixinVector() {
            return self;
        }
    }

    %extend osg::DrawElementsUInt {
        osg::MixinVector<GLuint>* asMixinVector() {
            return self;
        }
    }

    %template(DrawElementsVector)    std::vector<osg::DrawElements*>;
    %template(PrimitiveSetRef)       osg::ref_ptr<osg::PrimitiveSet>;
    %template(PrimitiveSetObserver)  osg::observer_ptr<osg::PrimitiveSet>;
    %template(PrimitiveSetRefVector) std::vector< osg::ref_ptr<osg::PrimitiveSet> >;
//#END PrimitiveSet

//#BEGIN StateSet
    %cs_RefUnref(osg::StateSet)
    %cs_RefUnref(osg::StateSet::Callback)
    %feature("director") osg::StateSet::Callback;

    %ignore osg::StateSet::operator <;
    %ignore osg::StateSet::operator ==;
    %ignore osg::StateSet::operator !=;
    %ignore osg::StateSet::getParents() const;
    %ignore osg::StateSet::getParent(unsigned int) const;
    %ignore osg::StateSet::getModeList() const;
    %ignore osg::StateSet::getAttribute(StateAttribute::Type type,unsigned int member = 0) const;
    %ignore osg::StateSet::getAttribute(osg::StateAttribute::Type) const;
    %ignore osg::StateSet::getAttributeList() const;
    %ignore osg::StateSet::getTextureModeList() const;
    //%ignore osg::StateSet::getTextureAttribute(unsigned int,osg::StateAttribute::Type) const;
    %ignore osg::StateSet::getTextureAttribute(unsigned int,StateAttribute::Type) const;
    %ignore osg::StateSet::getTextureAttributeList() const;
    %ignore osg::StateSet::getUniform(std::string const &) const;
    %ignore osg::StateSet::getUniformList() const;
    %ignore osg::StateSet::getUpdateCallback() const;
    %ignore osg::StateSet::getEventCallback() const;
    %rename(Execute) osg::StateSet::Callback::operator ();

    //%ignore setMode(StateAttribute::GLMode mode, StateAttribute::GLModeValue value);
    //%ignore getMode(StateAttribute::GLMode mode) const;
    %ignore setAttribute(StateAttribute *attribute, StateAttribute::OverrideValue value);
    %ignore setAttributeAndModes(StateAttribute *attribute, StateAttribute::GLModeValue value);
    //%ignore setTextureMode(unsigned int unit,StateAttribute::GLMode mode, StateAttribute::GLModeValue value);
    //%ignore getTextureMode(unsigned int unit,StateAttribute::GLMode mode) const;
    %ignore setTextureAttribute(unsigned int unit,StateAttribute *attribute, StateAttribute::OverrideValue value);
    %ignore setTextureAttributeAndModes(unsigned int unit,StateAttribute *attribute, StateAttribute::GLModeValue value);
    %ignore addUniform(Uniform* uniform, StateAttribute::OverrideValue value);
    %ignore setAssociatedModes(const StateAttribute* attribute, StateAttribute::GLModeValue value);
    %ignore setAssociatedTextureModes(unsigned int unit,const StateAttribute* attribute, StateAttribute::GLModeValue value);

    %include osg/StateSet

    //%template(RefAttributePair) std::pair< osg::ref_ptr<osg::StateAttribute>, osg::StateAttribute::OverrideValue >;
    //%template(AttributeList) std::map< osg::StateAttribute::TypeMemberPair, osg::RefAttributePair >;
    //%template(TextureAttributeList) std::vector< osg::AttributeList >;

    //%template(ModeList)                     std::map< osg::StateAttribute::GLMode, osg::StateAttribute::GLModeValue >;
    //%template(TextureModeList) std::vector< std::map< osg::StateAttribute::GLMode, osg::StateAttribute::GLModeValue > >;

    %template(RefUniformPair)                     std::pair< osg::ref_ptr<osg::Uniform>, osg::StateAttribute::OverrideValue >;
    %template(UniformList) std::map< std::string, std::pair< osg::ref_ptr<osg::Uniform>, osg::StateAttribute::OverrideValue > >;

    %template(StateSetVector) std::vector< osg::StateSet* >;
    %template(StateSetConstVector) std::vector< osg::StateSet const* >;

    %extend osg::StateSet {
    public:
        /*void setMode(StateAttribute::GLMode mode, StateAttribute::Values value) {
            self->setMode(mode, (StateAttribute::GLModeValue)value);
        }
        StateAttribute::Values getMode(StateAttribute::GLMode mode) const {
            return (StateAttribute::GLModeValue)self->getMode(mode);
        }*/
        void setAttribute(StateAttribute *attribute, StateAttribute::Values value) {
            self->setAttribute(attribute, (StateAttribute::OverrideValue)value);
        }
        void setAttributeAndModes(StateAttribute *attribute, StateAttribute::Values value) {
            self->setAttributeAndModes(attribute, (StateAttribute::GLModeValue)value);
        }
        //void setTextureMode(unsigned int unit,StateAttribute::GLMode mode, StateAttribute::Values value) {
        //    self->setTextureMode(unit, mode, (StateAttribute::GLModeValue)value);
        //}
        //StateAttribute::Values getTextureMode(unsigned int unit,StateAttribute::GLMode mode) const {
        //    return (StateAttribute::GLModeValue)self->getTextureMode(unit, mode);
        //}
        void setTextureAttribute(unsigned int unit,StateAttribute *attribute, StateAttribute::Values value) {
            self->setTextureAttribute(unit, attribute, (StateAttribute::OverrideValue)value);
        }
        void setTextureAttributeAndModes(unsigned int unit,StateAttribute *attribute, StateAttribute::Values value) {
            self->setTextureAttributeAndModes(unit, attribute, (StateAttribute::GLModeValue)value);
        }
        void addUniform(Uniform* uniform, StateAttribute::Values value) {
            self->addUniform(uniform, (StateAttribute::OverrideValue)value);
        }
        void setAssociatedModes(const StateAttribute* attribute, StateAttribute::Values value) {
            self->setAssociatedModes(attribute, (StateAttribute::GLModeValue)value);
        }
        void setAssociatedTextureModes(unsigned int unit,const StateAttribute* attribute, StateAttribute::Values value) {
            self->setAssociatedTextureModes(unit, attribute, (StateAttribute::GLModeValue)value);
        }
    }
//#END StateSet

//#BEGIN Light
    %cs_RefUnref(osg::Light)

    %include osg/Light
//#END Light

//#BEGIN LightSource
    %cs_RefUnref(osg::LightSource)

    %ignore osg::LightSource::getLight() const;

    %include osg/LightSource
//#END LightSource

//#BEGIN Texture
    %cs_RefUnref(osg::Texture)
    %cs_RefUnref(osg::Texture::TextureObject)
    %cs_RefUnref(osg::Texture::TextureObjectSet)
    %cs_RefUnref(osg::Texture::TextureObjectManager)

    %ignore osg::Texture::TextureObjectManager::getNumberActiveTextureObjects() const;
    %ignore osg::Texture::TextureObjectManager::getNumberOrphanedTextureObjects() const;
    %ignore osg::Texture::TextureObjectManager::getCurrTexturePoolSize() const;

    %ignore osg::Texture::getImage(unsigned int) const;
    %ignore osg::Texture::getReadPBuffer() const;

    %ignore osg::Texture::TextureProfile::operator <;
    %ignore osg::Texture::TextureProfile::operator ==;

    %include osg/Texture

    %template(TextureRef)                   osg::ref_ptr<osg::Texture>;
    %template(TextureObserver)              osg::observer_ptr<osg::Texture>;
    %template(TextureObjectManagerRef)      osg::ref_ptr<osg::Texture::TextureObjectManager>;
    %template(TextureObjectManagerObserver) osg::observer_ptr<osg::Texture::TextureObjectManager>;
//#END Texture

//#BEGIN Texture1D
    %cs_RefUnref(osg::Texture1D)
    %cs_RefUnref(osg::Texture1D::SubloadCallback)
    %feature("director") osg::Texture1D::SubloadCallback;

    %ignore osg::Texture1D::getImage() const;
    %ignore osg::Texture1D::getSubloadCallback() const;

    %include <osg/Texture1D>

    %extend osg::Texture1D::SubloadCallback {
    public:
        SubloadCallback() {
            return NULL;
        }
    }
//#END Texture1D

//#BEGIN Texture2D
    %cs_RefUnref(osg::Texture2D)
    %cs_RefUnref(osg::Texture2D::SubloadCallback)
    %feature("director") osg::Texture2D::SubloadCallback;

    %ignore osg::Texture2D::getImage() const;
    %ignore osg::Texture2D::getSubloadCallback() const;

    %include <osg/Texture2D>

    %extend osg::Texture2D::SubloadCallback {
    public:
        SubloadCallback() {
            return NULL;
        }
    }
//#END Texture2D

//#BEGIN Texture2DArray
    %cs_RefUnref(osg::Texture2DArray)

    %ignore osg::Texture2DArray::getSubloadCallback() const;
    %ignore osg::Texture2DArray::getExtensions(unsigned int contextID,bool createIfNotInitalized);
    %ignore osg::Texture2DArray::setExtensions(unsigned int contextID,Extensions* extensions);

    %typemap(csclassmodifiers) osg::Texture2DArray::Extensions "public new partial class"

    %include <osg/Texture2DArray>
//#END Texture2DArray


//#BEGIN Texture2DMultisample
    %cs_RefUnref(osg::Texture2DMultisample)

    %include <osg/Texture2DMultisample>
//#END Texture2DMultisample

//#BEGIN Texture3D
    %cs_RefUnref(osg::Texture3D)

    %ignore osg::Texture3D::getImage() const;
    %ignore osg::Texture3D::getSubloadCallback() const;
    %ignore osg::Texture3D::getExtensions(unsigned int contextID,bool createIfNotInitalized);
    %ignore osg::Texture3D::setExtensions(unsigned int contextID,Extensions* extensions);

    %typemap(csclassmodifiers) osg::Texture3D::Extensions "public new partial class"

    %include <osg/Texture3D>
//#END Texture3D

//#BEGIN TextureCubeMap
    %cs_RefUnref(osg::TextureCubeMap)

    %ignore osg::TextureCubeMap::getSubloadCallback() const;
    %ignore osg::TextureCubeMap::getExtensions(unsigned int contextID,bool createIfNotInitalized);
    %ignore osg::TextureCubeMap::setExtensions(unsigned int contextID,Extensions* extensions);

    %typemap(csclassmodifiers) osg::TextureCubeMap::Extensions "public new partial class"

    %include <osg/TextureCubeMap>
//#END TextureCubeMap

//#BEGIN TextureRectangle
    %cs_RefUnref(osg::TextureRectangle)

    %ignore osg::TextureRectangle::getImage() const;
    %ignore osg::TextureRectangle::getSubloadCallback() const;

    %include <osg/TextureRectangle>
//#END TextureRectangle

//#BEGIN TexGenNode
    %cs_RefUnref(osg::TexGenNode)

    %ignore osg::TexGenNode::getTexGen() const;

    %include <osg/TexGenNode>
//#END TexGenNode

//#BEGIN State
    %cs_RefUnref(osg::State)

    %ignore osg::State::getGraphicsContext() const;
    %ignore osg::State::getShaderComposer() const;
    %ignore osg::State::getFrameStamp() const;
    %ignore osg::State::getGraphicsCostEstimator() const;

    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osg::State;

    %include osg/State

    %extend osg::State {
        osg::Observer* asObserver() {
            return self;
        }
    }
//#END State

//#BEGIN CoordinateSystemNode
    %cs_RefUnref(osg::EllipsoidModel)
    %cs_RefUnref(osg::CoordinateSystemNode)

    %ignore osg::EllipsoidModel::operator ==;
    %ignore osg::CoordinateSystemNode::getEllipsoidModel() const;

    %include <osg/CoordinateSystemNode>
//#END CoordinateSystemNode

//#BEGIN TransferFunction
    %cs_RefUnref(osg::TransferFunction)
    %cs_RefUnref(osg::TransferFunction1D)
    %include <osg/TransferFunction>
//#END TransferFunction



//#BEGIN Shader
    %cs_RefUnref(osg::ShaderBinary)
    %cs_RefUnref(osg::Shader)
    %cs_RefUnref(osg::Shader::PerContextShader)
    %cs_RefUnref(osg::ShaderComponent)
    %include <osg/Shader>
//#END Shader

//#BEGIN ShaderAttribute
    %cs_RefUnref(osg::ShaderAttribute)
    %include <osg/ShaderAttribute>
//#END ShaderAttribute

//#BEGIN ShaderComposer
    %cs_RefUnref(osg::ShaderComposer)
    %include <osg/ShaderComposer>
//#END ShaderComposer

//#BEGIN Program
    %cs_RefUnref(osg::Program)
    %cs_RefUnref(osg::Program::ProgramBinary)
    %cs_RefUnref(osg::Program::ProgramBinary)
    %cs_RefUnref(osg::Program::PerContextProgram)
    %include <osg/Program>
//#END Program


//#BEGIN MoveWithEyePointTransform
    %cs_RefUnref(osg::MoveWithEyePointTransform)
    %cs_RefUnref(osg::SkyDome)

    %ignore osg::DoNotIncludeInNearFarComputationCallback;
    %ignore osg::OverrideNearFarValuesCallback;
    %ignore osg::AddCallbackToDrawablesVisitor;    

    %include <MoveWithEyePointTransform.h>
//#END MoveWithEyePointTransform

// typedef std::vector<OpenThreads::Thread*> Threads;
// typedef std::vector<osg::OperationThread*> OperationThreads;

//#BEGIN CalculateBoundingBox
    %import CalculateBoundingBox.h

    %extend osg::Node {
        osg::BoundingBox getBoundBox() {
            CalculateBoundingBox visitor;
            // NOTA: no compila 'visitor.apply(*self);'
            (dynamic_cast<osg::NodeVisitor*>(&visitor))->apply(*self);
            return visitor.getBoundBox();
        }
    }
//#END CalculateBoundingBox

//#BEGIN LODEx
    %cs_RefUnref(osg::LODEx)
    %cs_RefUnref(osg::LODEx::LODCallback)
    %feature("director") osg::LODEx::LODCallback;
    %include LODEx.h
//#END LODEx

//#BEGIN CastUtils
    %include CastUtils.h
//#END CastUtils


#endif
