module dplug.lv2.lv2;
/*
  LV2 - An audio plugin interface specification.
  Copyright 2006-2012 Steve Harris, David Robillard.

  Based on LADSPA, Copyright 2000-2002 Richard W.E. Furse,
  Paul Barton-Davis, Stefan Westerfeld.

  Permission to use, copy, modify, and/or distribute this software for any
  purpose with or without fee is hereby granted, provided that the above
  copyright notice and this permission notice appear in all copies.

  THIS SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/
/**
* lv2core/lv2.h translation to D
* Copyright: Cut Through Recordings 2018.
* Copyright: Copyright Auburn Sounds 2018.
* License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
* Authors:   Ethan Reker
*/

/**
   @defgroup lv2core LV2 Core

   Core LV2 specification, see <http://lv2plug.in/ns/lv2core> for details.

   @{
*/
// #include <stdint.h>
import core.stdc.stdint;

enum LV2_CORE_URI  =  "http://lv2plug.in/ns/lv2core";  ///< http://lv2plug.in/ns/lv2core
enum LV2_CORE_PREFIX = LV2_CORE_URI ~ "#";                ///< http://lv2plug.in/ns/lv2core#

enum LV2_CORE__AllpassPlugin    =  LV2_CORE_PREFIX ~ "AllpassPlugin"     ;  ///< http://lv2plug.in/ns/lv2core#AllpassPlugin
enum LV2_CORE__AmplifierPlugin  =  LV2_CORE_PREFIX ~ "AmplifierPlugin"   ;  ///< http://lv2plug.in/ns/lv2core#AmplifierPlugin
enum LV2_CORE__AnalyserPlugin   =  LV2_CORE_PREFIX ~ "AnalyserPlugin"    ;  ///< http://lv2plug.in/ns/lv2core#AnalyserPlugin
enum LV2_CORE__AudioPort        =  LV2_CORE_PREFIX ~ "AudioPort"         ;  ///< http://lv2plug.in/ns/lv2core#AudioPort
enum LV2_CORE__BandpassPlugin   =  LV2_CORE_PREFIX ~ "BandpassPlugin"    ;  ///< http://lv2plug.in/ns/lv2core#BandpassPlugin
enum LV2_CORE__CVPort           =  LV2_CORE_PREFIX ~ "CVPort"            ;  ///< http://lv2plug.in/ns/lv2core#CVPort
enum LV2_CORE__ChorusPlugin     =  LV2_CORE_PREFIX ~ "ChorusPlugin"      ;  ///< http://lv2plug.in/ns/lv2core#ChorusPlugin
enum LV2_CORE__CombPlugin       =  LV2_CORE_PREFIX ~ "CombPlugin"        ;  ///< http://lv2plug.in/ns/lv2core#CombPlugin
enum LV2_CORE__CompressorPlugin =  LV2_CORE_PREFIX ~ "CompressorPlugin"  ;  ///< http://lv2plug.in/ns/lv2core#CompressorPlugin
enum LV2_CORE__ConstantPlugin   =  LV2_CORE_PREFIX ~ "ConstantPlugin"    ;  ///< http://lv2plug.in/ns/lv2core#ConstantPlugin
enum LV2_CORE__ControlPort      =  LV2_CORE_PREFIX ~ "ControlPort"       ;  ///< http://lv2plug.in/ns/lv2core#ControlPort
enum LV2_CORE__ConverterPlugin  =  LV2_CORE_PREFIX ~ "ConverterPlugin"   ;  ///< http://lv2plug.in/ns/lv2core#ConverterPlugin
enum LV2_CORE__DelayPlugin      =  LV2_CORE_PREFIX ~ "DelayPlugin"       ;  ///< http://lv2plug.in/ns/lv2core#DelayPlugin
enum LV2_CORE__DistortionPlugin =  LV2_CORE_PREFIX ~ "DistortionPlugin"  ;  ///< http://lv2plug.in/ns/lv2core#DistortionPlugin
enum LV2_CORE__DynamicsPlugin   =  LV2_CORE_PREFIX ~ "DynamicsPlugin"    ;  ///< http://lv2plug.in/ns/lv2core#DynamicsPlugin
enum LV2_CORE__EQPlugin         =  LV2_CORE_PREFIX ~ "EQPlugin"          ;  ///< http://lv2plug.in/ns/lv2core#EQPlugin
enum LV2_CORE__EnvelopePlugin   =  LV2_CORE_PREFIX ~ "EnvelopePlugin"    ;  ///< http://lv2plug.in/ns/lv2core#EnvelopePlugin
enum LV2_CORE__ExpanderPlugin   =  LV2_CORE_PREFIX ~ "ExpanderPlugin"    ;  ///< http://lv2plug.in/ns/lv2core#ExpanderPlugin
enum LV2_CORE__ExtensionData    =  LV2_CORE_PREFIX ~ "ExtensionData"     ;  ///< http://lv2plug.in/ns/lv2core#ExtensionData
enum LV2_CORE__Feature          =  LV2_CORE_PREFIX ~ "Feature"           ;  ///< http://lv2plug.in/ns/lv2core#Feature
enum LV2_CORE__FilterPlugin     =  LV2_CORE_PREFIX ~ "FilterPlugin"      ;  ///< http://lv2plug.in/ns/lv2core#FilterPlugin
enum LV2_CORE__FlangerPlugin    =  LV2_CORE_PREFIX ~ "FlangerPlugin"     ;  ///< http://lv2plug.in/ns/lv2core#FlangerPlugin
enum LV2_CORE__FunctionPlugin   =  LV2_CORE_PREFIX ~ "FunctionPlugin"    ;  ///< http://lv2plug.in/ns/lv2core#FunctionPlugin
enum LV2_CORE__GatePlugin       =  LV2_CORE_PREFIX ~ "GatePlugin"        ;  ///< http://lv2plug.in/ns/lv2core#GatePlugin
enum LV2_CORE__GeneratorPlugin  =  LV2_CORE_PREFIX ~ "GeneratorPlugin"   ;  ///< http://lv2plug.in/ns/lv2core#GeneratorPlugin
enum LV2_CORE__HighpassPlugin   =  LV2_CORE_PREFIX ~ "HighpassPlugin"    ;  ///< http://lv2plug.in/ns/lv2core#HighpassPlugin
enum LV2_CORE__InputPort        =  LV2_CORE_PREFIX ~ "InputPort"         ;  ///< http://lv2plug.in/ns/lv2core#InputPort
enum LV2_CORE__InstrumentPlugin =  LV2_CORE_PREFIX ~ "InstrumentPlugin"  ;  ///< http://lv2plug.in/ns/lv2core#InstrumentPlugin
enum LV2_CORE__LimiterPlugin    =  LV2_CORE_PREFIX ~ "LimiterPlugin"     ;  ///< http://lv2plug.in/ns/lv2core#LimiterPlugin
enum LV2_CORE__LowpassPlugin    =  LV2_CORE_PREFIX ~ "LowpassPlugin"     ;  ///< http://lv2plug.in/ns/lv2core#LowpassPlugin
enum LV2_CORE__MixerPlugin      =  LV2_CORE_PREFIX ~ "MixerPlugin"       ;  ///< http://lv2plug.in/ns/lv2core#MixerPlugin
enum LV2_CORE__ModulatorPlugin  =  LV2_CORE_PREFIX ~ "ModulatorPlugin"   ;  ///< http://lv2plug.in/ns/lv2core#ModulatorPlugin
enum LV2_CORE__MultiEQPlugin    =  LV2_CORE_PREFIX ~ "MultiEQPlugin"     ;  ///< http://lv2plug.in/ns/lv2core#MultiEQPlugin
enum LV2_CORE__OscillatorPlugin =  LV2_CORE_PREFIX ~ "OscillatorPlugin"  ;  ///< http://lv2plug.in/ns/lv2core#OscillatorPlugin
enum LV2_CORE__OutputPort       =  LV2_CORE_PREFIX ~ "OutputPort"        ;  ///< http://lv2plug.in/ns/lv2core#OutputPort
enum LV2_CORE__ParaEQPlugin     =  LV2_CORE_PREFIX ~ "ParaEQPlugin"      ;  ///< http://lv2plug.in/ns/lv2core#ParaEQPlugin
enum LV2_CORE__PhaserPlugin     =  LV2_CORE_PREFIX ~ "PhaserPlugin"      ;  ///< http://lv2plug.in/ns/lv2core#PhaserPlugin
enum LV2_CORE__PitchPlugin      =  LV2_CORE_PREFIX ~ "PitchPlugin"       ;  ///< http://lv2plug.in/ns/lv2core#PitchPlugin
enum LV2_CORE__Plugin           =  LV2_CORE_PREFIX ~ "Plugin"            ;  ///< http://lv2plug.in/ns/lv2core#Plugin
enum LV2_CORE__PluginBase       =  LV2_CORE_PREFIX ~ "PluginBase"        ;  ///< http://lv2plug.in/ns/lv2core#PluginBase
enum LV2_CORE__Point            =  LV2_CORE_PREFIX ~ "Point"             ;  ///< http://lv2plug.in/ns/lv2core#Point
enum LV2_CORE__Port             =  LV2_CORE_PREFIX ~ "Port"              ;  ///< http://lv2plug.in/ns/lv2core#Port
enum LV2_CORE__PortProperty     =  LV2_CORE_PREFIX ~ "PortProperty"      ;  ///< http://lv2plug.in/ns/lv2core#PortProperty
enum LV2_CORE__Resource         =  LV2_CORE_PREFIX ~ "Resource"          ;  ///< http://lv2plug.in/ns/lv2core#Resource
enum LV2_CORE__ReverbPlugin     =  LV2_CORE_PREFIX ~ "ReverbPlugin"      ;  ///< http://lv2plug.in/ns/lv2core#ReverbPlugin
enum LV2_CORE__ScalePoint       =  LV2_CORE_PREFIX ~ "ScalePoint"        ;  ///< http://lv2plug.in/ns/lv2core#ScalePoint
enum LV2_CORE__SimulatorPlugin  =  LV2_CORE_PREFIX ~ "SimulatorPlugin"   ;  ///< http://lv2plug.in/ns/lv2core#SimulatorPlugin
enum LV2_CORE__SpatialPlugin    =  LV2_CORE_PREFIX ~ "SpatialPlugin"     ;  ///< http://lv2plug.in/ns/lv2core#SpatialPlugin
enum LV2_CORE__Specification    =  LV2_CORE_PREFIX ~ "Specification"     ;  ///< http://lv2plug.in/ns/lv2core#Specification
enum LV2_CORE__SpectralPlugin   =  LV2_CORE_PREFIX ~ "SpectralPlugin"    ;  ///< http://lv2plug.in/ns/lv2core#SpectralPlugin
enum LV2_CORE__UtilityPlugin    =  LV2_CORE_PREFIX ~ "UtilityPlugin"     ;  ///< http://lv2plug.in/ns/lv2core#UtilityPlugin
enum LV2_CORE__WaveshaperPlugin =  LV2_CORE_PREFIX ~ "WaveshaperPlugin"  ;  ///< http://lv2plug.in/ns/lv2core#WaveshaperPlugin
enum LV2_CORE__appliesTo        =  LV2_CORE_PREFIX ~ "appliesTo"         ;  ///< http://lv2plug.in/ns/lv2core#appliesTo
enum LV2_CORE__binary           =  LV2_CORE_PREFIX ~ "binary"            ;  ///< http://lv2plug.in/ns/lv2core#binary
enum LV2_CORE__connectionOptional = LV2_CORE_PREFIX ~ "connectionOptional"   ;  ///< http://lv2plug.in/ns/lv2core#connectionOptional
enum LV2_CORE__control          =  LV2_CORE_PREFIX ~ "control"           ;  ///< http://lv2plug.in/ns/lv2core#control
enum LV2_CORE__default          =  LV2_CORE_PREFIX ~ "default"           ;  ///< http://lv2plug.in/ns/lv2core#default
enum LV2_CORE__designation      =  LV2_CORE_PREFIX ~ "designation"       ;  ///< http://lv2plug.in/ns/lv2core#designation
enum LV2_CORE__documentation    =  LV2_CORE_PREFIX ~ "documentation"     ;  ///< http://lv2plug.in/ns/lv2core#documentation
enum LV2_CORE__enumeration      =  LV2_CORE_PREFIX ~ "enumeration"       ;  ///< http://lv2plug.in/ns/lv2core#enumeration
enum LV2_CORE__extensionData    =  LV2_CORE_PREFIX ~ "extensionData"     ;  ///< http://lv2plug.in/ns/lv2core#extensionData
enum LV2_CORE__freeWheeling     =  LV2_CORE_PREFIX ~ "freeWheeling"      ;  ///< http://lv2plug.in/ns/lv2core#freeWheeling
enum LV2_CORE__hardRTCapable    =  LV2_CORE_PREFIX ~ "hardRTCapable"     ;  ///< http://lv2plug.in/ns/lv2core#hardRTCapable
enum LV2_CORE__inPlaceBroken    =  LV2_CORE_PREFIX ~ "inPlaceBroken"     ;  ///< http://lv2plug.in/ns/lv2core#inPlaceBroken
enum LV2_CORE__index            =  LV2_CORE_PREFIX ~ "index"             ;  ///< http://lv2plug.in/ns/lv2core#index
enum LV2_CORE__integer          =  LV2_CORE_PREFIX ~ "integer"           ;  ///< http://lv2plug.in/ns/lv2core#integer
enum LV2_CORE__isLive           =  LV2_CORE_PREFIX ~ "isLive"            ;  ///< http://lv2plug.in/ns/lv2core#isLive
enum LV2_CORE__latency          =  LV2_CORE_PREFIX ~ "latency"           ;  ///< http://lv2plug.in/ns/lv2core#latency
enum LV2_CORE__maximum          =  LV2_CORE_PREFIX ~ "maximum"           ;  ///< http://lv2plug.in/ns/lv2core#maximum
enum LV2_CORE__microVersion     =  LV2_CORE_PREFIX ~ "microVersion"      ;  ///< http://lv2plug.in/ns/lv2core#microVersion
enum LV2_CORE__minimum          =  LV2_CORE_PREFIX ~ "minimum"           ;  ///< http://lv2plug.in/ns/lv2core#minimum
enum LV2_CORE__minorVersion     =  LV2_CORE_PREFIX ~ "minorVersion"      ;  ///< http://lv2plug.in/ns/lv2core#minorVersion
enum LV2_CORE__name             =  LV2_CORE_PREFIX ~ "name"              ;  ///< http://lv2plug.in/ns/lv2core#name
enum LV2_CORE__optionalFeature  =  LV2_CORE_PREFIX ~ "optionalFeature"   ;  ///< http://lv2plug.in/ns/lv2core#optionalFeature
enum LV2_CORE__port             =  LV2_CORE_PREFIX ~ "port"              ;  ///< http://lv2plug.in/ns/lv2core#port
enum LV2_CORE__portProperty     =  LV2_CORE_PREFIX ~ "portProperty"      ;  ///< http://lv2plug.in/ns/lv2core#portProperty
enum LV2_CORE__project          =  LV2_CORE_PREFIX ~ "project"           ;  ///< http://lv2plug.in/ns/lv2core#project
enum LV2_CORE__prototype        =  LV2_CORE_PREFIX ~ "prototype"         ;  ///< http://lv2plug.in/ns/lv2core#prototype
enum LV2_CORE__reportsLatency   =  LV2_CORE_PREFIX ~ "reportsLatency"    ;  ///< http://lv2plug.in/ns/lv2core#reportsLatency
enum LV2_CORE__requiredFeature  =  LV2_CORE_PREFIX ~ "requiredFeature"   ;  ///< http://lv2plug.in/ns/lv2core#requiredFeature
enum LV2_CORE__sampleRate       =  LV2_CORE_PREFIX ~ "sampleRate"        ;  ///< http://lv2plug.in/ns/lv2core#sampleRate
enum LV2_CORE__scalePoint       =  LV2_CORE_PREFIX ~ "scalePoint"        ;  ///< http://lv2plug.in/ns/lv2core#scalePoint
enum LV2_CORE__symbol           =  LV2_CORE_PREFIX ~ "symbol"            ;  ///< http://lv2plug.in/ns/lv2core#symbol
enum LV2_CORE__toggled          =  LV2_CORE_PREFIX ~ "toggled"           ;  ///< http://lv2plug.in/ns/lv2core#toggled

