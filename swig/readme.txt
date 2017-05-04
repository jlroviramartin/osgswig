Fichero osg.i

// -----------  MixinVector Helper section ------------------------------------
%{
template <class ValueT>
struct MixinVectorAccessor {
    virtual ~MixinVectorAccessor();
    std::vector<ValueT> vec;
};
%}

%inline %{
template<class ValueT> std::vector<ValueT> *asVectorTemplate(osg::MixinVector<ValueT> *base){return &(((MixinVectorAccessor<ValueT> *)base)->vec);}
std::vector<GLubyte>  *asVector(osg::DrawElementsUByte  *base){return asVectorTemplate(base);}
std::vector<GLushort> *asVector(osg::DrawElementsUShort *base){return asVectorTemplate(base);}
std::vector<GLuint>   *asVector(osg::DrawElementsUInt   *base){return asVectorTemplate(base);}
%}

%template(asVector)         asVectorTemplate<GLshort>;
%template(asVector)         asVectorTemplate<GLint>;
%template(asVector)         asVectorTemplate<GLubyte>;
%template(asVector)         asVectorTemplate<GLushort>;
%template(asVector)         asVectorTemplate<GLuint>;
%template(asVector)         asVectorTemplate<GLfloat>;
%template(asVector) asVectorTemplate<GLdouble>;

%template(asVector)     asVectorTemplate<osg::Vec2f>;
%template(asVector)     asVectorTemplate<osg::Vec3f>;
%template(asVector)     asVectorTemplate<osg::Vec4f>;
%template(asVector)     asVectorTemplate<osg::Vec2d>;
%template(asVector)     asVectorTemplate<osg::Vec3d>;
%template(asVector)     asVectorTemplate<osg::Vec4d>;

// This part extends every MixinVector type with some methods to directly access the underlying std::vectors

