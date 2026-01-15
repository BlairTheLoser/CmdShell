# CMDShell

A lightweight, extensible command-line shell for Windows that blends familiar CMD behavior with enhanced file, system, and repair utilities — all implemented in a single batch file for simplicity and portability.

## Table of contents
- [Overview](#overview)
- [Features](#features)
- [Supported commands](#supported-commands)
- [Quick start](#quick-start)
- [Usage examples](#usage-examples)
- [Extending CMDShell](#extending-cmdshell)
- [Contributing](#contributing)
- [License & support](#license--support)

## Overview
CMDShell provides a compact, developer- and administrator-focused shell environment on Windows. It preserves backward compatibility with standard CMD commands while offering a set of specialized tools for file management, system inspection, and common repair tasks. CMDShell is designed to be easy to read and extend — ideal for testing, scripting, and system maintenance.

## Features
- Familiar command semantics and automatic fallback to regular CMD commands
- File and directory management utilities
- System repair helpers for common boot and disk recovery tasks
- Developer-focused information commands (system info, environment, identity)
- Single-file distribution (batch), easy to audit and extend

## Supported commands
File operations
- ls, mkdir, rm, rmdir, cat, copy, move, attrib

System repair and diagnostics
- repair-mbr, repair-boot, repair-bcd, repair-files, scan-disk

Developer & system information
- sysinfo, env, whoami

Behavior
- Custom prompt: `cmdshell$>`
- When an unknown command is entered, CMDShell falls back to the system CMD interpreter

## Quick start
Requirements
- Windows (CMD / batch environment)
- Administrator privileges may be required for repair and boot-related commands

Run
1. Download or copy the CMDShell batch file to a folder on your system.
2. Open a Command Prompt.
3. Run the batch file:
   ```
   C:\> path\to\cmdshell.bat
   ```
4. The prompt will change to:
   ```
   cmdshell$>
   ```

## Usage examples
- List directory contents:
  ```
  cmdshell$> ls
  ```
- Create a directory:
  ```
  cmdshell$> mkdir Logs
  ```
- View a file:
  ```
  cmdshell$> cat README.md
  ```
- Run system diagnostics:
  ```
  cmdshell$> sysinfo
  ```
- Attempt a boot repair (administrator required):
  ```
  cmdshell$> repair-bcd
  ```

If a command is not recognized by CMDShell, it will be passed to the standard CMD interpreter automatically:
```
cmdshell$> ipconfig /all
```

## Extending CMDShell
CMDShell is implemented as a single batch file and is intentionally easy to modify:
- Add new commands by creating a labeled section in the batch file and routing the command name to that label.
- Keep repair/privileged operations gated behind administrator checks where appropriate.
- Follow the existing naming conventions and help text style to keep the interface consistent.


## Contributing
- Bug reports and feature requests: open an Issue on this repository.
- Contributions: submit a patch or pull request. Keep changes atomic, include clear descriptions, and add usage examples where applicable.
- Please avoid including sensitive or destructive scripts without clear safeguards and confirmations.

## License & support
See the repository LICENSE file for licensing details.

For issues, feature requests, or questions, use the GitHub repository's Issues page: https://github.com/BlairTheLoser/CmdShell/issues
