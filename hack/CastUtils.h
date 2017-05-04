#ifndef CAST_UTILS
#define CAST_UTILS 1

#include <osg/Object>

#include <osg/StateAttribute>
#include <osg/AlphaFunc>
#include <osg/BlendColor>
#include <osg/BlendEquation>
#include <osg/BlendFunc>

#include <osg/BufferIndexBinding>
//#include <osg/AtomicCounterBufferBinding>
//#include <osg/TransformFeedbackBufferBinding>
//#include <osg/UniformBufferBinding>

#include <osg/ClampColor>
#include <osg/ClipPlane>
#include <osg/ColorMask>
#include <osg/ColorMatrix>
#include <osg/CullFace>
#include <osg/Depth>
#include <osg/Fog>
#include <osg/FragmentProgram>
#include <osg/FrameBufferObject>
#include <osg/FrontFace>
#include <osg/Hint>
#include <osg/Light>
#include <osg/LightModel>
#include <osg/LineStipple>
#include <osg/LineWidth>
#include <osg/LogicOp>
#include <osg/Material>
#include <osg/Multisample>
#include <osg/PatchParameter>
#include <osg/Point>
#include <osg/PointSprite>
#include <osg/PolygonMode>
#include <osg/PolygonOffset>
#include <osg/PolygonStipple>
#include <osg/PrimitiveRestartIndex>
#include <osg/Program>
#include <osg/SampleMaski>
#include <osg/Scissor>
#include <osg/ShadeModel>
#include <osg/ShaderAttribute>
#include <osg/Stencil>
#include <osg/StencilTwoSided>
#include <osg/TexEnv>
#include <osg/TexEnvCombine>
#include <osg/TexEnvFilter>
#include <osg/TexGen>
#include <osg/TexMat>

#include <osg/Texture>
#include <osg/Texture1D>
#include <osg/Texture2D>
#include <osg/Texture2DArray>
#include <osg/Texture2DMultisample>
#include <osg/Texture3D>
#include <osg/TextureBuffer>
#include <osg/TextureCubeMap>
#include <osg/TextureRectangle>

#include <osg/VertexProgram>
#include <osg/Viewport>
#include <osgFX/Validator>

#include <osg/Drawable>
#include <osg/DrawPixels>
#include <osg/Geometry>
#include <osg/ShapeDrawable>
//#include <osg/QueryGeometry>
//#include <osgUtil/DelaunayConstraint>
#include <osgText/TextBase>
#include <osgText/Text>
#include <osgText/FadeText>
#include <osgText/Text3D>

#include <osg/Node>
#include <osg/Geode>
#include <osg/Billboard>
#include <osg/Group>
#include <osg/ClearNode>
#include <osg/ClipNode>
#include <osg/CoordinateSystemNode>
#include <osgTerrain/Terrain>
#include <osg/LightSource>
#include <osg/LOD>
#include <osg/PagedLOD>
#include <osg/OccluderNode>
#include <osg/OcclusionQueryNode>
#include <osg/Projection>
#include <osg/ProxyNode>
#include <osg/Sequence>
#include <osg/Switch>
#include <osg/TexGenNode>
#include <osg/Transform>
#include <osg/AutoTransform>
#include <osg/Camera>
#include <osg/CameraView>
#include <osg/MatrixTransform>
#include <osg/PositionAttitudeTransform>
#include <osgTerrain/TerrainTile>

namespace osg {

    class /*OSG_EXPORT*/ CastUtils
    {
    public:
        static osg::StateAttribute* toStateAttribute(osg::Object* st) {
            return dynamic_cast<osg::StateAttribute*>(st);
        }

        static osg::AlphaFunc* toAlphaFunc(osg::Object* st) {
            return dynamic_cast<osg::AlphaFunc*>(st);
        }
        static osg::BlendColor* toBlendColor(osg::Object* st) {
            return dynamic_cast<osg::BlendColor*>(st);
        }
        static osg::BlendEquation* toBlendEquation(osg::Object* st) {
            return dynamic_cast<osg::BlendEquation*>(st);
        }
        static osg::BlendFunc* toBlendFunc(osg::Object* st) {
            return dynamic_cast<osg::BlendFunc*>(st);
        }

