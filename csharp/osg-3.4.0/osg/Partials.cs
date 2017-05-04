namespace osg
{
    public partial class Quat
    {
        public static Quat operator +(Quat q1, Quat q2)
        {
            return q1.Sum(q2);
        }

        public static Quat operator -(Quat q1, Quat q2)
        {
            return q1.Sub(q2);
        }

        public static Quat operator *(Quat q1, Quat q2)
        {
            return q1.Mul(q2);
        }

        public static Quat operator *(Quat q1, double v)
        {
            return q1.Mul(v);
        }

        public static Vec3f operator *(Quat q1, Vec3f v)
        {
            return q1.Mul(v);
        }

        public static Vec3d operator *(Quat q1, Vec3d v)
        {
            return q1.Mul(v);
        }

        public static Quat operator /(Quat q1, Quat q2)
        {
            return q1.Div(q2);
        }

        public static Quat operator /(Quat q1, double v)
        {
            return q1.Div(v);
        }
    }

    public partial class Vec3f
    {
        public float this[int i]
        {
            get { return this.get(i); }
            set { this.set(i, value); }
        }

        public float X
        {
            get { return this.x(); }
            set { this.set(0, value); }
        }

        public float Y
        {
            get { return this.y(); }
            set { this.set(1, value); }
        }

        public float Z
        {
            get { return this.z(); }
            set { this.set(2, value); }
        }

        public static Vec3f operator +(Vec3f q1, Vec3f q2)
        {
            return q1.Sum(q2);
        }

        public static Vec3f operator -(Vec3f q1, Vec3f q2)
        {
            return q1.Sub(q2);
        }

        public static Vec3f operator *(Vec3f q1, float v)
        {
            return q1.Mul(v);
        }

        public static Vec3f operator /(Vec3f q1, float v)
        {
            return q1.Div(v);
        }
    }

    public partial class Vec4f
    {
        public float this[int i]
        {
            get { return this.get(i); }
            set { this.set(i, value); }
        }

        public float X
        {
            get { return this.x(); }
            set { this.set(0, value); }
        }

        public float Y
        {
            get { return this.y(); }
            set { this.set(1, value); }
        }

        public float Z
        {
            get { return this.z(); }
            set { this.set(2, value); }
        }

        public float W
        {
            get { return this.w(); }
            set { this.set(3, value); }
        }

        public static Vec4f operator +(Vec4f q1, Vec4f q2)
        {
            return q1.Sum(q2);
        }

        public static Vec4f operator -(Vec4f q1, Vec4f q2)
        {
            return q1.Sub(q2);
        }

        public static Vec4f operator *(Vec4f q1, float v)
        {
            return q1.Mul(v);
        }

        public static Vec4f operator /(Vec4f q1, float v)
        {
            return q1.Div(v);
        }
    }

    public partial class Vec3d
    {
        public double this[int i]
        {
            get { return this.get(i); }
            set { this.set(i, value); }
        }

        public double X
        {
            get { return this.x(); }
            set { this.set(0, value); }
        }

        public double Y
        {
            get { return this.y(); }
            set { this.set(1, value); }
        }

        public double Z
        {
            get { return this.z(); }
            set { this.set(2, value); }
        }

        public static Vec3d operator +(Vec3d q1, Vec3d q2)
        {
            return q1.Sum(q2);
        }

        public static Vec3d operator -(Vec3d q1, Vec3d q2)
        {
            return q1.Sub(q2);
        }

        public static Vec3d operator *(Vec3d q1, double v)
        {
            return q1.Mul(v);
        }

        public static Vec3d operator /(Vec3d q1, double v)
        {
            return q1.Div(v);
        }
    }

    public partial class Vec4d
    {
        public double this[int i]
        {
            get { return this.get(i); }
            set { this.set(i, value); }
        }

        public double X
        {
            get { return this.x(); }
            set { this.set(0, value); }
        }

        public double Y
        {
            get { return this.y(); }
            set { this.set(1, value); }
        }

        public double Z
        {
            get { return this.z(); }
            set { this.set(2, value); }
        }

        public double W
        {
            get { return this.w(); }
            set { this.set(3, value); }
        }

        public static Vec4d operator +(Vec4d q1, Vec4d q2)
        {
            return q1.Sum(q2);
        }

        public static Vec4d operator -(Vec4d q1, Vec4d q2)
        {
            return q1.Sub(q2);
        }

        public static Vec4d operator *(Vec4d q1, double v)
        {
            return q1.Mul(v);
        }

        public static Vec4d operator /(Vec4d q1, double v)
        {
            return q1.Div(v);
        }
    }

    public partial class Matrixd
    {
        public double this[int i, int j]
        {
            get { return this.get(i, j); }
            set { this.set(i, j, value); }
        }
    }

    public partial class Vec2Array
    {
        public Vec2f this[uint i]
        {
            get { return this.get(i); }
            set { this.set(i, value); }
        }

        public Vec2f this[int i]
        {
            get { return this.get((uint)i); }
            set { this.set((uint)i, value); }
        }
    }

    public partial class Vec2dArray
    {
        public Vec2d this[uint i]
        {
            get { return this.get(i); }
            set { this.set(i, value); }
        }

        public Vec2d this[int i]
        {
            get { return this.get((uint)i); }
            set { this.set((uint)i, value); }
        }
    }

    public partial class Vec3Array
    {
        public Vec3f this[uint i]
        {
            get { return this.get(i); }
            set { this.set(i, value); }
        }

        public Vec3f this[int i]
        {
            get { return this.get((uint)i); }
            set { this.set((uint)i, value); }
        }
    }

    public partial class Vec3dArray
    {
        public Vec3d this[uint i]
        {
            get { return this.get(i); }
            set { this.set(i, value); }
        }

        public Vec3d this[int i]
        {
            get { return this.get((uint)i); }
            set { this.set((uint)i, value); }
        }
    }

    public partial class Vec4Array
    {
        public Vec4f this[uint i]
        {
            get { return this.get(i); }
            set { this.set(i, value); }
        }

        public Vec4f this[int i]
        {
            get { return this.get((uint)i); }
            set { this.set((uint)i, value); }
        }
    }

    public partial class Vec4dArray
    {
        public Vec4d this[uint i]
        {
            get { return this.get(i); }
            set { this.set(i, value); }
        }

        public Vec4d this[int i]
        {
            get { return this.get((uint)i); }
            set { this.set((uint)i, value); }
        }
    }

    public partial class Vec4ubArray
    {
        public Vec4ub this[uint i]
        {
            get { return this.get(i); }
            set { this.set(i, value); }
        }

        public Vec4ub this[int i]
        {
            get { return this.get((uint)i); }
            set { this.set((uint)i, value); }
        }
    }

    public partial class Box
    {
    }
}