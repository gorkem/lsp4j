/*******************************************************************************
 * Copyright (c) 2017 Kichwa Coders Ltd. and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/

package org.eclipse.lsp4j.debug;

import com.google.gson.annotations.SerializedName
import java.util.Map
import org.eclipse.lsp4j.generator.JsonRpcData
import org.eclipse.lsp4j.jsonrpc.messages.Either

/**
 * Declaration of parameters, response bodies, and event bodies.
 * <p>
 * Auto-generated from debugProtocol.json schema version 1.24.0. Do not edit manually.
 */
class DebugProtcol {
	/**
	 * Version of debugProtocol.json this class was derived from.
	 */
	public static final String SCHEMA_VERSION = "1.24.0";
}

/**
 * Event message for 'stopped' event type.
 * <p>
 * The event indicates that the execution of the debuggee has stopped due to some condition.
 * <p>
 * This can be caused by a break point previously set, a stepping action has completed, by executing a debugger
 * statement etc.
 */
@JsonRpcData
class StoppedEventArguments {
	/**
	 * The reason for the event.
	 * <p>
	 * For backward compatibility this string is shown in the UI if the 'description' attribute is missing (but it
	 * must not be translated).
	 * <p>
	 * Possible values include - but not limited to those defined in {@link StoppedEventArgumentsReason}
	 */
	String reason;
	/**
	 * The full reason for the event, e.g. 'Paused on exception'. This string is shown in the UI as is.
	 * <p>
	 * This is an optional property.
	 */
	String description;
	/**
	 * The thread which was stopped.
	 * <p>
	 * This is an optional property.
	 */
	Integer threadId;
	/**
	 * Additional information. E.g. if reason is 'exception', text contains the exception name. This string is shown
	 * in the UI.
	 * <p>
	 * This is an optional property.
	 */
	String text;
	/**
	 * If allThreadsStopped is true, a debug adapter can announce that all threads have stopped.
	 * <p>
	 *  The client should use this information to enable that all threads can be expanded to access their
	 * stacktraces.
	 * <p>
	 *  If the attribute is missing or false, only the thread with the given threadId can be expanded.
	 * <p>
	 * This is an optional property.
	 */
	Boolean allThreadsStopped;
}

/**
 * The reason for the event.
 * <p>
 * For backward compatibility this string is shown in the UI if the 'description' attribute is missing (but it
 * must not be translated).
 * <p>
 * Possible values include - but not limited to those defined in {@link StoppedEventArgumentsReason}
 */
public interface StoppedEventArgumentsReason {
	public static final String STEP = "step";
	public static final String BREAKPOINT = "breakpoint";
	public static final String EXCEPTION = "exception";
	public static final String PAUSE = "pause";
	public static final String ENTRY = "entry";
}

/**
 * Event message for 'continued' event type.
 * <p>
 * The event indicates that the execution of the debuggee has continued.
 * <p>
 * Please note: a debug adapter is not expected to send this event in response to a request that implies that
 * execution continues, e.g. 'launch' or 'continue'.
 * <p>
 * It is only necessary to send a ContinuedEvent if there was no previous request that implied this.
 */
@JsonRpcData
class ContinuedEventArguments {
	/**
	 * The thread which was continued.
	 */
	Integer threadId;
	/**
	 * If allThreadsContinued is true, a debug adapter can announce that all threads have continued.
	 * <p>
	 * This is an optional property.
	 */
	Boolean allThreadsContinued;
}

/**
 * Event message for 'exited' event type.
 * <p>
 * The event indicates that the debuggee has exited.
 */
@JsonRpcData
class ExitedEventArguments {
	/**
	 * The exit code returned from the debuggee.
	 */
	Integer exitCode;
}

/**
 * Event message for 'terminated' event types.
 * <p>
 * The event indicates that debugging of the debuggee has terminated.
 */
@JsonRpcData
class TerminatedEventArguments {
	/**
	 * A debug adapter may set 'restart' to true (or to an arbitrary object) to request that the front end restarts
	 * the session.
	 * <p>
	 * The value is not interpreted by the client and passed unmodified as an attribute '__restart' to the
	 * launchRequest.
	 * <p>
	 * This is an optional property.
	 */
	Object restart;
}

/**
 * Event message for 'thread' event type.
 * <p>
 * The event indicates that a thread has started or exited.
 */
@JsonRpcData
class ThreadEventArguments {
	/**
	 * The reason for the event.
	 * <p>
	 * Possible values include - but not limited to those defined in {@link ThreadEventArgumentsReason}
	 */
	String reason;
	/**
	 * The identifier of the thread.
	 */
	Integer threadId;
}

/**
 * The reason for the event.
 * <p>
 * Possible values include - but not limited to those defined in {@link ThreadEventArgumentsReason}
 */
public interface ThreadEventArgumentsReason {
	public static final String STARTED = "started";
	public static final String EXITED = "exited";
}

/**
 * Event message for 'output' event type.
 * <p>
 * The event indicates that the target has produced some output.
 */
@JsonRpcData
class OutputEventArguments {
	/**
	 * The output category. If not specified, 'console' is assumed.
	 * <p>
	 * This is an optional property.
	 * <p>
	 * Possible values include - but not limited to those defined in {@link OutputEventArgumentsCategory}
	 */
	String category;
	/**
	 * The output to report.
	 */
	String output;
	/**
	 * If an attribute 'variablesReference' exists and its value is > 0, the output contains objects which can be
	 * retrieved by passing variablesReference to the VariablesRequest.
	 * <p>
	 * This is an optional property.
	 */
	Integer variablesReference;
	/**
	 * An optional source location where the output was produced.
	 * <p>
	 * This is an optional property.
	 */
	Source source;
	/**
	 * An optional source location line where the output was produced.
	 * <p>
	 * This is an optional property.
	 */
	Integer line;
	/**
	 * An optional source location column where the output was produced.
	 * <p>
	 * This is an optional property.
	 */
	Integer column;
	/**
	 * Optional data to report. For the 'telemetry' category the data will be sent to telemetry, for the other
	 * categories the data is shown in JSON format.
	 * <p>
	 * This is an optional property.
	 */
	Object data;
}

/**
 * The output category. If not specified, 'console' is assumed.
 * <p>
 * Possible values include - but not limited to those defined in {@link OutputEventArgumentsCategory}
 */
public interface OutputEventArgumentsCategory {
	public static final String CONSOLE = "console";
	public static final String STDOUT = "stdout";
	public static final String STDERR = "stderr";
	public static final String TELEMETRY = "telemetry";
}

/**
 * Event message for 'breakpoint' event type.
 * <p>
 * The event indicates that some information about a breakpoint has changed.
 */
@JsonRpcData
class BreakpointEventArguments {
	/**
	 * The reason for the event.
	 * <p>
	 * Possible values include - but not limited to those defined in {@link BreakpointEventArgumentsReason}
	 */
	String reason;
	/**
	 * The breakpoint.
	 */
	Breakpoint breakpoint;
}

/**
 * The reason for the event.
 * <p>
 * Possible values include - but not limited to those defined in {@link BreakpointEventArgumentsReason}
 */
public interface BreakpointEventArgumentsReason {
	public static final String CHANGED = "changed";
	public static final String NEW = "new";
	public static final String REMOVED = "removed";
}