//The following macros expands to a manual definition for one templated type, e.g.
//%extend osg::TemplateArray<osg::Vec4,osg::Array::Vec4ArrayType,4,GL_FLOAT> {
//	std::vector<Vec4f>* asVector() {return asVectorTemplate(dynamic_cast<osg::MixinVector<Vec4f>*>(self));}
//};
%define MIXINVECTORHELPER( dataName, dataType, dataElements, dataSize)
%extend osg::TemplateArray<##dataName, ##dataType, ##dataElements, ##dataSize>
{
    std::vector<##dataName>* asVector() { return asVectorTemplate(dynamic_cast<osg::MixinVector<##dataName>*>(self)); }
    void push_back(##dataName el) { dynamic_cast<osg::MixinVector<##dataName>*>(self)->push_back(el); }
    int size() { return dynamic_cast<osg::MixinVector<##dataName>*>(self)->size(); }
};
%enddef

%define MIXINVECTORINDEXEDHELPER( dataName, dataType, dataElements, dataSize)
%extend osg::TemplateIndexArray<##dataName, ##dataType, ##dataElements, ##dataSize>
{
    std::vector<##dataName>* asVector() { return asVectorTemplate(dynamic_cast<osg::MixinVector<##dataName>*>(self)); }
    void push_back(##dataName el) { dynamic_cast<osg::MixinVector<##dataName>*>(self)->push_back(el); }
    int size() { return dynamic_cast<osg::MixinVector<##dataName>*>(self)->size(); }
};
%enddef

%define DRAWELEMENTSHELPER( className, dataName)
%extend osg::##className
{
    std::vector<##dataName>* asVector() { return asVectorTemplate(dynamic_cast<osg::MixinVector<##dataName>*>(self)); }
    void push_back(##dataName el) { dynamic_cast<osg::MixinVector<##dataName>*>(self)->push_back(el); }
    int size() { return dynamic_cast<osg::MixinVector<##dataName>*>(self)->size(); }
};
%enddef

MIXINVECTORINDEXEDHELPER ( GLbyte    , osg::Array::ByteArrayType   ,1, GL_BYTE);
MIXINVECTORINDEXEDHELPER ( GLshort   , osg::Array::ShortArrayType  ,1, GL_SHORT);
MIXINVECTORINDEXEDHELPER ( GLint     , osg::Array::IntArrayType    ,1, GL_INT);
MIXINVECTORINDEXEDHELPER ( GLubyte   , osg::Array::UByteArrayType  ,1, GL_UNSIGNED_BYTE);
MIXINVECTORINDEXEDHELPER ( GLushort  , osg::Array::UShortArrayType ,1, GL_UNSIGNED_SHORT);
MIXINVECTORINDEXEDHELPER ( GLuint    , osg::Array::UIntArrayType   ,1, GL_UNSIGNED_INT);

MIXINVECTORHELPER ( osg::Vec2 , osg::Array::Vec2ArrayType   ,2, GL_FLOAT);
MIXINVECTORHELPER ( osg::Vec3 , osg::Array::Vec3ArrayType   ,3, GL_FLOAT);
MIXINVECTORHELPER ( osg::Vec4 , osg::Array::Vec4ArrayType   ,4, GL_FLOAT);
MIXINVECTORHELPER ( osg::Vec2d, osg::Array::Vec2dArrayType  ,2, GL_DOUBLE);
MIXINVECTORHELPER ( osg::Vec3d, osg::Array::Vec3dArrayType  ,3, GL_DOUBLE);
MIXINVECTORHELPER ( osg::Vec4d, osg::Array::Vec4dArrayType  ,4, GL_DOUBLE);

MIXINVECTORHELPER ( float,      osg::Array::FloatArrayType  ,1, GL_FLOAT);
MIXINVECTORHELPER ( double,     osg::Array::DoubleArrayType ,1, GL_DOUBLE);

// -----------  MixinVector Helper section ------------------------------------





    namespace osg {

        /*%template(ByteMixinVector) MixinVector<GLbyte>;
        %template(ShortMixinVector) MixinVector<GLshort>;
        %template(IntMixinVector) MixinVector<GLint>;
        %template(UByteMixinVector) MixinVector<GLubyte>;
        %template(UShortMixinVector) MixinVector<GLushort>;
        %template(UIntMixinVector) MixinVector<GLuint>;

        %template(FloatMixinVector) MixinVector<GLfloat>;
        %template(DoubleMixinVector) MixinVector<GLdouble>;

        %template(Vec2bMixinVector) MixinVector<Vec2b>;
        %template(Vec3bMixinVector) MixinVector<Vec3b>;
        %template(Vec4bMixinVector) MixinVector<Vec4b>;
        %template(Vec4ubMixinVector) MixinVector<Vec4ub>;
        %template(Vec2sMixinVector) MixinVector<Vec2s>;
        %template(Vec3sMixinVector) MixinVector<Vec3s>;
        %template(Vec4sMixinVector) MixinVector<Vec4s>;
        %template(Vec2MixinVector) MixinVector<Vec2>;
        %template(Vec3MixinVector) MixinVector<Vec3>;
        %template(Vec4MixinVector) MixinVector<Vec4>;
        %template(Vec2dMixinVector) MixinVector<Vec2d>;
        %template(Vec3dMixinVector) MixinVector<Vec3d>;
        %template(Vec4dMixinVector) MixinVector<Vec4d>;

        %template(MatrixfMixinVector) MixinVector<Matrixf>;*/

        // ----- TemplateIndexArray -----

        /*%template(ByteArray) TemplateIndexArray<GLbyte,Array::ByteArrayType,1,GL_BYTE>;
        %template(ShortArray) TemplateIndexArray<GLshort,Array::ShortArrayType,1,GL_SHORT>;
        %template(IntArray) TemplateIndexArray<GLint,Array::IntArrayType,1,GL_INT>;
        %template(UByteArray) TemplateIndexArray<GLubyte,Array::UByteArrayType,1,GL_UNSIGNED_BYTE>;
        %template(UShortArray) TemplateIndexArray<GLushort,Array::UShortArrayType,1,GL_UNSIGNED_SHORT>;
        %template(UIntArray) TemplateIndexArray<GLuint,Array::UIntArrayType,1,GL_UNSIGNED_INT>;

        // ----- TemplateArray -----

        %template(FloatArray) TemplateArray<GLfloat,Array::FloatArrayType,1,GL_FLOAT>;
        %template(DoubleArray) TemplateArray<GLdouble,Array::DoubleArrayType,1,GL_DOUBLE>;

        %template(Vec2bArray) TemplateArray<Vec2b,Array::Vec2bArrayType,2,GL_BYTE>;
        %template(Vec3bArray) TemplateArray<Vec3b,Array::Vec3bArrayType,3,GL_BYTE>;
        %template(Vec4bArray) TemplateArray<Vec4b,Array::Vec4bArrayType,4,GL_BYTE>;
        %template(Vec4ubArray) TemplateArray<Vec4ub,Array::Vec4ubArrayType,4,GL_UNSIGNED_BYTE>;
        %template(Vec2sArray) TemplateArray<Vec2s,Array::Vec2sArrayType,2,GL_SHORT>;
        %template(Vec3sArray) TemplateArray<Vec3s,Array::Vec3sArrayType,3,GL_SHORT>;
        %template(Vec4sArray) TemplateArray<Vec4s,Array::Vec4sArrayType,4,GL_SHORT>;
        %template(Vec2Array) TemplateArray<Vec2,Array::Vec2ArrayType,2,GL_FLOAT>;
        %template(Vec3Array) TemplateArray<Vec3,Array::Vec3ArrayType,3,GL_FLOAT>;
        %template(Vec4Array) TemplateArray<Vec4,Array::Vec4ArrayType,4,GL_FLOAT>;
        %template(Vec2dArray) TemplateArray<Vec2d,Array::Vec2dArrayType,2,GL_DOUBLE>;
        %template(Vec3dArray) TemplateArray<Vec3d,Array::Vec3dArrayType,3,GL_DOUBLE>;
        %template(Vec4dArray) TemplateArray<Vec4d,Array::Vec4dArrayType,4,GL_DOUBLE>;

        %template(MatrixfArray) TemplateArray<Matrixf,Array::MatrixArrayType,16,GL_FLOAT>;*/
    }