extern(C) {

/**
   Plugin Instance Handle.

   This is a handle for one particular instance of a plugin.  It is valid to
   compare to NULL (or 0 for C++) but otherwise the host MUST NOT attempt to
   interpret it.
*/
alias LV2_Handle = void *;

/**
   Feature.

   Features allow hosts to make additional functionality available to plugins
   without requiring modification to the LV2 API.  Extensions may define new
   features and specify the `URI` and `data` to be used if necessary.
   Some features, such as lv2:isLive, do not require the host to pass data.
*/
struct _LV2_Feature {
	/**
	   A globally unique, case-sensitive identifier (URI) for this feature.

	   This MUST be a valid URI string as defined by RFC 3986.
	*/
	const char * URI;

	/**
	   Pointer to arbitrary data.

	   The format of this data is defined by the extension which describes the
	   feature with the given `URI`.
	*/
	void * data;
}

alias LV2_Feature = _LV2_Feature;

/**
   Plugin Descriptor.

   This structure provides the core functions necessary to instantiate and use
   a plugin.
*/
struct _LV2_Descriptor {
	/**
	   A globally unique, case-sensitive identifier for this plugin.

	   This MUST be a valid URI string as defined by RFC 3986.  All plugins with
	   the same URI MUST be compatible to some degree, see
	   http://lv2plug.in/ns/lv2core for details.
	*/
	const char * URI;

	/**
	   Instantiate the plugin.

	   Note that instance initialisation should generally occur in activate()
	   rather than here. If a host calls instantiate(), it MUST call cleanup()
	   at some point in the future.

	   @param descriptor Descriptor of the plugin to instantiate.

	   @param sample_rate Sample rate, in Hz, for the new plugin instance.

	   @param bundle_path Path to the LV2 bundle which contains this plugin
	   binary. It MUST include the trailing directory separator (e.g. '/') so
	   that simply appending a filename will yield the path to that file in the
	   bundle.

	   @param features A NULL terminated array of LV2_Feature structs which
	   represent the features the host supports. Plugins may refuse to
	   instantiate if required features are not found here. However, hosts MUST
	   NOT use this as a discovery mechanism: instead, use the RDF data to
	   determine which features are required and do not attempt to instantiate
	   unsupported plugins at all. This parameter MUST NOT be NULL, i.e. a host
	   that supports no features MUST pass a single element array containing
	   NULL.

	   @return A handle for the new plugin instance, or NULL if instantiation
	   has failed.
	*/
	// LV2_Handle (*instantiate)(const struct _LV2_Descriptor * descriptor,
	//                           double                         sample_rate,
	//                           const char *                   bundle_path,
	//                           const LV2_Feature *const *     features);
	LV2_Handle function(const _LV2_Descriptor * descriptor,
	                          double                         sample_rate,
	                          const char *                   bundle_path,
	                          const(LV2_Feature*)* features) instantiate;

	/**
	   Connect a port on a plugin instance to a memory location.

	   Plugin writers should be aware that the host may elect to use the same
	   buffer for more than one port and even use the same buffer for both
	   input and output (see lv2:inPlaceBroken in lv2.ttl).

	   If the plugin has the feature lv2:hardRTCapable then there are various
	   things that the plugin MUST NOT do within the connect_port() function;
	   see lv2core.ttl for details.

	   connect_port() MUST be called at least once for each port before run()
	   is called, unless that port is lv2:connectionOptional. The plugin must
	   pay careful attention to the block size passed to run() since the block
	   allocated may only just be large enough to contain the data, and is not
	   guaranteed to remain constant between run() calls.

	   connect_port() may be called more than once for a plugin instance to
	   allow the host to change the buffers that the plugin is reading or
	   writing. These calls may be made before or after activate() or
	   deactivate() calls.

	   @param instance Plugin instance containing the port.

	   @param port Index of the port to connect. The host MUST NOT try to
	   connect a port index that is not defined in the plugin's RDF data. If
	   it does, the plugin's behaviour is undefined (a crash is likely).

	   @param data_location Pointer to data of the type defined by the port
	   type in the plugin's RDF data (e.g. an array of float for an
	   lv2:AudioPort). This pointer must be stored by the plugin instance and
	   used to read/write data when run() is called. Data present at the time
	   of the connect_port() call MUST NOT be considered meaningful.
	*/
	// void (*connect_port)(LV2_Handle instance,
	//                      uint32_t   port,
	//                      void *     data_location);
	void function(LV2_Handle instance,
	                     uint32_t   port,
	                     void *     data_location) connect_port;

	/**
	   Initialise a plugin instance and activate it for use.

	   This is separated from instantiate() to aid real-time support and so
	   that hosts can reinitialise a plugin instance by calling deactivate()
	   and then activate(). In this case the plugin instance MUST reset all
	   state information dependent on the history of the plugin instance except
	   for any data locations provided by connect_port(). If there is nothing
	   for activate() to do then this field may be NULL.

	   When present, hosts MUST call this function once before run() is called
	   for the first time. This call SHOULD be made as close to the run() call
	   as possible and indicates to real-time plugins that they are now live,
	   however plugins MUST NOT rely on a prompt call to run() after
	   activate().

	   The host MUST NOT call activate() again until deactivate() has been
	   called first. If a host calls activate(), it MUST call deactivate() at
	   some point in the future. Note that connect_port() may be called before
	   or after activate().
	*/
	// void (*activate)(LV2_Handle instance);
	void function(LV2_Handle instance) activate;

	/**
	   Run a plugin instance for a block.

	   Note that if an activate() function exists then it must be called before
	   run(). If deactivate() is called for a plugin instance then run() may
	   not be called until activate() has been called again.

	   If the plugin has the feature lv2:hardRTCapable then there are various
	   things that the plugin MUST NOT do within the run() function (see
	   lv2core.ttl for details).

	   As a special case, when `sample_count` is 0, the plugin should update
	   any output ports that represent a single instant in time (e.g. control
	   ports, but not audio ports). This is particularly useful for latent
	   plugins, which should update their latency output port so hosts can
	   pre-roll plugins to compute latency. Plugins MUST NOT crash when
	   `sample_count` is 0.

	   @param instance Instance to be run.

	   @param sample_count The block size (in samples) for which the plugin
	   instance must run.
	*/
	// void (*run)(LV2_Handle instance,
	//             uint32_t   sample_count);
	void function(LV2_Handle instance,
	            uint32_t   sample_count) run;

	/**
	   Deactivate a plugin instance (counterpart to activate()).

	   Hosts MUST deactivate all activated instances after they have been run()
	   for the last time. This call SHOULD be made as close to the last run()
	   call as possible and indicates to real-time plugins that they are no
	   longer live, however plugins MUST NOT rely on prompt deactivation. If
	   there is nothing for deactivate() to do then this field may be NULL

	   Deactivation is not similar to pausing since the plugin instance will be
	   reinitialised by activate(). However, deactivate() itself MUST NOT fully
	   reset plugin state. For example, the host may deactivate a plugin, then
	   store its state (using some extension to do so).

	   Hosts MUST NOT call deactivate() unless activate() was previously
	   called. Note that connect_port() may be called before or after
	   deactivate().
	*/
	// void (*deactivate)(LV2_Handle instance);
	void function(LV2_Handle instance) deactivate;

	/**
	   Clean up a plugin instance (counterpart to instantiate()).

	   Once an instance of a plugin has been finished with it must be deleted
	   using this function. The instance handle passed ceases to be valid after
	   this call.

	   If activate() was called for a plugin instance then a corresponding call
	   to deactivate() MUST be made before cleanup() is called. Hosts MUST NOT
	   call cleanup() unless instantiate() was previously called.
	*/
	// void (*cleanup)(LV2_Handle instance);
	void function(LV2_Handle instance) cleanup;

	/**
	   Return additional plugin data defined by some extenion.

	   A typical use of this facility is to return a struct containing function
	   pointers to extend the LV2_Descriptor API.

	   The actual type and meaning of the returned object MUST be specified
	   precisely by the extension. This function MUST return NULL for any
	   unsupported URI. If a plugin does not support any extension data, this
	   field may be NULL.

	   The host is never responsible for freeing the returned value.
	*/
	// const void * (*extension_data)(const char * uri);
	const (void) * function(const char * uri) extension_data;
}
alias LV2_Descriptor = _LV2_Descriptor;

/**
   Helper macro needed for LV2_SYMBOL_EXPORT when using C++.
*/
// #ifdef __cplusplus
// #    define LV2_SYMBOL_EXTERN extern "C"
// #else
// #    define LV2_SYMBOL_EXTERN
// #endif

/**
   Put this (LV2_SYMBOL_EXPORT) before any functions that are to be loaded
   by the host as a symbol from the dynamic library.
*/
// #ifdef _WIN32
// #    define LV2_SYMBOL_EXPORT LV2_SYMBOL_EXTERN __declspec(dllexport)
// #else
// #    define LV2_SYMBOL_EXPORT LV2_SYMBOL_EXTERN __attribute__((visibility("default")))
// #endif

/+ LV2_SYMBOL_EXPORT = extern(C)  __attribute__((visibility("default")))+/

/**
   Prototype for plugin accessor function.

   Plugins are discovered by hosts using RDF data (not by loading libraries).
   See http://lv2plug.in for details on the discovery process, though most
   hosts should use an existing library to implement this functionality.

   This is the simple plugin discovery API, suitable for most statically
   defined plugins.  Advanced plugins that need access to their bundle during
   discovery can use lv2_lib_descriptor() instead.  Plugin libraries MUST
   include a function called "lv2_descriptor" or "lv2_lib_descriptor" with
   C-style linkage, but SHOULD provide "lv2_descriptor" wherever possible.

   When it is time to load a plugin (designated by its URI), the host loads the
   plugin's library, gets the lv2_descriptor() function from it, and uses this
   function to find the LV2_Descriptor for the desired plugin.  Plugins are
   accessed by index using values from 0 upwards.  This function MUST return
   NULL for out of range indices, so the host can enumerate plugins by
   increasing `index` until NULL is returned.

   Note that `index` has no meaning, hosts MUST NOT depend on it remaining
   consistent between loads of the plugin library.
*/
// LV2_SYMBOL_EXPORT
// const LV2_Descriptor * lv2_descriptor(uint32_t index);
extern(C) const (LV2_Descriptor)* lv2_descriptor(uint32_t index);

/**
   Type of the lv2_descriptor() function in a library (old discovery API).
*/
// typedef const LV2_Descriptor *
// (*LV2_Descriptor_Function)(uint32_t index);
const LV2_Descriptor * function(uint32_t index) LV2_Descriptor_Function;

/**
   Handle for a library descriptor.
*/
// typedef void* LV2_Lib_Handle;
alias LV2_Lib_Handle = void*;

/**
   Descriptor for a plugin library.

   To access a plugin library, the host creates an LV2_Lib_Descriptor via the
   lv2_lib_descriptor() function in the shared object.
*/
struct LV2_Lib_Descriptor {
	/**
	   Opaque library data which must be passed as the first parameter to all
	   the methods of this struct.
	*/
	LV2_Lib_Handle handle;

	/**
	   The total size of this struct.  This allows for this struct to be
	   expanded in the future if necessary.  This MUST be set by the library to
	   sizeof(LV2_Lib_Descriptor).  The host MUST NOT access any fields of this
	   struct beyond get_plugin() unless this field indicates they are present.
	*/
	uint32_t size;

	/**
	   Destroy this library descriptor and free all related resources.
	*/
	// void (*cleanup)(LV2_Lib_Handle handle);
	void function(LV2_Lib_Handle handle) cleanup;

	/**
	   Plugin accessor.

	   Plugins are accessed by index using values from 0 upwards.  Out of range
	   indices MUST result in this function returning NULL, so the host can
	   enumerate plugins by increasing `index` until NULL is returned.
	*/
	// const LV2_Descriptor * (*get_plugin)(LV2_Lib_Handle handle,
	//                                      uint32_t       index);
	const LV2_Descriptor * function(LV2_Lib_Handle handle,
	                                     uint32_t       index) get_plugin;
}

/**
   Prototype for library accessor function.

   This is the more advanced discovery API, which allows plugin libraries to
   access their bundles during discovery, which makes it possible for plugins to
   be dynamically defined by files in their bundle.  This API also has an
   explicit cleanup function, removing any need for non-portable shared library
   destructors.  Simple plugins that do not require these features may use
   lv2_descriptor() instead.

   This is the entry point for a plugin library.  Hosts load this symbol from
   the library and call this function to obtain a library descriptor which can
   be used to access all the contained plugins.  The returned object must not
   be destroyed (using LV2_Lib_Descriptor::cleanup()) until all plugins loaded
   from that library have been destroyed.
*/
// LV2_SYMBOL_EXPORT
// const LV2_Lib_Descriptor *
// lv2_lib_descriptor(const char *               bundle_path,
//                    const LV2_Feature *const * features);
extern(C) const (LV2_Lib_Descriptor)*
lv2_lib_descriptor(const char *               bundle_path,
                   const(LV2_Feature*)* features);

/**
   Type of the lv2_lib_descriptor() function in an LV2 library.
*/
// typedef const LV2_Lib_Descriptor *
// (*LV2_Lib_Descriptor_Function)(const char *               bundle_path,
//                                const LV2_Feature *const * features);
const (LV2_Lib_Descriptor)* function(const char *               bundle_path,
                               const(LV2_Feature*)* features) LV2_Lib_Descriptor_Function;

/* LV2_H_INCLUDED */

/**
   @}
*/
}