        static osg::BufferIndexBinding* toBufferIndexBinding(osg::Object* st) {
            return dynamic_cast<osg::BufferIndexBinding*>(st);
        }
        /*static osg::AtomicCounterBufferBinding* toAtomicCounterBufferBinding(osg::Object* st) {
            return dynamic_cast<osg::AtomicCounterBufferBinding*>(st);
        }
        static osg::TransformFeedbackBufferBinding* toTransformFeedbackBufferBinding(osg::Object* st) {
            return dynamic_cast<osg::TransformFeedbackBufferBinding*>(st);
        }
        static osg::UniformBufferBinding* toUniformBufferBinding(osg::Object* st) {
            return dynamic_cast<osg::UniformBufferBinding*>(st);
        }*/

        static osg::ClampColor* toClampColor(osg::Object* st) {
            return dynamic_cast<osg::ClampColor*>(st);
        }
        static osg::ClipPlane* toClipPlane(osg::Object* st) {
            return dynamic_cast<osg::ClipPlane*>(st);
        }
        static osg::ColorMask* toColorMask(osg::Object* st) {
            return dynamic_cast<osg::ColorMask*>(st);
        }
        static osg::ColorMatrix* toColorMatrix(osg::Object* st) {
            return dynamic_cast<osg::ColorMatrix*>(st);
        }
        static osg::CullFace* toCullFace(osg::Object* st) {
            return dynamic_cast<osg::CullFace*>(st);
        }
        static osg::Depth* toDepth(osg::Object* st) {
            return dynamic_cast<osg::Depth*>(st);
        }
        static osg::Fog* toFog(osg::Object* st) {
            return dynamic_cast<osg::Fog*>(st);
        }
        static osg::FragmentProgram* toFragmentProgram(osg::Object* st) {
            return dynamic_cast<osg::FragmentProgram*>(st);
        }
        static osg::FrameBufferObject* toFrameBufferObject(osg::Object* st) {
            return dynamic_cast<osg::FrameBufferObject*>(st);
        }
        static osg::FrontFace* toFrontFace(osg::Object* st) {
            return dynamic_cast<osg::FrontFace*>(st);
        }
        static osg::Hint* toHint(osg::Object* st) {
            return dynamic_cast<osg::Hint*>(st);
        }
        static osg::Light* toLight(osg::Object* st) {
            return dynamic_cast<osg::Light*>(st);
        }
        static osg::LightModel* toLightModel(osg::Object* st) {
            return dynamic_cast<osg::LightModel*>(st);
        }
        static osg::LineStipple* toLineStipple(osg::Object* st) {
            return dynamic_cast<osg::LineStipple*>(st);
        }
        static osg::LineWidth* toLineWidth(osg::Object* st) {
            return dynamic_cast<osg::LineWidth*>(st);
        }
        static osg::LogicOp* toLogicOp(osg::Object* st) {
            return dynamic_cast<osg::LogicOp*>(st);
        }
        static osg::Material* toMaterial(osg::Object* st) {
            return dynamic_cast<osg::Material*>(st);
        }
        static osg::Multisample* toMultisample(osg::Object* st) {
            return dynamic_cast<osg::Multisample*>(st);
        }
        static osg::PatchParameter* toPatchParameter(osg::Object* st) {
            return dynamic_cast<osg::PatchParameter*>(st);
        }
        static osg::Point* toPoint(osg::Object* st) {
            return dynamic_cast<osg::Point*>(st);
        }
        static osg::PointSprite* toPointSprite(osg::Object* st) {
            return dynamic_cast<osg::PointSprite*>(st);
        }
        static osg::PolygonMode* toPolygonMode(osg::Object* st) {
            return dynamic_cast<osg::PolygonMode*>(st);
        }
        static osg::PolygonOffset* toPolygonOffset(osg::Object* st) {
            return dynamic_cast<osg::PolygonOffset*>(st);
        }
        static osg::PolygonStipple* toPolygonStipple(osg::Object* st) {
            return dynamic_cast<osg::PolygonStipple*>(st);
        }
        static osg::PrimitiveRestartIndex* toPrimitiveRestartIndex(osg::Object* st) {
            return dynamic_cast<osg::PrimitiveRestartIndex*>(st);
        }
        static osg::Program* toProgram(osg::Object* st) {
            return dynamic_cast<osg::Program*>(st);
        }
        static osg::SampleMaski* toSampleMaski(osg::Object* st) {
            return dynamic_cast<osg::SampleMaski*>(st);
        }
        static osg::Scissor* toScissor(osg::Object* st) {
            return dynamic_cast<osg::Scissor*>(st);
        }
        static osg::ShadeModel* toShadeModel(osg::Object* st) {
            return dynamic_cast<osg::ShadeModel*>(st);
        }
        static osg::ShaderAttribute* toShaderAttribute(osg::Object* st) {
            return dynamic_cast<osg::ShaderAttribute*>(st);
        }
        static osg::Stencil* toStencil(osg::Object* st) {
            return dynamic_cast<osg::Stencil*>(st);
        }
        static osg::StencilTwoSided* toStencilTwoSided(osg::Object* st) {
            return dynamic_cast<osg::StencilTwoSided*>(st);
        }
        static osg::TexEnv* toTexEnv(osg::Object* st) {
            return dynamic_cast<osg::TexEnv*>(st);
        }
        static osg::TexEnvCombine* toTexEnvCombine(osg::Object* st) {
            return dynamic_cast<osg::TexEnvCombine*>(st);
        }
        static osg::TexEnvFilter* toTexEnvFilter(osg::Object* st) {
            return dynamic_cast<osg::TexEnvFilter*>(st);
        }
        static osg::TexGen* toTexGen(osg::Object* st) {
            return dynamic_cast<osg::TexGen*>(st);
        }
        static osg::TexMat* toTexMat(osg::Object* st) {
            return dynamic_cast<osg::TexMat*>(st);
        }

