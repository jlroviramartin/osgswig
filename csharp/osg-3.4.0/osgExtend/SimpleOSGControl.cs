using System;
using System.Diagnostics;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using osg;
using osgGA;
using OsgNet.Properties;
using osgViewer;
using Timer = System.Windows.Forms.Timer;
using EventHandler = System.EventHandler;

namespace OSGDLL
{
    public class SimpleOSGControl : UserControl
    {
        #region Miembros publicos

        public SimpleOSGControl()
        {
            // Se inicializa el componente: lo utiliza VisualStudio.
            this.InitializeComponent();

            this.Name = "SimpleOSGControl";

            this.ResizeRedraw = true;
            this.DoubleBuffered = false;

            // Se modifican los estilos.
            this.SetStyle(ControlStyles.Opaque
                          | ControlStyles.ResizeRedraw
                          | ControlStyles.UserPaint
                          | ControlStyles.AllPaintingInWmPaint,
                          true);
            // No se emite Click ni DoubleClick.
            this.SetStyle(ControlStyles.StandardClick
                          | ControlStyles.StandardDoubleClick,
                          false);
            // Se procesa el control del raton.
            this.SetStyle(ControlStyles.UserMouse,
                          true);
            // Es seleccionable.
            this.SetStyle(ControlStyles.Selectable,
                          true);
            // No se utiliza DoubleBuffer.
            this.SetStyle(ControlStyles.DoubleBuffer
                          | ControlStyles.OptimizedDoubleBuffer,
                          false);
            this.UpdateStyles();

            this.EnableVSync = false;
        }

        /// <summary>Vista.</summary>
        public Viewer Viewer
        {
            get { return this.viewer; }
        }

        /// <summary>Raiz.</summary>
        public Group Root
        {
            get { return this.root; }
            set
            {
                if (this.root != value)
                {
                    this.root = value;
                    this.viewer.asOsgViewerView().setSceneData(this.root);
                }
            }
        }

        /// <summary>Camara.</summary>
        public Camera Camera
        {
            get { return this.camera; }
            /*private set
            {
                if (this.camera != value)
                {
                    this.camera = value;
                    this.viewer.asOsgViewerView().setCamera(this.camera);
                }
            }*/
        }

        /*/// <summary>Camara.</summary>
        public Camera PreCamera
        {
            get { return this.preCamera; }
            private set
            {
                if (this.preCamera != value)
                {
                    if (this.preCamera != null)
                    {
                        Viewer.asView(this.viewer).removeSlave(this.preCamera);
                    }
                    this.preCamera = value;
                    if (this.preCamera != null)
                    {
                        Viewer.asView(this.viewer).addSlave(this.preCamera);
                    }
                }
            }
        }*/

        /// <summary>Manipulador de la camara.</summary>
        public CameraManipulator Manipulator
        {
            get { return this.manipulator; }
            set
            {
                if (this.manipulator != value)
                {
                    this.manipulator = value;
                    this.viewer.asOsgViewerView().setCameraManipulator(this.manipulator);
                }
            }
        }

        /// <summary>
        /// Genera un frame.
        /// </summary>
        public void Frame()
        {
            if (!this.viewer.done())
            {
                try
                {
                    // Lock de lectura.
                    this.rwlockOSGThread.AcquireReaderLock(-1);

                    this.viewer.frame();
                }
                catch (Exception e)
                {
                    Debug.Write(e);
                }
                finally
                {
                    // Se libera el lock de lectura.
                    this.rwlockOSGThread.ReleaseReaderLock();
                }
            }
        }

        /// <summary>
        /// Indica que pare la generación de frames.
        /// </summary>
        public void PauseOSG()
        {
            if (useThread)
            {
                if (this.pauseOSGThread != null)
                {
                    this.pauseOSGThread.Reset();
                }
            }
            else if (useTimer)
            {
                if (this.timerPintar != null)
                {
                    this.timerPintar.Enabled = false;
                }
            }
        }

        /// <summary>
        /// Indica que continue la generación de frames.
        /// </summary>
        public void ContinueOSG()
        {
            if (useThread)
            {
                if (this.pauseOSGThread != null)
                {
                    this.pauseOSGThread.Set();
                }
            }
            else if (useTimer)
            {
                if (this.timerPintar != null)
                {
                    this.timerPintar.Enabled = true;
                }
            }
        }

        public event EventHandler UpdateOSG;

        #endregion Miembros publicos _______________________________________________________________

        #region Miembros protegidos

        protected bool EnableVSync { get; set; }

        /// <summary>Contexto grafico.</summary>
        protected GraphicsContext GraphicsContext
        {
            get { return this.gc; }
        }

        /// <summary>
        /// Lanza el evento <c>UpdateOSG</c>.
        /// </summary>
        protected virtual void OnUpdateOSG(EventArgs args)
        {
            if (this.UpdateOSG != null)
            {
                this.UpdateOSG(this, args);
            }
        }

