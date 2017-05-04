//#BEGIN cs_RefUnref_Containment

%define %cs_RefUnref_Containment(TYPE)

%typemap(csbody) TYPE %{
#region cs_RefUnref -> csbody
  private System.Runtime.InteropServices.HandleRef swigCPtr;
  protected bool swigCMemOwn;

  public $csclassname(System.IntPtr cPtr, bool cMemoryOwn) {
    this.swigCPtr = new System.Runtime.InteropServices.HandleRef(this, cPtr);
    this.swigCMemOwn = cMemoryOwn;

    lock(this) {
      if (this.swigCPtr.Handle != System.IntPtr.Zero) {
#if OSG_SWIG_DEBUG
        System.Diagnostics.Debug.WriteLine("Begin Ref {0} ({1:X})", this.GetType().Name, this.swigCPtr.Handle.ToInt64());
#endif
        this._ref();
#if OSG_SWIG_DEBUG
        System.Diagnostics.Debug.WriteLine("End Ref {0} ({1:X})", this.GetType().Name, this.swigCPtr.Handle.ToInt64());
#endif
      }
    }
  }

  public static System.Runtime.InteropServices.HandleRef getCPtr($csclassname obj) {
    return (obj != null) ? obj.swigCPtr : new System.Runtime.InteropServices.HandleRef(null, System.IntPtr.Zero);
  }

  ~$csclassname() {
    lock(this) {
      if (this.swigCPtr.Handle != System.IntPtr.Zero) {
#if OSG_SWIG_DEBUG
        System.Diagnostics.Debug.WriteLine("Beging UnRef {0} ({1:X})", this.GetType().Name, this.swigCPtr.Handle.ToInt64());
#endif
        this._unref();
#if OSG_SWIG_DEBUG
        System.Diagnostics.Debug.WriteLine("End UnRef {0} ({1:X})", this.GetType().Name, this.swigCPtr.Handle.ToInt64());
#endif
      }
    }
  }

  public void AddContained(object obj) {
    this.contained.Add(obj);
  }

  public void RemoveContained(object obj) {
    this.contained.Remove(obj);
  }

  private readonly List<object> contained = new List<object>();

  public bool IsLifecycleManaged {
    get { return this.swigCMemOwn; }
    set { this.swigCMemOwn = value; }
  }

  public override bool Equals(object obj) {
    if (!(obj is $csclassname)) {
      return false;
    }
    return (($csclassname)obj).swigCPtr.Handle == this.swigCPtr.Handle;
  }

  public override int GetHashCode() {
    return (int)this.swigCPtr.Handle;
  }

  public override string ToString() {
    return "$csclassname";
  }
#endregion cs_RefUnref -> csbody
%}

%typemap(csbody_derived) TYPE %{
#region cs_RefUnref -> csbody_derived
  private System.Runtime.InteropServices.HandleRef swigCPtr;

  public $csclassname(System.IntPtr cPtr, bool cMemoryOwn) : base($imclassname.$csclazznameSWIGUpcast(cPtr), cMemoryOwn) {
    this.swigCPtr = new System.Runtime.InteropServices.HandleRef(this, cPtr);
  }

  public static System.Runtime.InteropServices.HandleRef getCPtr($csclassname obj) {
    return (obj != null) ? obj.swigCPtr : new System.Runtime.InteropServices.HandleRef(null, System.IntPtr.Zero);
  }

  public override string ToString() {
    return "$csclassname";
  }
#endregion cs_RefUnref -> csbody_derived
%}

%typemap(csfinalize) TYPE %{
%}

%typemap(csdestruct, methodname="Dispose", methodmodifiers="public") TYPE %{ {
    // cs_RefUnref -> csdestruct
    lock(this) {
      if (this.swigCPtr.Handle != System.IntPtr.Zero) {
#if OSG_SWIG_DEBUG
        System.Diagnostics.Debug.WriteLine("Begin UnRef {0} ({1:X})", this.GetType().Name, this.swigCPtr.Handle.ToInt64());
#endif
        this._unref();
#if OSG_SWIG_DEBUG
        System.Diagnostics.Debug.WriteLine("End UnRef {0} ({1:X})", this.GetType().Name, this.swigCPtr.Handle.ToInt64());
#endif
        this.swigCPtr = new System.Runtime.InteropServices.HandleRef(null, System.IntPtr.Zero);
      }
      System.GC.SuppressFinalize(this);
    }
  }
%}

%typemap(csdestruct_derived, methodname="Dispose", methodmodifiers="public") TYPE %{ {
    // cs_RefUnref -> csdestruct_derived
    lock(this) {
      if (this.swigCPtr.Handle != System.IntPtr.Zero) {
        this.swigCPtr = new System.Runtime.InteropServices.HandleRef(null, System.IntPtr.Zero);
      }
      base.Dispose();
    }
  }
%}

%enddef

//#END cs_RefUnref_Containment
