if (Get-Command git -ErrorAction SilentlyContinue) {
    $git_path = (Get-Command git) | Split-Path | Split-Path
}

$possible_paths = @($env:DK_DIR, "$($git_path)\cmd")
$non_empty_paths = $possible_paths | where {$_}
$target_dir = $non_empty_paths |    
    where {(Test-Path $_)} |
    select -First 1

if (!($target_dir)) {
    $checkedPaths = $non_empty_paths | foreach {$paths} {$paths += "'$_'`r`n"} {$paths}

    Write-Error @"
Couldn't find dk install path.  Checked: 
$checkedPaths
You can manually set the target install dir by setting an environment variable: `$env:DK_DIR
"@
    return
}

$source = "https://raw.githubusercontent.com/labaneilers/dk/master"
iwr -uri "$source/dk" -outfile "$target_dir\dk.sh"

# Write customized cmd file pointing to git's bash executable
$bash_path = "$git_path\bin\sh.exe"
if (!(Test-Path $bash_path)) {
    Write-Error "Could not find bash executable (tried '$bash_path')"
}

$cmd_path = "$target_dir\dk.cmd"
rm -Force $cmd_path

Set-Content -Path $cmd_path -Value "@echo off"
Add-Content -Path $cmd_path -Value "SET SCRIPT_DIR=%~dp0"
Add-Content -Path $cmd_path -Value "`"$bash_path`" --login -i -- `"%SCRIPT_DIR%dk.sh`" %*"

"Installed dk at $target_dir\dk.cmd"