        /// <summary>
        /// Crea la ventana de <c>OSG</c>.
        /// </summary>
        protected virtual void CreateOSGWindow()
        {
            GraphicsContext.Traits traits = this.CreateTraits();

            Trace.WriteLine("Traits:");
            Trace.WriteLine(ToString(traits));

            this.gc = GraphicsContext.createGraphicsContext(traits);

            if (!this.gc.valid())
            {
                Trace.WriteLine("El GraphicsContext {0} no es valido", this.gc.ToString());
            }

            // Se establece el 'viewer'.
            Viewer viewer = new Viewer();
            viewer.asOsgViewerView().setLightingMode(osg.View.LightingMode.SKY_LIGHT);
            this.viewer = viewer;

            // Se establece la camara.
            Camera camera = this.viewer.asOsgViewerView().getCamera();
            camera.setGraphicsContext(this.gc);
            camera.setViewport(new Viewport(0, 0, traits.width, traits.height));
            camera.setProjectionMatrixAsPerspective(30.0f, (double)traits.width / (double)traits.height, 0.5, 1000.0);
            camera.setDrawBuffer((uint)OsgModule.GL_FRONT);
            camera.setReadBuffer((uint)OsgModule.GL_FRONT);
            camera.setClearColor(new Vec4f(0.2f, 0.2f, 0.2f, 1));
            //camera.asCullSettings().setComputeNearFarMode(CullSettings.ComputeNearFarMode.DO_NOT_COMPUTE_NEAR_FAR);
            camera.setClearMask((uint)(OsgModule.GL_COLOR_BUFFER_BIT
                                       | OsgModule.GL_DEPTH_BUFFER_BIT
                /*| OsgModule.GL_STENCIL_BUFFER_BIT*/));

            //DisplaySettings settings = this.CreateDisplaySettings();
            //camera.setDisplaySettings(settings);
            //osgViewer.Viewer.asView(this.Viewer).setDisplaySettings(settings);

            //this.Camera.attach(Camera.BufferComponent.STENCIL_BUFFER,));

            //this.Camera = camera;
            this.camera = camera;

            // Se establece el manipulador por defecto: tipo trackball.
            TrackballManipulator manipulator = new TrackballManipulator();
            manipulator.setHomePosition(new Vec3d(-50, 0, 2), new Vec3d(0, 0, 0), new Vec3d(0, 0, 1));
            manipulator.setTransformation(new Vec3d(-50, 0, 2), new Vec3d(0, 0, 0), new Vec3d(0, 0, 1));
            //manipulator.home(0);
            //manipulator.setAutoComputeHomePosition(true);
            manipulator.setAllowThrow(false);
            manipulator.setVerticalAxisFixed(true);
            manipulator.setTrackballSize(1);

            this.Manipulator = manipulator;
        }

        protected virtual GraphicsContext.Traits CreateTraits()
        {
            Referenced windata = GraphicsWindowWin32.WindowData.create(this.Handle);

            GraphicsContext.Traits traits = new GraphicsContext.Traits();
            traits.x = 0;
            traits.y = 0;
            traits.width = this.Width;
            traits.height = this.Height;
            traits.supportsResize = true;
            traits.windowDecoration = false;
            traits.doubleBuffer = true;
            //traits.sharedContext = new GraphicsContextObserver();
            traits.inheritedWindowData = new ReferencedRef(windata);

            //traits.setInheritedWindowPixelFormat = true;
            traits.setInheritedWindowPixelFormat = false;
            traits.stencil = stencil;
            traits.depth = depth;
            traits.red = red;
            traits.green = green;
            traits.blue = blue;
            traits.alpha = alpha;
            traits.samples = (uint)numSamples; // to make anti-aliased
            traits.sampleBuffers = (uint)((numSamples > 0) ? 1 : 0);

            // disable vertical sync.
            traits.vsync = this.EnableVSync;
            traits.windowName = this.Name;
            //traits.useMultiThreadedOpenGLEngine

            traits.swapMethod = swapMethod;

            //traits.glContextVersion = version;

            return traits;
        }

#if false
        protected virtual DisplaySettings CreateDisplaySettings()
        {
            DisplaySettings settings = new DisplaySettings();
            settings.setDepthBuffer(true);
            settings.setNumMultiSamples((uint)numSamples);
            settings.setMinimumNumStencilBits(8);
            settings.setMinimumNumAlphaBits(8);
            return settings;
        }
#endif

        /// <summary>
        /// Crea la raiz de la escena.
        /// </summary>
        protected virtual void CreateOSGRoot()
        {
            // Se crea el nodo raiz.
            this.Root = new Group();

            // Realize the Viewer
            this.viewer.realize();

            this.Viewer.setDone(false);

            // Se configura la tarea 'OSG' si procede.
            if (useThread)
            {
                Debug.WriteLine("[SimpleOSGControl] useThread Priority={0} Name={1}",
                                threadPriority, NOMBRE_OSG);

                this.osgThread = new Thread(this.OSGThread);
                this.osgThread.IsBackground = true;
                this.osgThread.Priority = threadPriority;
                this.osgThread.Name = NOMBRE_OSG;

                this.osgThread.Start();
            }
            else if (useTimer)
            {
                Debug.WriteLine("[SimpleOSGControl] useTimer Interval={0}",
                                timerInterval);

                this.timerPintar = new Timer();
                this.timerPintar.Tick += this.TimerPintar_Tick;
                this.timerPintar.Interval = timerInterval;
                this.timerPintar.Enabled = false;
                this.timerPintar.Start();
            }
            else if (useGraphicsThread)
            {
                Debug.WriteLine("[SimpleOSGControl] useGraphicsThread");

                this.gc.createGraphicsThread();
            }

            if (this.Visible || this.Focused)
            {
                this.ContinueOSG();
            }
        }

