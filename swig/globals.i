// http://nickdarnell.com/swig-and-a-miss/

%include "windows.i"
%include "typemaps.i"

%include "stl.i"
%include "std_deque.i"
//%include "std_list.i"
//%include "std_iostream.i"
//%include "std_list.i"

%include "arrays_csharp.i"
%include "carrays.i"
%include "cpointer.i"

%include "cs_struct.i"

//%rename("%(firstuppercase)s", %$isfunction) ""; // foo_bar -> Foo_bar; FooBar -> FooBar

%pragma(csharp) imclassclassmodifiers="[System.Security.SuppressUnmanagedCodeSecurity]\npublic class"

%include "cs_RefUnref.i"

// Las clases se hacen publicas y parciales.

%typemap(csclassmodifiers) SWIGTYPE "public partial class"

// El acceso a los constructores, metodos y propiedades de Swig, se hace publicos.

SWIG_CSBODY_PROXY(public, public, SWIGTYPE)
SWIG_CSBODY_TYPEWRAPPER(public, public, public, SWIGTYPE)


%begin %{
   // Begin fix
%}

%runtime %{
   // Runtime fix
%}

%header %{
   // Header Fix
%}

%wrapper %{
   // Wrapper Fix
%}

%init %{
   // Init Fix
%}

#undef OSG_USE_FLOAT_BOUNDINGBOX
#undef OSG_USE_FLOAT_BOUNDINGSPHERE

%cs_struct(HWND, System.IntPtr)
%cs_struct(HDC, System.IntPtr)
%cs_struct(HINSTANCE, System.IntPtr)
%cs_struct(HGLRC, System.IntPtr)
%cs_struct(LPARAM, System.IntPtr)
%cs_struct(WPARAM, System.IntPtr)
%cs_struct(LRESULT, System.IntPtr)

%cs_IntPtr2(bool)

%cs_IntPtr2(char)
%cs_IntPtr2(unsigned char)

%cs_IntPtr2(short int)
%cs_IntPtr2(int)
%cs_IntPtr2(long int)
%cs_IntPtr2(long long int)

%cs_IntPtr2(unsigned short int)
%cs_IntPtr2(unsigned int)
%cs_IntPtr2(unsigned long int)
%cs_IntPtr2(unsigned long long int)

%cs_IntPtr2(float)
%cs_IntPtr2(double)

// Convierte void* a IntPtr.

%typemap(ctype)  void * "void *"
%typemap(imtype) void * "System.IntPtr"
%typemap(cstype) void * "System.IntPtr"
%typemap(csin)   void * "$csinput"
%typemap(in)     void * %{ $1 = $input; %}
%typemap(out)    void * %{ $result = $1; %}
%typemap(csout)  void * { return $imcall; }

// Convierte char** a string[].

%typemap(ctype) char** "char**"
%typemap(imtype) char** "string[]"
%typemap(cstype) char** "string[]"
 
%typemap(csin) char** "$csinput"
%typemap(csout, excode=SWIGEXCODE) char**, const char**& {
    int ret = $imcall;$excode
    return ret;
  }
%typemap(csvarin, excode=SWIGEXCODE2) char** %{
    set {
      $imcall;$excode
    } %}
%typemap(csvarout, excode=SWIGEXCODE2) char** %{
    get {
      int ret = $imcall;$excode
      return ret;
    } %}
 
%typemap(in) char** %{ $1 = $input; %}
%typemap(out) char** %{ $result = $1; %}

// Los argumentos de tipo referencia & se acceden como ref.

%define %TypeRefParam(TYPE)
    %apply TYPE& INOUT { TYPE& };
%enddef
 
%TypeRefParam(bool)

%TypeRefParam(char)
%TypeRefParam(unsigned char)

%TypeRefParam(short int);
%TypeRefParam(int);
%TypeRefParam(long int);
%TypeRefParam(long long int);

%TypeRefParam(unsigned short int);
%TypeRefParam(unsigned int);
%TypeRefParam(unsigned long int);
%TypeRefParam(unsigned long long int);

%TypeRefParam(float);
%TypeRefParam(double);

// Se crean clases para el uso de punteros.

%pointer_class(bool, SwigBoolPointer);

%pointer_class(char, SwigCharPointer);
%pointer_class(unsigned char, SwigUCharPointer);

%pointer_class(short int, SwigShortPointer);
%pointer_class(int, SwigIntPointer);
%pointer_class(long int, SwigLIntPointer);
%pointer_class(long long int, SwigLongPointer);

%pointer_class(unsigned short int, SwigUShortPointer);
%pointer_class(unsigned int, SwigUIntPointer);
%pointer_class(unsigned long int, SwigULIntPointer);
%pointer_class(unsigned long long int, SwigULongPointer);

%pointer_class(float, SwigFloatPointer);
%pointer_class(double, SwigDoublePointer);

// Se crean clases para el uso de arrays.

%array_class(bool, SwigBoolArray);

%array_class(char, SwigCharArray);
%array_class(unsigned char, SwigUCharArray);

%array_class(short int, SwigShortArray);
%array_class(int, SwigIntArray);
%array_class(long int, SwigLIntArray);
%array_class(long long int, SwigLongArray);

%array_class(unsigned short int, SwigUShortArray);
%array_class(unsigned int, SwigUIntArray);
%array_class(unsigned long int, SwigULIntArray);
%array_class(unsigned long long int, SwigULongArray);

%array_class(float, SwigFloatArray);
%array_class(double, SwigDoubleArray);