/**
 * Event message for 'module' event type.
 * <p>
 * The event indicates that some information about a module has changed.
 */
@JsonRpcData
class ModuleEventArguments {
	/**
	 * The reason for the event.
	 */
	ModuleEventArgumentsReason reason;
	/**
	 * The new, changed, or removed module. In case of 'removed' only the module id is used.
	 */
	Module module;
}

/**
 * The reason for the event.
 */
public enum ModuleEventArgumentsReason {
	NEW,
	CHANGED,
	REMOVED
}

/**
 * Event message for 'loadedSource' event type.
 * <p>
 * The event indicates that some source has been added, changed, or removed from the set of all loaded sources.
 */
@JsonRpcData
class LoadedSourceEventArguments {
	/**
	 * The reason for the event.
	 */
	LoadedSourceEventArgumentsReason reason;
	/**
	 * The new, changed, or removed source.
	 */
	Source source;
}

/**
 * The reason for the event.
 */
public enum LoadedSourceEventArgumentsReason {
	NEW,
	CHANGED,
	REMOVED
}

/**
 * Event message for 'process' event type.
 * <p>
 * The event indicates that the debugger has begun debugging a new process. Either one that it has launched, or
 * one that it has attached to.
 */
@JsonRpcData
class ProcessEventArguments {
	/**
	 * The logical name of the process. This is usually the full path to process's executable file. Example:
	 * /home/example/myproj/program.js.
	 */
	String name;
	/**
	 * The system process id of the debugged process. This property will be missing for non-system processes.
	 * <p>
	 * This is an optional property.
	 */
	Integer systemProcessId;
	/**
	 * If true, the process is running on the same computer as the debug adapter.
	 * <p>
	 * This is an optional property.
	 */
	Boolean isLocalProcess;
	/**
	 * Describes how the debug engine started debugging this process.
	 * <p>
	 * This is an optional property.
	 */
	ProcessEventArgumentsStartMethod startMethod;
}

/**
 * Describes how the debug engine started debugging this process.
 */
public enum ProcessEventArgumentsStartMethod {
	/**
	 * Process was launched under the debugger.
	 */
	LAUNCH,
	/**
	 * Debugger attached to an existing process.
	 */
	ATTACH,
	/**
	 * A project launcher component has launched a new process in a suspended state and then asked the debugger to
	 * attach.
	 */
	ATTACH_FOR_SUSPENDED_LAUNCH
}

/**
 * Response to Initialize request.
 */
@JsonRpcData
class RunInTerminalResponse {
	/**
	 * The process ID.
	 * <p>
	 * This is an optional property.
	 */
	Integer processId;
}

/**
 * Arguments for 'runInTerminal' request.
 */
@JsonRpcData
class RunInTerminalRequestArguments {
	/**
	 * What kind of terminal to launch.
	 * <p>
	 * This is an optional property.
	 */
	RunInTerminalRequestArgumentsKind kind;
	/**
	 * Optional title of the terminal.
	 * <p>
	 * This is an optional property.
	 */
	String title;
	/**
	 * Working directory of the command.
	 */
	String cwd;
	/**
	 * List of arguments. The first argument is the command to run.
	 */
	String[] args;
	/**
	 * Environment key-value pairs that are added to the default environment.
	 * <p>
	 * This is an optional property.
	 */
	Map<String, String> env;
}

/**
 * What kind of terminal to launch.
 */
public enum RunInTerminalRequestArgumentsKind {
	INTEGRATED,
	EXTERNAL
}

/**
 * Response to 'initialize' request.
 */
@JsonRpcData
class InitializeResponse {
}

/**
 * Arguments for 'initialize' request.
 */