        #endregion Miembros protegidos _____________________________________________________________

        #region Miembros privados

        /// <summary>Nombre del hilo principal.</summary>
        private const string NOMBRE_OSG = "Hilo ventana OSG";

        /// <summary>
        /// Inicializa el componente.
        /// </summary>
        private void InitializeComponent()
        {
        }

#if false
    /// <summary>
    /// Crea una escena de ejemplo.
    /// </summary>
        private void CreateSampleScene()
        {
            //The geode containing our shape
            Geode geode = new Geode();

            ////Our shape: a capsule, it could have been any other geometry (a box, plane, cylinder etc.)
            //Capsule myCapsule = new Capsule(new Vec3f(), 1, 2);

            ////Our shape drawable
            //ShapeDrawable capsuledrawable = new ShapeDrawable(myCapsule);

            //geode.addDrawable(capsuledrawable);

            // create POINTS
            {
                Geometry pointsGeom = new Geometry();
                Vec3Array vertices = new Vec3Array();
                vertices.push_back(new Vec3f(-1.02168f, -2.15188e-09f, 0.885735f));
                vertices.push_back(new Vec3f(-0.976368f, -2.15188e-09f, 0.832179f));
                vertices.push_back(new Vec3f(-0.873376f, 9.18133e-09f, 0.832179f));
                vertices.push_back(new Vec3f(-0.836299f, -2.15188e-09f, 0.885735f));
                vertices.push_back(new Vec3f(-0.790982f, 9.18133e-09f, 0.959889f));
                pointsGeom.setVertexArray(vertices);

                Vec4Array colors = new Vec4Array();
                colors.push_back(new Vec4f(1.0f, 1.0f, 0.0f, 1.0f));

                pointsGeom.setColorArray(colors);
                pointsGeom.setColorBinding(Geometry.AttributeBinding.BIND_OVERALL);

                Vec3Array normals = new Vec3Array();
                normals.push_back(new Vec3f(0.0f, -1.0f, 0.0f));
                pointsGeom.setNormalArray(normals);
                pointsGeom.setNormalBinding(Geometry.AttributeBinding.BIND_OVERALL);

                pointsGeom.addPrimitiveSet(new DrawArrays((uint)PrimitiveSet.Mode.POINTS, 0, (int)vertices.size()));

                geode.addDrawable(pointsGeom);
            }

            // create LINES
            {
                // create Geometry object to store all the vertices and lines primitive.
                Geometry linesGeom = new Geometry();

                // this time we'll preallocate the vertex array to the size we
                // need and then simple set them as array elements, 8 points
                // makes 4 line segments.
                Vec3Array vertices = new Vec3Array(8);
                vertices.set(0, new Vec3f(-1.13704f, -2.15188e-09f, 0.40373f));
                vertices.set(1, new Vec3f(-0.856897f, -2.15188e-09f, 0.531441f));
                vertices.set(2, new Vec3f(-0.889855f, -2.15188e-09f, 0.444927f));
                vertices.set(3, new Vec3f(-0.568518f, -2.15188e-09f, 0.40373f));
                vertices.set(4, new Vec3f(-1.00933f, -2.15188e-09f, 0.370773f));
                vertices.set(5, new Vec3f(-0.716827f, -2.15188e-09f, 0.292498f));
                vertices.set(6, new Vec3f(-1.07936f, 9.18133e-09f, 0.317217f));
                vertices.set(7, new Vec3f(-0.700348f, 9.18133e-09f, 0.362533f));

                // pass the created vertex array to the points geometry object.
                linesGeom.setVertexArray(vertices);

                // set the colors as before, plus using the above
                Vec4Array colors = new Vec4Array();
                colors.push_back(new Vec4f(1.0f, 1.0f, 0.0f, 1.0f));
                linesGeom.setColorArray(colors);
                linesGeom.setColorBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // set the normal in the same way color.
                Vec3Array normals = new Vec3Array();
                normals.push_back(new Vec3f(0.0f, -1.0f, 0.0f));
                linesGeom.setNormalArray(normals);
                linesGeom.setNormalBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // This time we simply use primitive, and hardwire the number of coords to use 
                // since we know up front,
                linesGeom.addPrimitiveSet(new DrawArrays((uint)PrimitiveSet.Mode.LINES, 0, 8));

                // add the points geometry to the geode.
                geode.addDrawable(linesGeom);
            }

            // create LINE_STRIP
            {
                // create Geometry object to store all the vertices and lines primitive.
                Geometry linesGeom = new Geometry();

                // this time we'll preallocate the vertex array to the size 
                // and then use an iterator to fill in the values, a bit perverse
                // but does demonstrate that we have just a standard std::vector underneath.
                Vec3Array vertices = new Vec3Array();
                vertices.push_back(new Vec3f(-0.0741545f, -2.15188e-09f, 0.416089f));
                vertices.push_back(new Vec3f(0.234823f, -2.15188e-09f, 0.259541f));
                vertices.push_back(new Vec3f(0.164788f, -2.15188e-09f, 0.366653f));
                vertices.push_back(new Vec3f(-0.0288379f, -2.15188e-09f, 0.333695f));
                vertices.push_back(new Vec3f(-0.0453167f, -2.15188e-09f, 0.280139f));

                // pass the created vertex array to the points geometry object.
                linesGeom.setVertexArray(vertices);

                // set the colors as before, plus using the above
                Vec4Array colors = new Vec4Array();
                colors.push_back(new Vec4f(1.0f, 1.0f, 0.0f, 1.0f));
                linesGeom.setColorArray(colors);
                linesGeom.setColorBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // set the normal in the same way color.
                Vec3Array normals = new Vec3Array();
                normals.push_back(new Vec3f(0.0f, -1.0f, 0.0f));
                linesGeom.setNormalArray(normals);
                linesGeom.setNormalBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // This time we simply use primitive, and hardwire the number of coords to use 
                // since we know up front,
                linesGeom.addPrimitiveSet(new DrawArrays((uint)PrimitiveSet.Mode.LINE_STRIP, 0, 5));

                // add the points geometry to the geode.
                geode.addDrawable(linesGeom);
            }

            // create LINE_LOOP
            {
                // create Geometry object to store all the vertices and lines primitive.
                Geometry linesGeom = new Geometry();

                // this time we'll a C arrays to initialize the vertices.

                Vec3f[] myCoords =
                    {
                        new Vec3f(0.741546f, -2.15188e-09f, 0.453167f),
                        new Vec3f(0.840418f, -2.15188e-09f, 0.304858f),
                        new Vec3f(1.12468f, -2.15188e-09f, 0.300738f),
                        new Vec3f(1.03816f, 9.18133e-09f, 0.453167f),
                        new Vec3f(0.968129f, -2.15188e-09f, 0.337815f),
                        new Vec3f(0.869256f, -2.15188e-09f, 0.531441f)
                    };

                int numCoords = myCoords.Length;

                Vec3Array vertices = new Vec3Array(new Vec3Vector(myCoords));

                // pass the created vertex array to the points geometry object.
                linesGeom.setVertexArray(vertices);

                // set the colors as before, plus using the above
                Vec4Array colors = new Vec4Array();
                colors.push_back(new Vec4f(1.0f, 1.0f, 0.0f, 1.0f));
                linesGeom.setColorArray(colors);
                linesGeom.setColorBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // set the normal in the same way color.
                Vec3Array normals = new Vec3Array();
                normals.push_back(new Vec3f(0.0f, -1.0f, 0.0f));
                linesGeom.setNormalArray(normals);
                linesGeom.setNormalBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // This time we simply use primitive, and hardwire the number of coords to use 
                // since we know up front,
                linesGeom.addPrimitiveSet(new DrawArrays((uint)PrimitiveSet.Mode.LINE_LOOP, 0, numCoords));

                // add the points geometry to the geode.
                geode.addDrawable(linesGeom);
            }

            // now we'll stop creating separate normal and color arrays
            // since we are using the same values all the time, we'll just
            // share the same ColorArray and NormalArrays..

            // set the colors as before, use a ref_ptr rather than just
            // standard C pointer, as that in the case of it not being
            // assigned it will still be cleaned up automatically.
            Vec4Array shared_colors = new Vec4Array();
            shared_colors.push_back(new Vec4f(1.0f, 1.0f, 0.0f, 1.0f));

            // same trick for shared normal.
            Vec3Array shared_normals = new Vec3Array();
            shared_normals.push_back(new Vec3f(0.0f, -1.0f, 0.0f));

            // Note on vertex ordering.
            // According to the OpenGL diagram vertices should be specified in a clockwise direction.
            // In reality you need to specify coords for polygons in a anticlockwise direction
            // for their front face to be pointing towards you; get this wrong and you could
            // find back face culling removing the wrong faces of your models.  The OpenGL diagram 
            // is just plain wrong, but it's a nice diagram so we'll keep it for now!

            // create POLYGON
            {
                // create Geometry object to store all the vertices and lines primitive.
                Geometry polyGeom = new Geometry();

                // this time we'll use C arrays to initialize the vertices.
                // note, anticlockwise ordering.
                // note II, OpenGL polygons must be convex, planar polygons, otherwise 
                // undefined results will occur.  If you have concave polygons or ones
                // that cross over themselves then use the osgUtil::Tessellator to fix
                // the polygons into a set of valid polygons.
                Vec3f[] myCoords =
                    {
                        new Vec3f(-1.0464f, 0.0f, -0.193626f),
                        new Vec3f(-1.0258f, 0.0f, -0.26778f),
                        new Vec3f(-0.807461f, 0.0f, -0.181267f),
                        new Vec3f(-0.766264f, 0.0f, -0.0576758f),
                        new Vec3f(-0.980488f, 0.0f, -0.094753f)
                    };

                int numCoords = myCoords.Length;

                Vec3Array vertices = new Vec3Array(new Vec3Vector(myCoords));

                // pass the created vertex array to the points geometry object.
                polyGeom.setVertexArray(vertices);

                // use the shared color array.
                polyGeom.setColorArray(shared_colors);
                polyGeom.setColorBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // use the shared normal array.
                polyGeom.setNormalArray(shared_normals);
                polyGeom.setNormalBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // This time we simply use primitive, and hardwire the number of coords to use 
                // since we know up front,
                polyGeom.addPrimitiveSet(new DrawArrays((uint)PrimitiveSet.Mode.POLYGON, 0, numCoords));

                //printTriangles("Polygon", polyGeom);

                // add the points geometry to the geode.
                geode.addDrawable(polyGeom);
            }

            // create QUADS
            {
                // create Geometry object to store all the vertices and lines primitive.
                Geometry polyGeom = new Geometry();

                // note, anticlockwise ordering.
                Vec3f[] myCoords =
                    {
                        new Vec3f(0.0247182f, 0.0f, -0.156548f),
                        new Vec3f(0.0247182f, 0.0f, -0.00823939f),
                        new Vec3f(-0.160668f, 0.0f, -0.0453167f),
                        new Vec3f(-0.222464f, 0.0f, -0.13183f),
                        new Vec3f(0.238942f, 0.0f, -0.251302f),
                        new Vec3f(0.333696f, 0.0f, 0.0329576f),
                        new Vec3f(0.164788f, 0.0f, -0.0453167f),
                        new Vec3f(0.13595f, 0.0f, -0.255421f)
                    };

                int numCoords = myCoords.Length;

                Vec3Array vertices = new Vec3Array(new Vec3Vector(myCoords));

                // pass the created vertex array to the points geometry object.
                polyGeom.setVertexArray(vertices);

                // use the shared color array.
                polyGeom.setColorArray(shared_colors);
                polyGeom.setColorBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // use the shared normal array.
                polyGeom.setNormalArray(shared_normals);
                polyGeom.setNormalBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // This time we simply use primitive, and hardwire the number of coords to use 
                // since we know up front,
                polyGeom.addPrimitiveSet(new DrawArrays((uint)PrimitiveSet.Mode.QUADS, 0, numCoords));

                //printTriangles("Quads", *polyGeom);

                // add the points geometry to the geode.
                geode.addDrawable(polyGeom);
            }

            // create QUAD_STRIP
            {
                // create Geometry object to store all the vertices and lines primitive.
                Geometry polyGeom = new Geometry();

                // note, first coord at top, second at bottom, reverse to that buggy OpenGL image..
                Vec3f[] myCoords =
                    {
                        new Vec3f(0.733306f, -2.15188e-09f, -0.0741545f),
                        new Vec3f(0.758024f, -2.15188e-09f, -0.205985f),
                        new Vec3f(0.885735f, -2.15188e-09f, -0.0576757f),
                        new Vec3f(0.885735f, -2.15188e-09f, -0.214224f),
                        new Vec3f(0.964009f, 9.18133e-09f, -0.0370773f),
                        new Vec3f(1.0464f, 9.18133e-09f, -0.173027f),
                        new Vec3f(1.11232f, -2.15188e-09f, 0.0123591f),
                        new Vec3f(1.12468f, 9.18133e-09f, -0.164788f),
                    };

                int numCoords = myCoords.Length;

                Vec3Array vertices = new Vec3Array(new Vec3Vector(myCoords));

                // pass the created vertex array to the points geometry object.
                polyGeom.setVertexArray(vertices);

                // use the shared color array.
                polyGeom.setColorArray(shared_colors);
                polyGeom.setColorBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // use the shared normal array.
                polyGeom.setNormalArray(shared_normals);
                polyGeom.setNormalBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // This time we simply use primitive, and hardwire the number of coords to use 
                // since we know up front,
                polyGeom.addPrimitiveSet(new DrawArrays((uint)PrimitiveSet.Mode.QUAD_STRIP, 0, numCoords));

                //printTriangles("Quads strip", *polyGeom);

                // add the points geometry to the geode.
                geode.addDrawable(polyGeom);
            }

            // create TRIANGLES, TRIANGLE_STRIP and TRIANGLE_FAN all in one Geometry/
            {
                // create Geometry object to store all the vertices and lines primitive.
                Geometry polyGeom = new Geometry();

                // note, first coord at top, second at bottom, reverse to that buggy OpenGL image..
                Vec3f[] myCoords =
                    {
                        // TRIANGLES 6 vertices, v0..v5
                        // note in anticlockwise order.
                        new Vec3f(-1.12056f, -2.15188e-09f, -0.840418f),
                        new Vec3f(-0.95165f, -2.15188e-09f, -0.840418f),
                        new Vec3f(-1.11644f, 9.18133e-09f, -0.716827f),
                        // note in anticlockwise order.
                        new Vec3f(-0.840418f, 9.18133e-09f, -0.778623f),
                        new Vec3f(-0.622074f, 9.18133e-09f, -0.613835f),
                        new Vec3f(-1.067f, 9.18133e-09f, -0.609715f),
                        // TRIANGLE STRIP 6 vertices, v6..v11
                        // note defined top point first, 
                        // then anticlockwise for the next two points,
                        // then alternating to bottom there after.
                        new Vec3f(-0.160668f, -2.15188e-09f, -0.531441f),
                        new Vec3f(-0.160668f, -2.15188e-09f, -0.749785f),
                        new Vec3f(0.0617955f, 9.18133e-09f, -0.531441f),
                        new Vec3f(0.168908f, -2.15188e-09f, -0.753905f),
                        new Vec3f(0.238942f, -2.15188e-09f, -0.531441f),
                        new Vec3f(0.280139f, -2.15188e-09f, -0.823939f),
                        // TRIANGLE FAN 5 vertices, v12..v16
                        // note defined in anticlockwise order.
                        new Vec3f(0.844538f, 9.18133e-09f, -0.712708f),
                        new Vec3f(1.0258f, 9.18133e-09f, -0.799221f),
                        new Vec3f(1.03816f, -2.15188e-09f, -0.692109f),
                        new Vec3f(0.988727f, 9.18133e-09f, -0.568518f),
                        new Vec3f(0.840418f, -2.15188e-09f, -0.506723f),
                    };

                int numCoords = myCoords.Length;

                Vec3Array vertices = new Vec3Array(new Vec3Vector(myCoords));

                // pass the created vertex array to the points geometry object.
                polyGeom.setVertexArray(vertices);

                // use the shared color array.
                polyGeom.setColorArray(shared_colors);
                polyGeom.setColorBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // use the shared normal array.
                polyGeom.setNormalArray(shared_normals);
                polyGeom.setNormalBinding(Geometry.AttributeBinding.BIND_OVERALL);

                // This time we simply use primitive, and hardwire the number of coords to use 
                // since we know up front,
                polyGeom.addPrimitiveSet(new DrawArrays((uint)PrimitiveSet.Mode.TRIANGLES, 0, 6));
                polyGeom.addPrimitiveSet(new DrawArrays((uint)PrimitiveSet.Mode.TRIANGLE_STRIP, 6, 6));
                polyGeom.addPrimitiveSet(new DrawArrays((uint)PrimitiveSet.Mode.TRIANGLE_FAN, 12, 5));

                // polygon stipple
                StateSet stateSet = new StateSet();
                polyGeom.setStateSet(stateSet);

//# if !defined(OSG_GLES1_AVAILABLE) && !defined(OSG_GLES2_AVAILABLE) && !defined(OSG_GL3_AVAILABLE)
//                PolygonStipple* polygonStipple = new PolygonStipple;
//                stateSet.setAttributeAndModes(polygonStipple, StateAttribute.Values.OVERRIDE | StateAttribute.Values.ON);
//#endif

                //printTriangles("Triangles/Strip/Fan", *polyGeom);

                // add the points geometry to the geode.
                geode.addDrawable(polyGeom);
            }

            this.root.addChild(geode);
        }