        static osg::Texture* toTexture(osg::Object* st) {
            return dynamic_cast<osg::Texture*>(st);
        }
        static osg::Texture1D* toTexture1D(osg::Object* st) {
            return dynamic_cast<osg::Texture1D*>(st);
        }
        static osg::Texture2D* toTexture2D(osg::Object* st) {
            return dynamic_cast<osg::Texture2D*>(st);
        }
        static osg::Texture2DMultisample* toTexture2DMultisample(osg::Object* st) {
            return dynamic_cast<osg::Texture2DMultisample*>(st);
        }
        static osg::Texture3D* toTexture3D(osg::Object* st) {
            return dynamic_cast<osg::Texture3D*>(st);
        }
        static osg::TextureBuffer* toTextureBuffer(osg::Object* st) {
            return dynamic_cast<osg::TextureBuffer*>(st);
        }
        static osg::TextureCubeMap* toTextureCubeMap(osg::Object* st) {
            return dynamic_cast<osg::TextureCubeMap*>(st);
        }
        static osg::TextureRectangle* toTextureRectangle(osg::Object* st) {
            return dynamic_cast<osg::TextureRectangle*>(st);
        }

        static osg::VertexProgram* toVertexProgram(osg::Object* st) {
            return dynamic_cast<osg::VertexProgram*>(st);
        }
        static osg::Viewport* toViewport(osg::Object* st) {
            return dynamic_cast<osg::Viewport*>(st);
        }
        static osgFX::Validator* toValidator(osg::Object* st) {
            return dynamic_cast<osgFX::Validator*>(st);
        }


        static osg::Drawable* toDrawable(osg::Object* st) {
            return dynamic_cast<osg::Drawable*>(st);
        }
        static osg::DrawPixels* toDrawPixels(osg::Object* st) {
            return dynamic_cast<osg::DrawPixels*>(st);
        }
        static osg::Geometry* toGeometry(osg::Object* st) {
            return dynamic_cast<osg::Geometry*>(st);
        }
        static osg::ShapeDrawable* toShapeDrawable(osg::Object* st) {
            return dynamic_cast<osg::ShapeDrawable*>(st);
        }
        //static osg::QueryGeometry* toQueryGeometry(osg::Object* st) {
        //    return dynamic_cast<osg::QueryGeometry*>(st);
        //}
        //static osgUtil::DelaunayConstraint* toDelaunayConstraint(osg::Object* st) {
        //    return dynamic_cast<osgUtil::DelaunayConstraint*>(st);
        //}