@JsonRpcData
class InitializeRequestArguments {
	/**
	 * The ID of the (frontend) client using this adapter.
	 * <p>
	 * This is an optional property.
	 */
	String clientID;
	/**
	 * The ID of the debug adapter.
	 */
	String adapterID;
	/**
	 * The ISO-639 locale of the (frontend) client using this adapter, e.g. en-US or de-CH.
	 * <p>
	 * This is an optional property.
	 */
	String locale;
	/**
	 * If true all line numbers are 1-based (default).
	 * <p>
	 * This is an optional property.
	 */
	Boolean linesStartAt1;
	/**
	 * If true all column numbers are 1-based (default).
	 * <p>
	 * This is an optional property.
	 */
	Boolean columnsStartAt1;
	/**
	 * Determines in what format paths are specified. The default is 'path', which is the native format.
	 * <p>
	 * This is an optional property.
	 * <p>
	 * Possible values include - but not limited to those defined in {@link InitializeRequestArgumentsPathFormat}
	 */
	String pathFormat;
	/**
	 * Client supports the optional type attribute for variables.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsVariableType;
	/**
	 * Client supports the paging of variables.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsVariablePaging;
	/**
	 * Client supports the runInTerminal request.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsRunInTerminalRequest;
}

/**
 * Determines in what format paths are specified. The default is 'path', which is the native format.
 * <p>
 * Possible values include - but not limited to those defined in {@link InitializeRequestArgumentsPathFormat}
 */
public interface InitializeRequestArgumentsPathFormat {
	public static final String PATH = "path";
	public static final String URI = "uri";
}

/**
 * Arguments for 'configurationDone' request.
 * <p>
 * The configurationDone request has no standardized attributes.
 */
@JsonRpcData
class ConfigurationDoneArguments {
}

/**
 * Arguments for 'launch' request.
 */
@JsonRpcData
class LaunchRequestArguments {
	/**
	 * If noDebug is true the launch request should launch the program without enabling debugging.
	 * <p>
	 * This is an optional property.
	 */
	Boolean noDebug;
}

/**
 * Arguments for 'attach' request.
 * <p>
 * The attach request has no standardized attributes.
 */
@JsonRpcData
class AttachRequestArguments {
}

/**
 * Arguments for 'restart' request.
 * <p>
 * The restart request has no standardized attributes.
 */
@JsonRpcData
class RestartArguments {
}

/**
 * Arguments for 'disconnect' request.
 */
@JsonRpcData
class DisconnectArguments {
	/**
	 * Indicates whether the debuggee should be terminated when the debugger is disconnected.
	 * <p>
	 * If unspecified, the debug adapter is free to do whatever it thinks is best.
	 * <p>
	 * A client can only rely on this attribute being properly honored if a debug adapter returns true for the
	 * 'supportTerminateDebuggee' capability.
	 * <p>
	 * This is an optional property.
	 */
	Boolean terminateDebuggee;
}

/**
 * Response to 'setBreakpoints' request.
 * <p>
 * Returned is information about each breakpoint created by this request.
 * <p>
 * This includes the actual code location and whether the breakpoint could be verified.
 * <p>
 * The breakpoints returned are in the same order as the elements of the 'breakpoints'
 * <p>
 * (or the deprecated 'lines') in the SetBreakpointsArguments.
 */
@JsonRpcData
class SetBreakpointsResponse {
	/**
	 * Information about the breakpoints. The array elements are in the same order as the elements of the
	 * 'breakpoints' (or the deprecated 'lines') in the SetBreakpointsArguments.
	 */
	Breakpoint[] breakpoints;
}

/**
 * Arguments for 'setBreakpoints' request.
 */
@JsonRpcData
class SetBreakpointsArguments {
	/**
	 * The source location of the breakpoints; either source.path or source.reference must be specified.
	 */
	Source source;
	/**
	 * The code locations of the breakpoints.
	 * <p>
	 * This is an optional property.
	 */
	SourceBreakpoint[] breakpoints;
	/**
	 * Deprecated: The code locations of the breakpoints.
	 * <p>
	 * This is an optional property.
	 */
	Integer[] lines;
	/**
	 * A value of true indicates that the underlying source has been modified which results in new breakpoint
	 * locations.
	 * <p>
	 * This is an optional property.
	 */
	Boolean sourceModified;
}

/**
 * Response to 'setFunctionBreakpoints' request.
 * <p>
 * Returned is information about each breakpoint created by this request.
 */
@JsonRpcData
class SetFunctionBreakpointsResponse {
	/**
	 * Information about the breakpoints. The array elements correspond to the elements of the 'breakpoints' array.
	 */
	Breakpoint[] breakpoints;
}

/**
 * Arguments for 'setFunctionBreakpoints' request.
 */
@JsonRpcData
class SetFunctionBreakpointsArguments {
	/**
	 * The function names of the breakpoints.
	 */
	FunctionBreakpoint[] breakpoints;
}

/**
 * Arguments for 'setExceptionBreakpoints' request.
 */
@JsonRpcData
class SetExceptionBreakpointsArguments {
	/**
	 * IDs of checked exception options. The set of IDs is returned via the 'exceptionBreakpointFilters' capability.
	 */
	String[] filters;
	/**
	 * Configuration options for selected exceptions.
	 * <p>
	 * This is an optional property.
	 */
	ExceptionOptions[] exceptionOptions;
}

/**
 * Response to 'continue' request.
 */
@JsonRpcData
class ContinueResponse {
	/**
	 * If true, the continue request has ignored the specified thread and continued all threads instead. If this
	 * attribute is missing a value of 'true' is assumed for backward compatibility.
	 * <p>
	 * This is an optional property.
	 */
	Boolean allThreadsContinued;
}

/**
 * Arguments for 'continue' request.
 */
@JsonRpcData
class ContinueArguments {
	/**
	 * Continue execution for the specified thread (if possible). If the backend cannot continue on a single thread
	 * but will continue on all threads, it should set the allThreadsContinued attribute in the response to true.
	 */
	Integer threadId;
}

/**
 * Arguments for 'next' request.
 */
@JsonRpcData
class NextArguments {
	/**
	 * Execute 'next' for this thread.
	 */
	Integer threadId;
}

/**
 * Arguments for 'stepIn' request.
 */
@JsonRpcData
class StepInArguments {
	/**
	 * Execute 'stepIn' for this thread.
	 */
	Integer threadId;
	/**
	 * Optional id of the target to step into.
	 * <p>
	 * This is an optional property.
	 */
	Integer targetId;
}

/**
 * Arguments for 'stepOut' request.
 */
@JsonRpcData
class StepOutArguments {
	/**
	 * Execute 'stepOut' for this thread.
	 */
	Integer threadId;
}

/**
 * Arguments for 'stepBack' request.
 */
@JsonRpcData
class StepBackArguments {
	/**
	 * Exceute 'stepBack' for this thread.
	 */
	Integer threadId;
}

/**
 * Arguments for 'reverseContinue' request.
 */
@JsonRpcData
class ReverseContinueArguments {
	/**
	 * Exceute 'reverseContinue' for this thread.
	 */
	Integer threadId;
}

/**
 * Arguments for 'restartFrame' request.
 */
@JsonRpcData
class RestartFrameArguments {
	/**
	 * Restart this stackframe.
	 */
	Integer frameId;
}

/**
 * Arguments for 'goto' request.
 */
@JsonRpcData
class GotoArguments {
	/**
	 * Set the goto target for this thread.
	 */
	Integer threadId;
	/**
	 * The location where the debuggee will continue to run.
	 */
	Integer targetId;
}

/**
 * Arguments for 'pause' request.
 */
@JsonRpcData
class PauseArguments {
	/**
	 * Pause execution for this thread.
	 */
	Integer threadId;
}

/**
 * Response to 'stackTrace' request.
 */
@JsonRpcData
class StackTraceResponse {
	/**
	 * The frames of the stackframe. If the array has length zero, there are no stackframes available.
	 * <p>
	 * This means that there is no location information available.
	 */
	StackFrame[] stackFrames;
	/**
	 * The total number of frames available.
	 * <p>
	 * This is an optional property.
	 */
	Integer totalFrames;
}

/**
 * Arguments for 'stackTrace' request.
 */
@JsonRpcData
class StackTraceArguments {
	/**
	 * Retrieve the stacktrace for this thread.
	 */
	Integer threadId;
	/**
	 * The index of the first frame to return; if omitted frames start at 0.
	 * <p>
	 * This is an optional property.
	 */
	Integer startFrame;
	/**
	 * The maximum number of frames to return. If levels is not specified or 0, all frames are returned.
	 * <p>
	 * This is an optional property.
	 */
	Integer levels;
	/**
	 * Specifies details on how to format the stack frames.
	 * <p>
	 * This is an optional property.
	 */
	StackFrameFormat format;
}

/**
 * Response to 'scopes' request.
 */
@JsonRpcData
class ScopesResponse {
	/**
	 * The scopes of the stackframe. If the array has length zero, there are no scopes available.
	 */
	Scope[] scopes;
}

/**
 * Arguments for 'scopes' request.
 */
@JsonRpcData
class ScopesArguments {
	/**
	 * Retrieve the scopes for this stackframe.
	 */
	Integer frameId;
}

/**
 * Response to 'variables' request.
 */
@JsonRpcData
class VariablesResponse {
	/**
	 * All (or a range) of variables for the given variable reference.
	 */
	Variable[] variables;
}

/**
 * Arguments for 'variables' request.
 */
@JsonRpcData
class VariablesArguments {
	/**
	 * The Variable reference.
	 */
	Integer variablesReference;
	/**
	 * Optional filter to limit the child variables to either named or indexed. If ommited, both types are fetched.
	 * <p>
	 * This is an optional property.
	 */
	VariablesArgumentsFilter filter;
	/**
	 * The index of the first variable to return; if omitted children start at 0.
	 * <p>
	 * This is an optional property.
	 */
	Integer start;
	/**
	 * The number of variables to return. If count is missing or 0, all variables are returned.
	 * <p>
	 * This is an optional property.
	 */
	Integer count;
	/**
	 * Specifies details on how to format the Variable values.
	 * <p>
	 * This is an optional property.
	 */
	ValueFormat format;
}

/**
 * Optional filter to limit the child variables to either named or indexed. If ommited, both types are fetched.
 */
public enum VariablesArgumentsFilter {
	INDEXED,
	NAMED
}

/**
 * Response to 'setVariable' request.
 */
@JsonRpcData
class SetVariableResponse {
	/**
	 * The new value of the variable.
	 */
	String value;
	/**
	 * The type of the new value. Typically shown in the UI when hovering over the value.
	 * <p>
	 * This is an optional property.
	 */
	String type;
	/**
	 * If variablesReference is > 0, the new value is structured and its children can be retrieved by passing
	 * variablesReference to the VariablesRequest.
	 * <p>
	 * This is an optional property.
	 */
	Integer variablesReference;
	/**
	 * The number of named child variables.
	 * <p>
	 * The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
	 * <p>
	 * This is an optional property.
	 */
	Integer namedVariables;
	/**
	 * The number of indexed child variables.
	 * <p>
	 * The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
	 * <p>
	 * This is an optional property.
	 */
	Integer indexedVariables;
}

/**
 * Arguments for 'setVariable' request.
 */
@JsonRpcData
class SetVariableArguments {
	/**
	 * The reference of the variable container.
	 */
	Integer variablesReference;
	/**
	 * The name of the variable.
	 */
	String name;
	/**
	 * The value of the variable.
	 */
	String value;
	/**
	 * Specifies details on how to format the response value.
	 * <p>
	 * This is an optional property.
	 */
	ValueFormat format;
}

/**
 * Response to 'source' request.
 */
@JsonRpcData
class SourceResponse {
	/**
	 * Content of the source reference.
	 */
	String content;
	/**
	 * Optional content type (mime type) of the source.
	 * <p>
	 * This is an optional property.
	 */
	String mimeType;
}

/**
 * Arguments for 'source' request.
 */
@JsonRpcData
class SourceArguments {
	/**
	 * Specifies the source content to load. Either source.path or source.sourceReference must be specified.
	 * <p>
	 * This is an optional property.
	 */
	Source source;
	/**
	 * The reference to the source. This is the same as source.sourceReference. This is provided for backward
	 * compatibility since old backends do not understand the 'source' attribute.
	 */
	Integer sourceReference;
}

/**
 * Response to 'threads' request.
 */
@JsonRpcData
class ThreadsResponse {
	/**
	 * All threads.
	 */
	Thread[] threads;
}

/**
 * Response to 'modules' request.
 */
@JsonRpcData
class ModulesResponse {
	/**
	 * All modules or range of modules.
	 */
	Module[] modules;
	/**
	 * The total number of modules available.
	 * <p>
	 * This is an optional property.
	 */
	Integer totalModules;
}

/**
 * Arguments for 'modules' request.
 */
@JsonRpcData
class ModulesArguments {
	/**
	 * The index of the first module to return; if omitted modules start at 0.
	 * <p>
	 * This is an optional property.
	 */
	Integer startModule;
	/**
	 * The number of modules to return. If moduleCount is not specified or 0, all modules are returned.
	 * <p>
	 * This is an optional property.
	 */
	Integer moduleCount;
}

/**
 * Response to 'loadedSources' request.
 */
@JsonRpcData
class LoadedSourcesResponse {
	/**
	 * Set of loaded sources.
	 */
	Source[] sources;
}

/**
 * Arguments for 'loadedSources' request.
 * <p>
 * The 'loadedSources' request has no standardized arguments.
 */
@JsonRpcData
class LoadedSourcesArguments {
}

/**
 * Response to 'evaluate' request.
 */
@JsonRpcData
class EvaluateResponse {
	/**
	 * The result of the evaluate request.
	 */
	String result;
	/**
	 * The optional type of the evaluate result.
	 * <p>
	 * This is an optional property.
	 */
	String type;
	/**
	 * Properties of a evaluate result that can be used to determine how to render the result in the UI.
	 * <p>
	 * This is an optional property.
	 */
	VariablePresentationHint presentationHint;
	/**
	 * If variablesReference is > 0, the evaluate result is structured and its children can be retrieved by passing
	 * variablesReference to the VariablesRequest.
	 */
	Integer variablesReference;
	/**
	 * The number of named child variables.
	 * <p>
	 * The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
	 * <p>
	 * This is an optional property.
	 */
	Integer namedVariables;
	/**
	 * The number of indexed child variables.
	 * <p>
	 * The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
	 * <p>
	 * This is an optional property.
	 */
	Integer indexedVariables;
}

/**
 * Arguments for 'evaluate' request.
 */
@JsonRpcData
class EvaluateArguments {
	/**
	 * The expression to evaluate.
	 */
	String expression;
	/**
	 * Evaluate the expression in the scope of this stack frame. If not specified, the expression is evaluated in the
	 * global scope.
	 * <p>
	 * This is an optional property.
	 */
	Integer frameId;
	/**
	 * The context in which the evaluate request is run.
	 * <p>
	 * This is an optional property.
	 * <p>
	 * Possible values include - but not limited to those defined in {@link EvaluateArgumentsContext}
	 */
	String context;
	/**
	 * Specifies details on how to format the Evaluate result.
	 * <p>
	 * This is an optional property.
	 */
	ValueFormat format;
}

/**
 * The context in which the evaluate request is run.
 * <p>
 * Possible values include - but not limited to those defined in {@link EvaluateArgumentsContext}
 */
public interface EvaluateArgumentsContext {
	/**
	 * evaluate is run in a watch.
	 */
	public static final String WATCH = "watch";
	/**
	 * evaluate is run from REPL console.
	 */
	public static final String REPL = "repl";
	/**
	 * evaluate is run from a data hover.
	 */
	public static final String HOVER = "hover";
}

/**
 * Response to 'stepInTargets' request.
 */
@JsonRpcData
class StepInTargetsResponse {
	/**
	 * The possible stepIn targets of the specified source location.
	 */
	StepInTarget[] targets;
}

/**
 * Arguments for 'stepInTargets' request.
 */
@JsonRpcData
class StepInTargetsArguments {
	/**
	 * The stack frame for which to retrieve the possible stepIn targets.
	 */
	Integer frameId;
}

/**
 * Response to 'gotoTargets' request.
 */
@JsonRpcData
class GotoTargetsResponse {
	/**
	 * The possible goto targets of the specified location.
	 */
	GotoTarget[] targets;
}

/**
 * Arguments for 'gotoTargets' request.
 */
@JsonRpcData
class GotoTargetsArguments {
	/**
	 * The source location for which the goto targets are determined.
	 */
	Source source;
	/**
	 * The line location for which the goto targets are determined.
	 */
	Integer line;
	/**
	 * An optional column location for which the goto targets are determined.
	 * <p>
	 * This is an optional property.
	 */
	Integer column;
}

/**
 * Response to 'completions' request.
 */
@JsonRpcData
class CompletionsResponse {
	/**
	 * The possible completions for .
	 */
	CompletionItem[] targets;
}

/**
 * Arguments for 'completions' request.
 */
@JsonRpcData
class CompletionsArguments {
	/**
	 * Returns completions in the scope of this stack frame. If not specified, the completions are returned for the
	 * global scope.
	 * <p>
	 * This is an optional property.
	 */
	Integer frameId;
	/**
	 * One or more source lines. Typically this is the text a user has typed into the debug console before he asked
	 * for completion.
	 */
	String text;
	/**
	 * The character position for which to determine the completion proposals.
	 */
	Integer column;
	/**
	 * An optional line for which to determine the completion proposals. If missing the first line of the text is
	 * assumed.
	 * <p>
	 * This is an optional property.
	 */
	Integer line;
}

/**
 * Response to 'exceptionInfo' request.
 */
@JsonRpcData
class ExceptionInfoResponse {
	/**
	 * ID of the exception that was thrown.
	 */
	String exceptionId;
	/**
	 * Descriptive text for the exception provided by the debug adapter.
	 * <p>
	 * This is an optional property.
	 */
	String description;
	/**
	 * Mode that caused the exception notification to be raised.
	 */
	ExceptionBreakMode breakMode;
	/**
	 * Detailed information about the exception.
	 * <p>
	 * This is an optional property.
	 */
	ExceptionDetails details;
}

/**
 * Arguments for 'exceptionInfo' request.
 */
@JsonRpcData
class ExceptionInfoArguments {
	/**
	 * Thread for which exception information should be retrieved.
	 */
	Integer threadId;
}

/**
 * Information about the capabilities of a debug adapter.
 */
@JsonRpcData
class Capabilities {
	/**
	 * The debug adapter supports the configurationDoneRequest.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsConfigurationDoneRequest;
	/**
	 * The debug adapter supports function breakpoints.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsFunctionBreakpoints;
	/**
	 * The debug adapter supports conditional breakpoints.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsConditionalBreakpoints;
	/**
	 * The debug adapter supports breakpoints that break execution after a specified number of hits.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsHitConditionalBreakpoints;
	/**
	 * The debug adapter supports a (side effect free) evaluate request for data hovers.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsEvaluateForHovers;
	/**
	 * Available filters or options for the setExceptionBreakpoints request.
	 * <p>
	 * This is an optional property.
	 */
	ExceptionBreakpointsFilter[] exceptionBreakpointFilters;
	/**
	 * The debug adapter supports stepping back via the stepBack and reverseContinue requests.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsStepBack;
	/**
	 * The debug adapter supports setting a variable to a value.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsSetVariable;
	/**
	 * The debug adapter supports restarting a frame.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsRestartFrame;
	/**
	 * The debug adapter supports the gotoTargetsRequest.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsGotoTargetsRequest;
	/**
	 * The debug adapter supports the stepInTargetsRequest.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsStepInTargetsRequest;
	/**
	 * The debug adapter supports the completionsRequest.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsCompletionsRequest;
	/**
	 * The debug adapter supports the modules request.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsModulesRequest;
	/**
	 * The set of additional module information exposed by the debug adapter.
	 * <p>
	 * This is an optional property.
	 */
	ColumnDescriptor[] additionalModuleColumns;
	/**
	 * Checksum algorithms supported by the debug adapter.
	 * <p>
	 * This is an optional property.
	 */
	ChecksumAlgorithm[] supportedChecksumAlgorithms;
	/**
	 * The debug adapter supports the RestartRequest. In this case a client should not implement 'restart' by
	 * terminating and relaunching the adapter but by calling the RestartRequest.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsRestartRequest;
	/**
	 * The debug adapter supports 'exceptionOptions' on the setExceptionBreakpoints request.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsExceptionOptions;
	/**
	 * The debug adapter supports a 'format' attribute on the stackTraceRequest, variablesRequest, and
	 * evaluateRequest.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsValueFormattingOptions;
	/**
	 * The debug adapter supports the exceptionInfo request.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsExceptionInfoRequest;
	/**
	 * The debug adapter supports the 'terminateDebuggee' attribute on the 'disconnect' request.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportTerminateDebuggee;
	/**
	 * The debug adapter supports the delayed loading of parts of the stack, which requires that both the 'startFrame'
	 * and 'levels' arguments and the 'totalFrames' result of the 'StackTrace' request are supported.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsDelayedStackTraceLoading;
	/**
	 * The debug adapter supports the 'loadedSources' request.
	 * <p>
	 * This is an optional property.
	 */
	Boolean supportsLoadedSourcesRequest;
}

/**
 * An ExceptionBreakpointsFilter is shown in the UI as an option for configuring how exceptions are dealt with.
 */
@JsonRpcData
class ExceptionBreakpointsFilter {
	/**
	 * The internal ID of the filter. This value is passed to the setExceptionBreakpoints request.
	 */
	String filter;
	/**
	 * The name of the filter. This will be shown in the UI.
	 */
	String label;
	/**
	 * Initial value of the filter. If not specified a value 'false' is assumed.
	 * <p>
	 * This is an optional property.
	 */
	@SerializedName(value="default")
	Boolean default_;
}

/**
 * A structured message object. Used to return errors from requests.
 */
@JsonRpcData
class Message {
	/**
	 * Unique identifier for the message.
	 */
	Integer id;
	/**
	 * A format string for the message. Embedded variables have the form '{name}'.
	 * <p>
	 * If variable name starts with an underscore character, the variable does not contain user data (PII) and can be
	 * safely used for telemetry purposes.
	 */
	String format;
	/**
	 * An object used as a dictionary for looking up the variables in the format string.
	 * <p>
	 * This is an optional property.
	 */
	Map<String, String> variables;
	/**
	 * If true send to telemetry.
	 * <p>
	 * This is an optional property.
	 */
	Boolean sendTelemetry;
	/**
	 * If true show user.
	 * <p>
	 * This is an optional property.
	 */
	Boolean showUser;
	/**
	 * An optional url where additional information about this message can be found.
	 * <p>
	 * This is an optional property.
	 */
	String url;
	/**
	 * An optional label that is presented to the user as the UI for opening the url.
	 * <p>
	 * This is an optional property.
	 */
	String urlLabel;
}

/**
 * A Module object represents a row in the modules view.
 * <p>
 * Two attributes are mandatory: an id identifies a module in the modules view and is used in a ModuleEvent for
 * identifying a module for adding, updating or deleting.
 * <p>
 * The name is used to minimally render the module in the UI.
 * <p>

 * <p>
 * Additional attributes can be added to the module. They will show up in the module View if they have a
 * corresponding ColumnDescriptor.
 * <p>

 * <p>
 * To avoid an unnecessary proliferation of additional attributes with similar semantics but different names
 * <p>
 * we recommend to re-use attributes from the 'recommended' list below first, and only introduce new attributes if
 * nothing appropriate could be found.
 */
@JsonRpcData
class Module {
	/**
	 * Unique identifier for the module.
	 */
	Either<Integer, String> id;
	/**
	 * A name of the module.
	 */
	String name;
	/**
	 * optional but recommended attributes.
	 * <p>
	 * always try to use these first before introducing additional attributes.
	 * <p>

	 * <p>
	 * Logical full path to the module. The exact definition is implementation defined, but usually this would be a
	 * full path to the on-disk file for the module.
	 * <p>
	 * This is an optional property.
	 */
	String path;
	/**
	 * True if the module is optimized.
	 * <p>
	 * This is an optional property.
	 */
	Boolean isOptimized;
	/**
	 * True if the module is considered 'user code' by a debugger that supports 'Just My Code'.
	 * <p>
	 * This is an optional property.
	 */
	Boolean isUserCode;
	/**
	 * Version of Module.
	 * <p>
	 * This is an optional property.
	 */
	String version;
	/**
	 * User understandable description of if symbols were found for the module (ex: 'Symbols Loaded', 'Symbols not
	 * found', etc.
	 * <p>
	 * This is an optional property.
	 */
	String symbolStatus;
	/**
	 * Logical full path to the symbol file. The exact definition is implementation defined.
	 * <p>
	 * This is an optional property.
	 */
	String symbolFilePath;
	/**
	 * Module created or modified.
	 * <p>
	 * This is an optional property.
	 */
	String dateTimeStamp;
	/**
	 * Address range covered by this module.
	 * <p>
	 * This is an optional property.
	 */
	String addressRange;
}

/**
 * A ColumnDescriptor specifies what module attribute to show in a column of the ModulesView, how to format it,
 * and what the column's label should be.
 * <p>
 * It is only used if the underlying UI actually supports this level of customization.
 */
@JsonRpcData
class ColumnDescriptor {
	/**
	 * Name of the attribute rendered in this column.
	 */
	String attributeName;
	/**
	 * Header UI label of column.
	 */
	String label;
	/**
	 * Format to use for the rendered values in this column. TBD how the format strings looks like.
	 * <p>
	 * This is an optional property.
	 */
	String format;
	/**
	 * Datatype of values in this column.  Defaults to 'string' if not specified.
	 * <p>
	 * This is an optional property.
	 */
	ColumnDescriptorType type;
	/**
	 * Width of this column in characters (hint only).
	 * <p>
	 * This is an optional property.
	 */
	Integer width;
}

/**
 * Datatype of values in this column.  Defaults to 'string' if not specified.
 */
public enum ColumnDescriptorType {
	STRING,
	NUMBER,
	BOOLEAN,
	@SerializedName("unixTimestampUTC")
	UNIX_TIMESTAMP_UTC
}

/**
 * The ModulesViewDescriptor is the container for all declarative configuration options of a ModuleView.
 * <p>
 * For now it only specifies the columns to be shown in the modules view.
 */
@JsonRpcData
class ModulesViewDescriptor {
	/**

	 */
	ColumnDescriptor[] columns;
}

/**
 * A Thread
 */
@JsonRpcData
class Thread {
	/**
	 * Unique identifier for the thread.
	 */
	Integer id;
	/**
	 * A name of the thread.
	 */
	String name;
}

/**
 * A Source is a descriptor for source code. It is returned from the debug adapter as part of a StackFrame and it
 * is used by clients when specifying breakpoints.
 */
@JsonRpcData
class Source {
	/**
	 * The short name of the source. Every source returned from the debug adapter has a name. When sending a source to
	 * the debug adapter this name is optional.
	 * <p>
	 * This is an optional property.
	 */
	String name;
	/**
	 * The path of the source to be shown in the UI. It is only used to locate and load the content of the source if
	 * no sourceReference is specified (or its vaule is 0).
	 * <p>
	 * This is an optional property.
	 */
	String path;
	/**
	 * If sourceReference > 0 the contents of the source must be retrieved through the SourceRequest (even if a path
	 * is specified). A sourceReference is only valid for a session, so it must not be used to persist a source.
	 * <p>
	 * This is an optional property.
	 */
	Integer sourceReference;
	/**
	 * An optional hint for how to present the source in the UI. A value of 'deemphasize' can be used to indicate that
	 * the source is not available or that it is skipped on stepping.
	 * <p>
	 * This is an optional property.
	 */
	SourcePresentationHint presentationHint;
	/**
	 * The (optional) origin of this source: possible values 'internal module', 'inlined content from source map',
	 * etc.
	 * <p>
	 * This is an optional property.
	 */
	String origin;
	/**
	 * An optional list of sources that are related to this source. These may be the source that generated this
	 * source.
	 * <p>
	 * This is an optional property.
	 */
	Source[] sources;
	/**
	 * Optional data that a debug adapter might want to loop through the client. The client should leave the data
	 * intact and persist it across sessions. The client should not interpret the data.
	 * <p>
	 * This is an optional property.
	 */
	Object adapterData;
	/**
	 * The checksums associated with this file.
	 * <p>
	 * This is an optional property.
	 */
	Checksum[] checksums;
}

/**
 * An optional hint for how to present the source in the UI. A value of 'deemphasize' can be used to indicate that
 * the source is not available or that it is skipped on stepping.
 */
public enum SourcePresentationHint {
	NORMAL,
	EMPHASIZE,
	DEEMPHASIZE
}

/**
 * A Stackframe contains the source location.
 */
@JsonRpcData
class StackFrame {
	/**
	 * An identifier for the stack frame. It must be unique across all threads. This id can be used to retrieve the
	 * scopes of the frame with the 'scopesRequest' or to restart the execution of a stackframe.
	 */
	Integer id;
	/**
	 * The name of the stack frame, typically a method name.
	 */
	String name;
	/**
	 * The optional source of the frame.
	 * <p>
	 * This is an optional property.
	 */
	Source source;
	/**
	 * The line within the file of the frame. If source is null or doesn't exist, line is 0 and must be ignored.
	 */
	Integer line;
	/**
	 * The column within the line. If source is null or doesn't exist, column is 0 and must be ignored.
	 */
	Integer column;
	/**
	 * An optional end line of the range covered by the stack frame.
	 * <p>
	 * This is an optional property.
	 */
	Integer endLine;
	/**
	 * An optional end column of the range covered by the stack frame.
	 * <p>
	 * This is an optional property.
	 */
	Integer endColumn;
	/**
	 * The module associated with this frame, if any.
	 * <p>
	 * This is an optional property.
	 */
	Either<Integer, String> moduleId;
	/**
	 * An optional hint for how to present this frame in the UI. A value of 'label' can be used to indicate that the
	 * frame is an artificial frame that is used as a visual label or separator. A value of 'subtle' can be used to
	 * change the appearance of a frame in a 'subtle' way.
	 * <p>
	 * This is an optional property.
	 */
	StackFramePresentationHint presentationHint;
}

/**
 * An optional hint for how to present this frame in the UI. A value of 'label' can be used to indicate that the
 * frame is an artificial frame that is used as a visual label or separator. A value of 'subtle' can be used to
 * change the appearance of a frame in a 'subtle' way.
 */
public enum StackFramePresentationHint {
	NORMAL,
	LABEL,
	SUBTLE
}

/**
 * A Scope is a named container for variables. Optionally a scope can map to a source or a range within a source.
 */
@JsonRpcData
class Scope {
	/**
	 * Name of the scope such as 'Arguments', 'Locals'.
	 */
	String name;
	/**
	 * The variables of this scope can be retrieved by passing the value of variablesReference to the
	 * VariablesRequest.
	 */
	Integer variablesReference;
	/**
	 * The number of named variables in this scope.
	 * <p>
	 * The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
	 * <p>
	 * This is an optional property.
	 */
	Integer namedVariables;
	/**
	 * The number of indexed variables in this scope.
	 * <p>
	 * The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
	 * <p>
	 * This is an optional property.
	 */
	Integer indexedVariables;
	/**
	 * If true, the number of variables in this scope is large or expensive to retrieve.
	 */
	Boolean expensive;
	/**
	 * Optional source for this scope.
	 * <p>
	 * This is an optional property.
	 */
	Source source;
	/**
	 * Optional start line of the range covered by this scope.
	 * <p>
	 * This is an optional property.
	 */
	Integer line;
	/**
	 * Optional start column of the range covered by this scope.
	 * <p>
	 * This is an optional property.
	 */
	Integer column;
	/**
	 * Optional end line of the range covered by this scope.
	 * <p>
	 * This is an optional property.
	 */
	Integer endLine;
	/**
	 * Optional end column of the range covered by this scope.
	 * <p>
	 * This is an optional property.
	 */
	Integer endColumn;
}

/**
 * A Variable is a name/value pair.
 * <p>
 * Optionally a variable can have a 'type' that is shown if space permits or when hovering over the variable's
 * name.
 * <p>
 * An optional 'kind' is used to render additional properties of the variable, e.g. different icons can be used to
 * indicate that a variable is public or private.
 * <p>
 * If the value is structured (has children), a handle is provided to retrieve the children with the
 * VariablesRequest.
 * <p>
 * If the number of named or indexed children is large, the numbers should be returned via the optional
 * 'namedVariables' and 'indexedVariables' attributes.
 * <p>
 * The client can use this optional information to present the children in a paged UI and fetch them in chunks.
 */
@JsonRpcData
class Variable {
	/**
	 * The variable's name.
	 */
	String name;
	/**
	 * The variable's value. This can be a multi-line text, e.g. for a function the body of a function.
	 */
	String value;
	/**
	 * The type of the variable's value. Typically shown in the UI when hovering over the value.
	 * <p>
	 * This is an optional property.
	 */
	String type;
	/**
	 * Properties of a variable that can be used to determine how to render the variable in the UI.
	 * <p>
	 * This is an optional property.
	 */
	VariablePresentationHint presentationHint;
	/**
	 * Optional evaluatable name of this variable which can be passed to the 'EvaluateRequest' to fetch the variable's
	 * value.
	 * <p>
	 * This is an optional property.
	 */
	String evaluateName;
	/**
	 * If variablesReference is > 0, the variable is structured and its children can be retrieved by passing
	 * variablesReference to the VariablesRequest.
	 */
	Integer variablesReference;
	/**
	 * The number of named child variables.
	 * <p>
	 * The client can use this optional information to present the children in a paged UI and fetch them in chunks.
	 * <p>
	 * This is an optional property.
	 */
	Integer namedVariables;
	/**
	 * The number of indexed child variables.
	 * <p>
	 * The client can use this optional information to present the children in a paged UI and fetch them in chunks.
	 * <p>
	 * This is an optional property.
	 */
	Integer indexedVariables;
}

/**
 * Optional properties of a variable that can be used to determine how to render the variable in the UI.
 */
@JsonRpcData
class VariablePresentationHint {
	/**
	 * The kind of variable. Before introducing additional values, try to use the listed values.
	 * <p>
	 * This is an optional property.
	 * <p>
	 * Possible values include - but not limited to those defined in {@link VariablePresentationHintKind}
	 */
	String kind;
	/**
	 * Set of attributes represented as an array of strings. Before introducing additional values, try to use the
	 * listed values.
	 * <p>
	 * This is an optional property.
	 * <p>
	 * Possible values include - but not limited to those defined in {@link VariablePresentationHintAttributes}
	 */
	String[] attributes;
	/**
	 * Visibility of variable. Before introducing additional values, try to use the listed values.
	 * <p>
	 * This is an optional property.
	 * <p>
	 * Possible values include - but not limited to those defined in {@link VariablePresentationHintVisibility}
	 */
	String visibility;
}

/**
 * The kind of variable. Before introducing additional values, try to use the listed values.
 * <p>
 * Possible values include - but not limited to those defined in {@link VariablePresentationHintKind}
 */
public interface VariablePresentationHintKind {
	public static final String PROPERTY = "property";
	public static final String METHOD = "method";
	public static final String CLASS = "class";
	public static final String DATA = "data";
	public static final String EVENT = "event";
	public static final String BASE_CLASS = "baseClass";
	public static final String INNER_CLASS = "innerClass";
	public static final String INTERFACE = "interface";
	public static final String MOST_DERIVED_CLASS = "mostDerivedClass";
}

/**

 * <p>
 * Possible values include - but not limited to those defined in {@link VariablePresentationHintAttributes}
 */
public interface VariablePresentationHintAttributes {
	/**
	 * Indicates that the object is static.
	 */
	public static final String STATIC = "static";
	/**
	 * Indicates that the object is a constant.
	 */
	public static final String CONSTANT = "constant";
	/**
	 * Indicates that the object is read only.
	 */
	public static final String READ_ONLY = "readOnly";
	/**
	 * Indicates that the object is a raw string.
	 */
	public static final String RAW_STRING = "rawString";
	/**
	 * Indicates that the object can have an Object ID created for it.
	 */
	public static final String HAS_OBJECT_ID = "hasObjectId";
	/**
	 * Indicates that the object has an Object ID associated with it.
	 */
	public static final String CAN_HAVE_OBJECT_ID = "canHaveObjectId";
	/**
	 * Indicates that the evaluation had side effects.
	 */
	public static final String HAS_SIDE_EFFECTS = "hasSideEffects";
}

/**
 * Visibility of variable. Before introducing additional values, try to use the listed values.
 * <p>
 * Possible values include - but not limited to those defined in {@link VariablePresentationHintVisibility}
 */
public interface VariablePresentationHintVisibility {
	public static final String PUBLIC = "public";
	public static final String PRIVATE = "private";
	public static final String PROTECTED = "protected";
	public static final String INTERNAL = "internal";
	public static final String FINAL = "final";
}

/**
 * Properties of a breakpoint passed to the setBreakpoints request.
 */
@JsonRpcData
class SourceBreakpoint {
	/**
	 * The source line of the breakpoint.
	 */
	Integer line;
	/**
	 * An optional source column of the breakpoint.
	 * <p>
	 * This is an optional property.
	 */
	Integer column;
	/**
	 * An optional expression for conditional breakpoints.
	 * <p>
	 * This is an optional property.
	 */
	String condition;
	/**
	 * An optional expression that controls how many hits of the breakpoint are ignored. The backend is expected to
	 * interpret the expression as needed.
	 * <p>
	 * This is an optional property.
	 */
	String hitCondition;
}

/**
 * Properties of a breakpoint passed to the setFunctionBreakpoints request.
 */
@JsonRpcData
class FunctionBreakpoint {
	/**
	 * The name of the function.
	 */
	String name;
	/**
	 * An optional expression for conditional breakpoints.
	 * <p>
	 * This is an optional property.
	 */
	String condition;
	/**
	 * An optional expression that controls how many hits of the breakpoint are ignored. The backend is expected to
	 * interpret the expression as needed.
	 * <p>
	 * This is an optional property.
	 */
	String hitCondition;
}

/**
 * Information about a Breakpoint created in setBreakpoints or setFunctionBreakpoints.
 */
@JsonRpcData
class Breakpoint {
	/**
	 * An optional unique identifier for the breakpoint.
	 * <p>
	 * This is an optional property.
	 */
	Integer id;
	/**
	 * If true breakpoint could be set (but not necessarily at the desired location).
	 */
	Boolean verified;
	/**
	 * An optional message about the state of the breakpoint. This is shown to the user and can be used to explain why
	 * a breakpoint could not be verified.
	 * <p>
	 * This is an optional property.
	 */
	String message;
	/**
	 * The source where the breakpoint is located.
	 * <p>
	 * This is an optional property.
	 */
	Source source;
	/**
	 * The start line of the actual range covered by the breakpoint.
	 * <p>
	 * This is an optional property.
	 */
	Integer line;
	/**
	 * An optional start column of the actual range covered by the breakpoint.
	 * <p>
	 * This is an optional property.
	 */
	Integer column;
	/**
	 * An optional end line of the actual range covered by the breakpoint.
	 * <p>
	 * This is an optional property.
	 */
	Integer endLine;
	/**
	 * An optional end column of the actual range covered by the breakpoint. If no end line is given, then the end
	 * column is assumed to be in the start line.
	 * <p>
	 * This is an optional property.
	 */
	Integer endColumn;
}

/**
 * A StepInTarget can be used in the 'stepIn' request and determines into which single target the stepIn request
 * should step.
 */
@JsonRpcData
class StepInTarget {
	/**
	 * Unique identifier for a stepIn target.
	 */
	Integer id;
	/**
	 * The name of the stepIn target (shown in the UI).
	 */
	String label;
}

/**
 * A GotoTarget describes a code location that can be used as a target in the 'goto' request.
 * <p>
 * The possible goto targets can be determined via the 'gotoTargets' request.
 */
@JsonRpcData
class GotoTarget {
	/**
	 * Unique identifier for a goto target. This is used in the goto request.
	 */
	Integer id;
	/**
	 * The name of the goto target (shown in the UI).
	 */
	String label;
	/**
	 * The line of the goto target.
	 */
	Integer line;
	/**
	 * An optional column of the goto target.
	 * <p>
	 * This is an optional property.
	 */
	Integer column;
	/**
	 * An optional end line of the range covered by the goto target.
	 * <p>
	 * This is an optional property.
	 */
	Integer endLine;
	/**
	 * An optional end column of the range covered by the goto target.
	 * <p>
	 * This is an optional property.
	 */
	Integer endColumn;
}

/**
 * CompletionItems are the suggestions returned from the CompletionsRequest.
 */
@JsonRpcData
class CompletionItem {
	/**
	 * The label of this completion item. By default this is also the text that is inserted when selecting this
	 * completion.
	 */
	String label;
	/**
	 * If text is not falsy then it is inserted instead of the label.
	 * <p>
	 * This is an optional property.
	 */
	String text;
	/**
	 * The item's type. Typically the client uses this information to render the item in the UI with an icon.
	 * <p>
	 * This is an optional property.
	 */
	CompletionItemType type;
	/**
	 * This value determines the location (in the CompletionsRequest's 'text' attribute) where the completion text is
	 * added.
	 * <p>
	 * If missing the text is added at the location specified by the CompletionsRequest's 'column' attribute.
	 * <p>
	 * This is an optional property.
	 */
	Integer start;
	/**
	 * This value determines how many characters are overwritten by the completion text.
	 * <p>
	 * If missing the value 0 is assumed which results in the completion text being inserted.
	 * <p>
	 * This is an optional property.
	 */
	Integer length;
}

/**
 * Some predefined types for the CompletionItem. Please note that not all clients have specific icons for all of
 * them.
 */
public enum CompletionItemType {
	METHOD,
	FUNCTION,
	CONSTRUCTOR,
	FIELD,
	VARIABLE,
	CLASS,
	INTERFACE,
	MODULE,
	PROPERTY,
	UNIT,
	VALUE,
	ENUM,
	KEYWORD,
	SNIPPET,
	TEXT,
	COLOR,
	FILE,
	REFERENCE,
	CUSTOMCOLOR
}

/**
 * Names of checksum algorithms that may be supported by a debug adapter.
 */
public enum ChecksumAlgorithm {
	@SerializedName("MD5")
	MD5,
	@SerializedName("SHA1")
	SHA1,
	@SerializedName("SHA256")
	SHA256,
	TIMESTAMP
}

/**
 * The checksum of an item calculated by the specified algorithm.
 */
@JsonRpcData
class Checksum {
	/**
	 * The algorithm used to calculate this checksum.
	 */
	ChecksumAlgorithm algorithm;
	/**
	 * Value of the checksum.
	 */
	String checksum;
}

/**
 * Provides formatting information for a value.
 */
@JsonRpcData
class ValueFormat {
	/**
	 * Display the value in hex.
	 * <p>
	 * This is an optional property.
	 */
	Boolean hex;
}

/**
 * Provides formatting information for a stack frame.
 */
@JsonRpcData
class StackFrameFormat extends ValueFormat {
	/**
	 * Displays parameters for the stack frame.
	 * <p>
	 * This is an optional property.
	 */
	Boolean parameters;
	/**
	 * Displays the types of parameters for the stack frame.
	 * <p>
	 * This is an optional property.
	 */
	Boolean parameterTypes;
	/**
	 * Displays the names of parameters for the stack frame.
	 * <p>
	 * This is an optional property.
	 */
	Boolean parameterNames;
	/**
	 * Displays the values of parameters for the stack frame.
	 * <p>
	 * This is an optional property.
	 */
	Boolean parameterValues;
	/**
	 * Displays the line number of the stack frame.
	 * <p>
	 * This is an optional property.
	 */
	Boolean line;
	/**
	 * Displays the module of the stack frame.
	 * <p>
	 * This is an optional property.
	 */
	Boolean module;
	/**
	 * Includes all stack frames, including those the debug adapter might otherwise hide.
	 * <p>
	 * This is an optional property.
	 */
	Boolean includeAll;
}

/**
 * An ExceptionOptions assigns configuration options to a set of exceptions.
 */
@JsonRpcData
class ExceptionOptions {
	/**
	 * A path that selects a single or multiple exceptions in a tree. If 'path' is missing, the whole tree is
	 * selected. By convention the first segment of the path is a category that is used to group exceptions in the UI.
	 * <p>
	 * This is an optional property.
	 */
	ExceptionPathSegment[] path;
	/**
	 * Condition when a thrown exception should result in a break.
	 */
	ExceptionBreakMode breakMode;
}

/**
 * This enumeration defines all possible conditions when a thrown exception should result in a break.
 * <p>
 * never: never breaks,
 * <p>
 * always: always breaks,
 * <p>
 * unhandled: breaks when excpetion unhandled,
 * <p>
 * userUnhandled: breaks if the exception is not handled by user code.
 */
public enum ExceptionBreakMode {
	NEVER,
	ALWAYS,
	UNHANDLED,
	USER_UNHANDLED
}

/**
 * An ExceptionPathSegment represents a segment in a path that is used to match leafs or nodes in a tree of
 * exceptions. If a segment consists of more than one name, it matches the names provided if 'negate' is false or
 * missing or it matches anything except the names provided if 'negate' is true.
 */
@JsonRpcData
class ExceptionPathSegment {
	/**
	 * If false or missing this segment matches the names provided, otherwise it matches anything except the names
	 * provided.
	 * <p>
	 * This is an optional property.
	 */
	Boolean negate;
	/**
	 * Depending on the value of 'negate' the names that should match or not match.
	 */
	String[] names;
}

/**
 * Detailed information about an exception that has occurred.
 */
@JsonRpcData
class ExceptionDetails {
	/**
	 * Message contained in the exception.
	 * <p>
	 * This is an optional property.
	 */
	String message;
	/**
	 * Short type name of the exception object.
	 * <p>
	 * This is an optional property.
	 */
	String typeName;
	/**
	 * Fully-qualified type name of the exception object.
	 * <p>
	 * This is an optional property.
	 */
	String fullTypeName;
	/**
	 * Optional expression that can be evaluated in the current scope to obtain the exception object.
	 * <p>
	 * This is an optional property.
	 */
	String evaluateName;
	/**
	 * Stack trace at the time the exception was thrown.
	 * <p>
	 * This is an optional property.
	 */
	String stackTrace;
	/**
	 * Details of the exception contained by this exception, if any.
	 * <p>
	 * This is an optional property.
	 */
	ExceptionDetails[] innerException;
}