        private Geode LoadCylinder()
        {
            Cylinder myCylinder = new Cylinder(new Vec3f(0, 0, 0), 0.1f, 1.0f);
            ShapeDrawable myCylinderDrawable = new ShapeDrawable(myCylinder);
            Geode myCylinderGeode = new Geode();
            myCylinderGeode.addDrawable(myCylinderDrawable);
            return myCylinderGeode;
        }

        private Geode LoadBox()
        {
            //create a box
            Box myBox = new Box(new Vec3f(0, 0, 0), 0.5f);
            ShapeDrawable myBoxDrawable = new ShapeDrawable(myBox);
            Geode myBoxGeode = new Geode();
            myBoxGeode.addDrawable(myBoxDrawable);
            //root->addChild(myBoxGeode);
            return myBoxGeode;
        }
#endif

        /// <summary>
        /// Tarea que genera los frames.
        /// </summary>
        private void OSGThread()
        {
            this.viewer.setDone(false);

            while (this.DoFrame())
            {
                // Hasta el infinito..
            }
        }

        /// <summary>
        /// Escucha el evento <c>TimerPintar.Tick</c>.
        /// </summary>
        private void TimerPintar_Tick(object sender, EventArgs args)
        {
            this.DoFrame();
        }

        private bool DoFrame()
        {
            if (this.viewer.done())
            {
                return false;
            }

            try
            {
                //this.pauseOSGThread.WaitOne(Timeout.Infinite);

                //if (this.shutdownSGThread.WaitOne(0))
                //{
                //    break;
                //}

                // Lock de lectura.
                this.rwlockOSGThread.AcquireReaderLock(-1);

                //this.viewer.eventTraversal();
                //this.viewer.updateTraversal();
                //this.viewer.renderingTraversals();
                this.viewer.frame();
            }
            catch (Exception e)
            {
                Debug.Write(e);
            }
            finally
            {
                // Se libera el lock de lectura.
                this.rwlockOSGThread.ReleaseReaderLock();
            }
            return true;
        }

