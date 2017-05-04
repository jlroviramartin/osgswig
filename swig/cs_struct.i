//#BEGIN cs_struct
// http://permalink.gmane.org/gmane.comp.programming.swig/13253

////////////////////////////////////////////////////////////////////////
////
// The cs_struct(C++type, C#type) macro maps a C++ struct to a C# struct.
// Example:
//   %inline %{ struct Point2D { int X; int Y; }; %}
//   %cs_struct(Point2D, System.Drawing.Point)
// - Structures passed by value in C++ are passed by value in C# also
// - Pointer and reference arguments named "OUTPUT" or "result" in C are
//   mapped to "out" arguments
// - const pointers and references are passed by value into the C# proxy
// - returning pointers/references is supported; P/Invoke will dereference
//   the pointer
// - arrays/vectors/collections of structs are not supported
// - Other pointer and reference arguments are mapped to "ref" arguments
// - Structures can be returned from C++, but a bug in Microsoft's P/Invoke
//   prevents structures larger than 8 bytes to be returned without special
//   measures.
//   see http://www.nabble.com/Returning-structures-by-value-in-.NET-with-P-Invoke-(bonus:-passing-System.Drawing.Point)-t4262245.html
// - Sometimes Visual C++ cannot return C++ types correctly and the P/Invoke
//   call will fail. For example I was having trouble passing my 32-bit
//   fixed-point number class FixedPoint<BITS>, so I created %cs_struct2
//   which uses a pointer cast to fool C++ into thinking it is passing
//   something else. For example I can reinterpret FixedPoint<4> as int
//   using
//   %cs_struct2(FixedPoint<4>, int, FixedPoint4)
// - This has not been tested with Mono.
//
// The macro must be invoked BEFORE including the file that declares the
// type (if that file is included)
%define %cs_struct2_shared_part(TYPE, CTYPE, CSTYPE)
    %ignore TYPE;
    %typemap(ctype)                 TYPE*, TYPE&               %{ TYPE* %}
    %typemap(in)                    TYPE*, TYPE&               %{ $1 = $input; %}
    %typemap(varin)                 TYPE*, TYPE&               %{ $1 = $input; %}
    %typemap(memberin)              TYPE*, TYPE&               %{ $1 = $input; %}
    %typemap(out, null="NULL")      TYPE*, TYPE&               %{ $result = $1; %}
    %typemap(imtype, out="System.IntPtr")  TYPE*, TYPE&               %{ ref CSTYPE %}
    %typemap(imtype)                TYPE* OUTPUT, TYPE& OUTPUT %{ out CSTYPE %}
    %typemap(cstype, out="CSTYPE")  TYPE*, TYPE&               %{ ref CSTYPE %}
    %typemap(cstype, out="CSTYPE")  TYPE* OUTPUT, TYPE& OUTPUT %{ out CSTYPE %}
    %typemap(cstype)                const TYPE*, const TYPE&   %{ CSTYPE %}
    %typemap(csin)                  TYPE*, TYPE&               %{ ref $csinput %}
    %typemap(csin)                  TYPE* OUTPUT, TYPE& OUTPUT %{ out $csinput %}
    %typemap(csin)                  const TYPE*, const TYPE&   %{ ref $csinput %}
    %typemap(csout, excode=SWIGEXCODE) TYPE*, TYPE& {
        System.IntPtr ptr = $imcall;$excode
        CSTYPE ret = (CSTYPE)Marshal.PtrToStructure(ptr, typeof(CSTYPE));
        return ret;
    }
    %typemap(csvarout, excode=SWIGEXCODE2) TYPE*, TYPE&
    %{
        get {
            System.IntPtr ptr = $imcall;$excode
            CSTYPE ret = (CSTYPE)Marshal.PtrToStructure(ptr, typeof(CSTYPE));
            return ret;
        }
    %}
    %apply TYPE* OUTPUT { TYPE* result };
    %apply TYPE& OUTPUT { TYPE& result };
%enddef

%define %cs_struct2(TYPE, CTYPE, CSTYPE)
    %cs_struct2_shared_part(TYPE, CTYPE, CSTYPE)
    %typemap(ctype)                 TYPE          %{ CTYPE %}
    %typemap(in)                    TYPE          %{ $1 = *(TYPE*)&$input; %}
    %typemap(varin)                 TYPE          %{ $1 = *(TYPE*)&$input; %}
    %typemap(memberin)              TYPE          %{ $1 = *(TYPE*)&$input; %}
    %typemap(out, null=#CTYPE "()") TYPE          %{ $result = *(CTYPE*)&$1; %}
    %typemap(imtype)                TYPE          %{ CSTYPE %}
    %typemap(cstype)                TYPE          %{ CSTYPE %}
    %typemap(csin)                  TYPE          %{ $csinput %}
    %typemap(csout, excode=SWIGEXCODE) TYPE {
        CSTYPE ret = $imcall;$excode
        return ret;
    }
    %typemap(csvarout, excode=SWIGEXCODE2) TYPE
    %{
        get {
            CSTYPE ret = $imcall;$excode
            return ret;
        }
    %}
%enddef

%define %cs_struct(TYPE, CSTYPE)
    %cs_struct2(TYPE, TYPE, CSTYPE)
%enddef

//#END cs_struct

%define %cs_IntPtr(TYPE)
    %typemap(ctype)  TYPE * "TYPE *"
    %typemap(imtype) TYPE * "System.IntPtr"
    %typemap(cstype) TYPE * "System.IntPtr"
    %typemap(csin)   TYPE * "$csinput"
    %typemap(in)     TYPE * %{ $1 = $input; %}
    %typemap(out)    TYPE * %{ $result = $1; %}
    %typemap(csout)  TYPE * { return $imcall; }
%enddef

// Convierte un TYPE* en un IntPtr.
%define %cs_IntPtr2(TYPE)
    %typemap(imtype, out="System.IntPtr") TYPE *BUFFER_PTR "System.IntPtr"
    %typemap(cstype) TYPE *BUFFER_PTR %{ System.IntPtr %}
    %typemap(in) TYPE *BUFFER_PTR %{ $1 = ($1_ltype)$input; %}
    %typemap(out) TYPE *BUFFER_PTR %{ $result = $1; %}
    %typemap(csin) TYPE *BUFFER_PTR "$csinput"
    %typemap(csout, excode=SWIGEXCODE) TYPE *BUFFER_PTR {
        System.IntPtr ret = $imcall;$excode
        return ret;
    }
%enddef