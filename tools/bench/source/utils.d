/**
Copyright: Auburn Sounds 2015-2018.
License:   All Rights Reserved.
*/
module utils;

import std.process;
import std.string;
import std.file;
import std.path;

import colorize;

string white(string s) @property
{
    return s.color(fg.light_white);
}

string grey(string s) @property
{
    return s.color(fg.white);
}

string cyan(string s) @property
{
    return s.color(fg.light_cyan);
}

string green(string s) @property
{
    return s.color(fg.light_green);
}

string yellow(string s) @property
{
    return s.color(fg.light_yellow);
}

string red(string s) @property
{
    return s.color(fg.light_red);
}

string magenta(string s) @property
{
    return s.color(fg.light_magenta);
}

void info(string msg)
{
    cwritefln("info: %s".white, msg);
}

void warning(string msg)
{
    cwritefln("warning: %s".yellow, msg);
}

void error(string msg)
{
    cwritefln("error: %s".red, msg);
}

class ExternalProgramErrored : Exception
{
    public
    {
        @safe pure nothrow this(int errorCode,
                                string message,
                                string file =__FILE__,
                                size_t line = __LINE__,
                                Throwable next = null)
        {
            super(message, file, line, next);
            this.errorCode = errorCode;
        }

        int errorCode;
    }
}


void safeCommand(string cmd)
{
    cwritefln("$ %s".cyan, cmd);
    auto pid = spawnShell(cmd);
    auto errorCode = wait(pid);
    if (errorCode != 0)
        throw new ExternalProgramErrored(errorCode, format("Command '%s' returned %s", cmd, errorCode));
}

// Currently this only escapes spaces...
string escapeShellArgument(string arg)
{
    version(Windows)
    {
        return `"` ~ arg ~ `"`;
    }
    else
        return arg.replace(" ", "\\ ");
}

/// Recursive directory copy.
/// https://forum.dlang.org/post/n7hc17$19jg$1@digitalmars.com
/// Returns: number of copied files
int copyRecurse(string from, string to)
{
  //  from = absolutePath(from);
  //  to = absolutePath(to);

    if (isDir(from))
    {
        mkdirRecurse(to);

        auto entries = dirEntries(from, SpanMode.shallow);
        int result = 0;
        foreach (entry; entries)
        {
            auto dst = buildPath(to, entry.name[from.length + 1 .. $]);
            result += copyRecurse(entry.name, dst);
        }
        return result;
    }
    else
    {
        std.file.copy(from, to);
        return 1;
    }
}