        /*private void TimerPintar_Tick(object sender, EventArgs args)
        {
            Geode cylGeode = this.LoadCylinder();
            Geode boxGeode = this.LoadBox();

            this.root.addChild(cylGeode);
            this.root.addChild(boxGeode);

            StateSet cylState = cylGeode.getOrCreateStateSet();
            CullFace cfCyl = new CullFace();
            cylState.setAttributeAndModes(cfCyl);

            StateSet boxState = boxGeode.getOrCreateStateSet();
            CullFace cfBox = new CullFace();
            boxState.setAttributeAndModes(cfBox);

            StateSet state = this.root.getOrCreateStateSet();

            ColorMask colorMask = new ColorMask();
            Depth depth = new Depth();
            Stencil stencil = new Stencil();

            state.setAttributeAndModes(colorMask, (uint)StateAttribute.Values.ON);
            state.setAttributeAndModes(depth, (uint)StateAttribute.Values.OFF);
            state.setAttributeAndModes(stencil, (uint)StateAttribute.Values.OFF);

            if (!this.viewer.done())
            {
                // Turn off writing to the colour buffer, so nothing is rendered
                // to the screen yet
                colorMask.setMask(false, false, false, false);

                // Clear stencil buffer to O ??

                // Turn on depth testing
                state.setAttribute(depth, (uint)StateAttribute.Values.ON);

                // Render the back  face of cylinder (object a) into depth buffer
                // Ensure the box (object b ) isn't rendered
                cfCyl.setMode(CullFace.Mode.FRONT);
                cfBox.setMode(CullFace.Mode.FRONT_AND_BACK);
                this.viewer.frame();

                // Disable writing to the depth buffer
                depth.setWriteMask(false);

                // Set the stencil buffer to increment if the depth test passes
                //enable the stencil test
                stencil.setWriteMask(1);
                state.setAttribute(stencil, (uint)StateAttribute.Values.ON);

                //set the stencil functions
                stencil.setFunction(Stencil.Function.ALWAYS, 0, 0);

                stencil.setOperation(Stencil.Operation.KEEP, Stencil.Operation.KEEP, Stencil.Operation.INCR);

                // Render the front faces of the box object b
                cfCyl.setMode(CullFace.Mode.FRONT_AND_BACK);
                cfBox.setMode(CullFace.Mode.BACK);
                this.viewer.frame();

                // Set the stencil buffer to decrement if the depth test passes
                stencil.setOperation(Stencil.Operation.KEEP, Stencil.Operation.KEEP, Stencil.Operation.DECR);

                // Render the back face of the box (object b)
                cfBox.setMode(CullFace.Mode.FRONT);
                this.viewer.frame();

                // Set the stencil buffer to pass where values aren't equal to 0
                stencil.setFunction(Stencil.Function.NOTEQUAL, 0, 1);

                // Turn off writing to the stencil buffer
                stencil.setWriteMask(0);

                // Turn on writing to the colour buffer
                colorMask.setMask(true, true, true, true);

                // Turn off depth testing
                state.setAttribute(depth, (uint)StateAttribute.Values.OFF);

                // Render back faces of cylinder object a
                cfCyl.setMode(CullFace.Mode.FRONT);
                cfBox.setMode(CullFace.Mode.FRONT_AND_BACK);

                this.viewer.frame();
            }
        }*/

