/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
/**
    Loading and unloading shared libraries.
*/
module dplug.core.sharedlib;

import dplug.core.nogc;
import dplug.core.alignedbuffer;

//version = debugSharedLibs;

version(debugSharedLibs)
{
    import core.stdc.stdio;
}

/// Shared library ressource
struct SharedLib
{
nothrow:
@nogc:

    void load(string name)
    {
        version(debugSharedLibs)
        {
            auto lib = CString(name);
            printf("loading dynlib '%s'\n", lib.storage);
        }

        if(isLoaded)
            return;
        _name = name;
        _hlib = LoadSharedLib(name);
        if(_hlib is null)
            assert(false);
    }

    bool hasSymbol(string symbolName)
    {
        assert(isLoaded());
        void* sym = GetSymbol(_hlib, symbolName);
        return sym != null;
    }

    void* loadSymbol(string symbolName)
    {
        assert(isLoaded());

        version(debugSharedLibs)
        {
            auto sb = CString(symbolName);
            printf("  loading symbol '%s'\n", sb.storage);
        }

        void* sym = GetSymbol(_hlib, symbolName);
        if(!sym)
            assert(false);
        return sym;
    }

    void unload()
    {
        if(isLoaded())
        {
            UnloadSharedLib(_hlib);
            _hlib = null;

            version(debugSharedLibs)
            {
                auto lib = CString(_name);
                printf("unloaded dynlib '%s'\n", lib.storage);
            }
        }
    }

    /// Returns true if the shared library is currently loaded, false otherwise.
    bool isLoaded()
    {
        return (_hlib !is null);
    }

private:
    string _name;
    SharedLibHandle _hlib;
}

/// Loader. In debug mode, this fills functions pointers with null.
abstract class SharedLibLoader
{
nothrow:
@nogc:

    this(string libName)
    {
        _libName = libName;
        version(debugSharedLibs)
        {
            _funcPointers = makeAlignedBuffer!(void**)();
        }
    }

    /// Binds a function pointer to a symbol in this loader's shared library.
    final void bindFunc(void** ptr, string funcName)
    {
        void* func = _lib.loadSymbol(funcName);
        version(debugSharedLibs)
        {
            _funcPointers.pushBack(ptr);
        }
        *ptr = func;
    }

    final void load()
    {
        _lib.load(_libName);
        loadSymbols();
    }

    // Unload the library, and sets all functions pointer to null.
    final void unload()
    {
        _lib.unload();

        version(debugSharedLibs)
        {
            // Sets all registered functions pointers to null
            // so that they can't be reused
            foreach(ptr; _funcPointers[])
                *ptr = null;

            _funcPointers.clearContents();
        }
    }

protected:

    /// Implemented by subclasses to load all symbols with `bindFunc`.
    abstract void loadSymbols();

private:
    string _libName;
    SharedLib _lib;
    version(debugSharedLibs)
        Vec!(void**) _funcPointers;
}


private:

alias void* SharedLibHandle;

version(Posix)
{
    import core.sys.posix.dlfcn;

    private {

        SharedLibHandle LoadSharedLib(string libName) nothrow @nogc
        {
            return dlopen(CString(libName), RTLD_NOW);
        }

        void UnloadSharedLib(SharedLibHandle hlib) nothrow @nogc
        {
            dlclose(hlib);
        }

        void* GetSymbol(SharedLibHandle hlib, string symbolName) nothrow @nogc
        {
            return dlsym(hlib, CString(symbolName));
        }

        string GetErrorStr()
        {
            import std.conv : to;

            auto err = dlerror();
            if(err is null)
                return "Unknown Error";

            return to!string(err);
        }
    }
}
else version(Windows)
{
    import core.sys.windows.windows;

    private {
        nothrow @nogc
        SharedLibHandle LoadSharedLib(string libName)
        {
            return LoadLibraryA(CString(libName));
        }

        nothrow @nogc
        void UnloadSharedLib(SharedLibHandle hlib)
        {
            FreeLibrary(hlib);
        }

        nothrow @nogc
        void* GetSymbol(SharedLibHandle hlib, string symbolName)
        {
            return GetProcAddress(hlib, CString(symbolName));
        }

        nothrow @nogc
        string GetErrorStr()
        {
            import std.windows.syserror;
            DWORD err = GetLastError();
            return assumeNothrowNoGC(
                    (DWORD err)
                    {
                        return sysErrorString(err);
                    }
                )(err);
        }
    }
} else {
    static assert(0, "Derelict does not support this platform.");
}