        static osgText::TextBase* toTextBase(osg::Object* st) {
            return dynamic_cast<osgText::TextBase*>(st);
        }
        static osgText::Text* toText(osg::Object* st) {
            return dynamic_cast<osgText::Text*>(st);
        }
        static osgText::FadeText* toFadeText(osg::Object* st) {
            return dynamic_cast<osgText::FadeText*>(st);
        }
        static osgText::Text3D* toText3D(osg::Object* st) {
            return dynamic_cast<osgText::Text3D*>(st);
        }


        static osg::Node* toNode(osg::Object* st) {
            return dynamic_cast<osg::Node*>(st);
        }
        static osg::Geode* toGeode(osg::Object* st) {
            return dynamic_cast<osg::Geode*>(st);
        }
        static osg::Billboard* toBillboard(osg::Object* st) {
            return dynamic_cast<osg::Billboard*>(st);
        }
        static osg::Group* toGroup(osg::Object* st) {
            return dynamic_cast<osg::Group*>(st);
        }
        static osg::ClearNode* toClearNode(osg::Object* st) {
            return dynamic_cast<osg::ClearNode*>(st);
        }
        static osg::ClipNode* toClipNode(osg::Object* st) {
            return dynamic_cast<osg::ClipNode*>(st);
        }
        static osg::CoordinateSystemNode* toCoordinateSystemNode(osg::Object* st) {
            return dynamic_cast<osg::CoordinateSystemNode*>(st);
        }
        static osgTerrain::Terrain* toTerrain(osg::Object* st) {
            return dynamic_cast<osgTerrain::Terrain*>(st);
        }
        static osg::LightSource* toLightSource(osg::Object* st) {
            return dynamic_cast<osg::LightSource*>(st);
        }
        static osg::LOD* toLOD(osg::Object* st) {
            return dynamic_cast<osg::LOD*>(st);
        }
        static osg::PagedLOD* toPagedLOD(osg::Object* st) {
            return dynamic_cast<osg::PagedLOD*>(st);
        }
        static osg::OccluderNode* toOccluderNode(osg::Object* st) {
            return dynamic_cast<osg::OccluderNode*>(st);
        }
        static osg::OcclusionQueryNode* toOcclusionQueryNode(osg::Object* st) {
            return dynamic_cast<osg::OcclusionQueryNode*>(st);
        }
        static osg::Projection* toProjection(osg::Object* st) {
            return dynamic_cast<osg::Projection*>(st);
        }
        static osg::ProxyNode* toProxyNode(osg::Object* st) {
            return dynamic_cast<osg::ProxyNode*>(st);
        }
        static osg::Sequence* toSequence(osg::Object* st) {
            return dynamic_cast<osg::Sequence*>(st);
        }
        static osg::Switch* toSwitch(osg::Object* st) {
            return dynamic_cast<osg::Switch*>(st);
        }
        static osg::TexGenNode* toTexGenNode(osg::Object* st) {
            return dynamic_cast<osg::TexGenNode*>(st);
        }

        static osg::Transform* toTransform(osg::Object* st) {
            return dynamic_cast<osg::Transform*>(st);
        }
        static osg::AutoTransform* toAutoTransform(osg::Object* st) {
            return dynamic_cast<osg::AutoTransform*>(st);
        }
        static osg::Camera* toCamera(osg::Object* st) {
            return dynamic_cast<osg::Camera*>(st);
        }
        static osg::CameraView* toCameraView(osg::Object* st) {
            return dynamic_cast<osg::CameraView*>(st);
        }
        static osg::MatrixTransform* toMatrixTransform(osg::Object* st) {
            return dynamic_cast<osg::MatrixTransform*>(st);
        }
        static osg::PositionAttitudeTransform* toPositionAttitudeTransform(osg::Object* st) {
            return dynamic_cast<osg::PositionAttitudeTransform*>(st);
        }
        static osgTerrain::TerrainTile* toTerrainTile(osg::Object* st) {
            return dynamic_cast<osgTerrain::TerrainTile*>(st);
        }
};
}

#endif