        private void KillGLWindow()
        {
            if (this.gc != null)
            {
                this.gc.releaseContext();
                this.gc = null;
            }

            if (this.gc != null)
            {
                this.gc.Dispose();
                this.gc = null;
            }
        }

        private static readonly uint stencil = Settings.Default.OSG_Stencil;
        private static readonly uint depth = Settings.Default.OSG_Depth;
        private static readonly uint red = Settings.Default.OSG_Red;
        private static readonly uint green = Settings.Default.OSG_Green;
        private static readonly uint blue = Settings.Default.OSG_Blue;
        private static readonly uint alpha = Settings.Default.OSG_Alpha;
        private static readonly int numSamples = Settings.Default.OSG_NumSamples;

        private static readonly DisplaySettings.SwapMethod swapMethod = Settings.Default.OSG_SwapMethod;

        private static readonly bool useThread = Settings.Default.OSG_UseThread;
        private static readonly ThreadPriority threadPriority = Settings.Default.OSG_ThreadPriority;

        private static readonly bool useTimer = Settings.Default.OSG_UseTimer;
        private static readonly int timerInterval = Settings.Default.OSG_TimerInterval;
        
        private static readonly bool useGraphicsThread = Settings.Default.OSG_UseGraphicsThread;

        private static string ToString(GraphicsContext.Traits traits)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendFormat("x, y, width, height: {0}, {1}, {2}, {3}", traits.x, traits.y, traits.width, traits.height).AppendLine();
            builder.AppendFormat("windowName: {0}", traits.windowName).AppendLine();
            builder.AppendFormat("windowDecoration: {0}", traits.windowDecoration).AppendLine();
            builder.AppendFormat("supportsResize: {0}", traits.supportsResize).AppendLine();
            builder.AppendFormat("RGBA: {0}, {1}, {2}, {3}", traits.red, traits.green, traits.blue, traits.alpha).AppendLine();
            builder.AppendFormat("depth: {0}", traits.depth).AppendLine();
            builder.AppendFormat("stencil: {0}", traits.stencil).AppendLine();
            builder.AppendFormat("sampleBuffers: {0}", traits.sampleBuffers).AppendLine();
            builder.AppendFormat("samples: {0}", traits.samples).AppendLine();
            builder.AppendFormat("pbuffer: {0}", traits.pbuffer).AppendLine();
            builder.AppendFormat("quadBufferStereo: {0}", traits.quadBufferStereo).AppendLine();
            builder.AppendFormat("doubleBuffer: {0}", traits.doubleBuffer).AppendLine();
            builder.AppendFormat("target: {0}", traits.target).AppendLine();
            builder.AppendFormat("format: {0}", traits.format).AppendLine();
            builder.AppendFormat("level: {0}", traits.level).AppendLine();
            builder.AppendFormat("face: {0}", traits.face).AppendLine();
            builder.AppendFormat("mipMapGeneration: {0}", traits.mipMapGeneration).AppendLine();
            builder.AppendFormat("vsync: {0}", traits.vsync).AppendLine();
            builder.AppendFormat("swapGroupEnabled: {0}", traits.swapGroupEnabled).AppendLine();
            builder.AppendFormat("swapGroup: {0}", traits.swapGroup).AppendLine();
            builder.AppendFormat("swapBarrier: {0}", traits.swapBarrier).AppendLine();
            builder.AppendFormat("useMultiThreadedOpenGLEngine: {0}", traits.useMultiThreadedOpenGLEngine).AppendLine();
            builder.AppendFormat("useCursor: {0}", traits.useCursor).AppendLine();
            builder.AppendFormat("glContextVersion: {0}", traits.glContextVersion).AppendLine();
            builder.AppendFormat("glContextFlags: {0}", traits.glContextFlags).AppendLine();
            builder.AppendFormat("glContextProfileMask: {0}", traits.glContextProfileMask).AppendLine();
            //getContextVersion(SWIGTYPE_p_unsigned_int major, SWIGTYPE_p_unsigned_int minor)
            builder.AppendFormat("sharedContext: {0}", traits.sharedContext).AppendLine();
            builder.AppendFormat("inheritedWindowData: {0}", traits.inheritedWindowData).AppendLine();
            builder.AppendFormat("setInheritedWindowPixelFormat: {0}", traits.setInheritedWindowPixelFormat).AppendLine();
            builder.AppendFormat("overrideRedirect: {0}", traits.overrideRedirect).AppendLine();
            builder.AppendFormat("swapMethod: {0}", traits.swapMethod).AppendLine();

