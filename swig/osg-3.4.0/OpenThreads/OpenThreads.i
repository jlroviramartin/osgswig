%module(directors="1") OpenThreadsModule;
#pragma SWIG nowarn=516,473

%include globals.i

%typemap(csimports) SWIGTYPE %{
%}

%define OPENTHREAD_EXPORT_DIRECTIVE
%enddef

//#BEGIN #include

%{
#include <OpenThreads/Atomic>
#include <OpenThreads/Mutex>
#include <OpenThreads/Barrier>
#include <OpenThreads/Condition>
#include <OpenThreads/Thread>

#include <OpenThreads/Block>

using namespace OpenThreads;
%}

//#END #include

//#BEGIN Atomic
    %ignore OpenThreads::AtomicPtr;
    %rename(Inc) OpenThreads::Atomic::operator ++;
    %rename(Dec) OpenThreads::Atomic::operator --;
    %rename(Set) OpenThreads::Atomic::operator =;
    %rename(Value) OpenThreads::Atomic::operator unsigned;

    %include OpenThreads/Atomic
//#END Atomic

//#BEGIN Mutex
    %rename(Lock) OpenThreads::Mutex::lock;
    %rename(Unlock) OpenThreads::Mutex::unlock;
    %rename(Trylock) OpenThreads::Mutex::trylock;

    %ignore OpenThreads::Mutex::Mutex(const Mutex &/*m*/);
    %ignore OpenThreads::Mutex::operator=(const Mutex &/*m*/);

    %include OpenThreads/Mutex
//#END Mutex

//#BEGIN Barrier
    %include OpenThreads/Barrier
//#END Barrier

//#BEGIN Condition
    %ignore OpenThreads::Condition::Condition(const Condition &/*c*/);
    %ignore OpenThreads::Condition::operator=(const Condition &/*c*/);

    %include OpenThreads/Condition
//#END Condition

//#BEGIN Thread
    %ignore OpenThreads::Thread::getImplementation();

    %include OpenThreads/Thread
//#END Thread

//#BEGIN Block
    %include OpenThreads/Block
//#END Block
