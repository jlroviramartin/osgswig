%module(directors="1") OsgDBModule;
#pragma SWIG nowarn=516,473

%include globals.i
%import OpenThreads/OpenThreads.i
%import osg/osg.i

#define OSG_3_2_1
%{
#define OSG_3_2_1
%}

%typemap(csimports) SWIGTYPE %{
// %typemap(csimports) SWIGTYPE
using OpenThreads;
using osg;
%}

%pragma(csharp) moduleimports=%{
// %pragma(csharp) moduleimports
using OpenThreads;
using osg;
%}

%pragma(csharp) imclassimports=%{
// %pragma(csharp) imclassimports
using OpenThreads;
using osg;
%}

%define OSGDB_EXPORT
%enddef

//#BEGIN #include

%{
#include <osgDB/Version>
#include <osgDB/Export>

#include <osgDB/AuthenticationMap>

#include <osgDB/ReaderWriter>
#include <osgDB/SharedStateManager>

#include <osgDB/FileUtils>
#include <osgDB/ReadFile>
#include <osgDB/WriteFile>

#include <osgDB/DatabasePager>
#include <osgDB/ImagePager>

#include <osgDB/DatabaseRevisions>

#include <osgDB/FileCache>
#include <osgDB/Options>
#include <osgDB/Archive>

#include <osgDB/Callbacks>

using namespace osg;
using namespace osgDB;
%}

//#END #include

//#BEGIN AuthenticationMap
    %cs_RefUnref(osgDB::AuthenticationDetails)
    %cs_RefUnref(osgDB::AuthenticationMap)
    %include <osgDB/AuthenticationMap>
//#END AuthenticationMap

//#BEGIN ReaderWriter
    %cs_RefUnref(osgDB::ReaderWriter)
    %ignore osgDB::ReaderWriter::ReadResult::operator <;
    %ignore osgDB::ReaderWriter::WriteResult::operator <;
    %include <osgDB/ReaderWriter>
//#END ReaderWriter

//#BEGIN SharedStateManager
    %cs_RefUnref(osgDB::SharedStateManager)
    %include <osgDB/SharedStateManager>
//#BEGIN SharedStateManager

//#BEGIN FileUtils
    %include <osgDB/FileUtils>
//#BEGIN FileUtils

//#BEGIN ReadFile
    %newobject osgDB::readObjectFile;
    %newobject osgDB::readImageFile;
    %newobject osgDB::readHeightFieldFile;
    %newobject osgDB::readNodeFile;
    %newobject osgDB::readNodeFiles;
    %newobject osgDB::readShaderFile;

    %newobject osgDB::readRefObjectFile;
    %newobject osgDB::readRefImageFile;
    %newobject osgDB::readRefHeightFieldFile;
    %newobject osgDB::readRefNodeFile;
    %newobject osgDB::readRefShaderFile;

    %include osgDB/ReadFile
//#END ReadFile

//#BEGIN WriteFile
    %include <osgDB/WriteFile>
//#BEGIN WriteFile

//#BEGIN DatabasePager
    %cs_RefUnref(osgDB::DatabasePager)
    %cs_RefUnref(osgDB::DatabasePager::DatabaseThread)
    %cs_RefUnref(osgDB::DatabasePager::PagedLODList)
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgDB::DatabasePager::DatabaseThread;

    %include osgDB/DatabasePager

    %extend osgDB::DatabasePager::DatabaseThread {
    public:
        OpenThreads::Thread* asThread() {
            return self;
        }
    }

    %template(DatabasePagerRef)      osg::ref_ptr<osgDB::DatabasePager>;
    %template(DatabasePagerObserver) osg::observer_ptr<osgDB::DatabasePager>;
//#END DatabasePager

//#BEGIN ImagePager
    %cs_RefUnref(osgDB::ImagePager)
    %cs_RefUnref(osgDB::ImagePager::ImageThread)
    %warnfilter(SWIGWARN_CSHARP_MULTIPLE_INHERITANCE) osgDB::ImagePager::ImageThread;

    %include osgDB/ImagePager

    %extend osgDB::ImagePager::ImageThread {
    public:
        OpenThreads::Thread* asThread() {
            return self;
        }
    }

    %template(ImagePagerRef)      osg::ref_ptr<osgDB::ImagePager>;
    %template(ImagePagerObserver) osg::observer_ptr<osgDB::ImagePager>;
//#END ImagePager

//#BEGIN DatabaseRevisions
    %cs_RefUnref(osgDB::FileList)
    %cs_RefUnref(osgDB::DatabaseRevision)
    %cs_RefUnref(osgDB::DatabaseRevisions)

    %include osgDB/DatabaseRevisions

    %template(DatabaseRevisionRef)       osg::ref_ptr<osgDB::DatabaseRevision>;
    %template(DatabaseRevisionObserver)  osg::observer_ptr<osgDB::DatabaseRevision>;
    %template(DatabaseRevisionsRef)      osg::ref_ptr<osgDB::DatabaseRevisions>;
    %template(DatabaseRevisionsObserver) osg::observer_ptr<osgDB::DatabaseRevisions>;

    //%template(DatabaseRevisionList)   std::list< osg::ref_ptr<osgDB::DatabaseRevision> >;
    %template(DatabaseRevisionVector) std::vector< osg::ref_ptr<osgDB::DatabaseRevision> >;
    //%template(DatabaseRevisionsList)  std::list< osg::ref_ptr<osgDB::DatabaseRevisions> >;
//#END DatabaseRevisions

//#BEGIN FileCache
    %cs_RefUnref(osgDB::FileCache)
    %include osgDB/FileCache
//#END FileCache

//#BEGIN Callbacks
    %cs_RefUnref(osgDB::FindFileCallback)
    %cs_RefUnref(osgDB::ReadFileCallback)
    %cs_RefUnref(osgDB::WriteFileCallback)
    %cs_RefUnref(osgDB::FileLocationCallback)
    %feature("director") osgDB::FindFileCallback;
    %feature("director") osgDB::ReadFileCallback;
    %feature("director") osgDB::WriteFileCallback;
    %feature("director") osgDB::FileLocationCallback;
    %include osgDB/Callbacks
//#END Callbacks

//#BEGIN Options
    %cs_RefUnref(osgDB::Options)
    %include osgDB/Options
//#END Options

//#BEGIN Archive
    %cs_RefUnref(osgDB::Archive)
    %include osgDB/Archive
//#END Archive