            GraphicsContext.ScreenIdentifier sidentifier = traits.asScreenIdentifier();
            builder.AppendFormat("displayName: {0}", sidentifier.displayName()).AppendLine();
            builder.AppendFormat("hostName: {0}", sidentifier.hostName).AppendLine();
            builder.AppendFormat("displayNum: {0}", sidentifier.displayNum).AppendLine();
            builder.AppendFormat("screenNum: {0}", sidentifier.screenNum).AppendLine();

            return builder.ToString();
        }

        /// <summary>Timer de OSG.</summary>
        private Timer timerPintar;

        /// <summary>Tarea principal de OSG.</summary>
        private Thread osgThread;

        // You must use a monitor to prevent another thread to update scene while viewer is rendering.
        private readonly ReaderWriterLock rwlockOSGThread = new ReaderWriterLock();

        /// <summary><see cref="http://stackoverflow.com/questions/142826/is-there-a-way-to-indefinitely-pause-a-thread"/></summary>
        private readonly ManualResetEvent pauseOSGThread = new ManualResetEvent(false);

        ///// <summary><see cref="http://stackoverflow.com/questions/142826/is-there-a-way-to-indefinitely-pause-a-thread"/></summary>
        //private ManualResetEvent shutdownSGThread = new ManualResetEvent(false);

        /// <summary>Vista.</summary>
        private Viewer viewer;

        /// <summary>Nodo raiz.</summary>
        private Group root;

        /// <summary>Camara.</summary>
        private Camera camera;

        /*/// <summary>Camara.</summary>
        private Camera preCamera;*/

        /// <summary>Manipulador.</summary>
        private CameraManipulator manipulator;

        /// <summary>Contexto grafico.</summary>
        private GraphicsContext gc;

#if false
        protected readonly ReaderWriterLock rwlock = new ReaderWriterLock();
#endif

        #endregion Miembros privados _______________________________________________________________

        #region Miembros Control

        protected override void OnLoad(EventArgs args)
        {
            this.CreateOSGWindow();
            this.CreateOSGRoot();
        }

        protected override void OnPaintBackground(PaintEventArgs e)
        {
            // No se hace nada.
        }

        protected override void OnPaint(PaintEventArgs args)
        {
            // No se hace nada.
        }

        protected override void OnHandleDestroyed(EventArgs e)
        {
            base.OnHandleDestroyed(e);

            this.PauseOSG();
            if (useThread)
            {
                if (this.osgThread != null)
                {
                    this.osgThread.Abort();
                }
            }

            this.KillGLWindow();
        }

        protected override void OnLostFocus(EventArgs e)
        {
            base.OnLostFocus(e);

            this.PauseOSG();
        }

        protected override void OnGotFocus(EventArgs e)
        {
            base.OnGotFocus(e);

            this.ContinueOSG();
        }

        protected override void OnVisibleChanged(EventArgs e)
        {
            base.OnVisibleChanged(e);

            if (this.Visible)
            {
                this.ContinueOSG();
            }
            else
            {
                this.PauseOSG();
            }
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);

            if (this.timerPintar != null)
            {
                this.timerPintar.Dispose();
            }
        }

        #endregion Miembros Control ________________________________________________________________
    }
}