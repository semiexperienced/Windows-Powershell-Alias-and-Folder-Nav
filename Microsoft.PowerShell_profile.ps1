#place in \users\username\documants\windowspowershell
function  display-path {Get-ChildItem Env:Path }

    function folder {
        [CmdletBinding(DefaultParameterSetName='Default')]
        param(    
          [Alias('u')]
          [switch] $Username
          ,
          <#
          example for your own folder. see line 46
          [Alias('s')]
          [Parameter(ParameterSetName='Scripts')]
          [switch] $Scripts
          ,                                     #>
          [Parameter(ParameterSetName='Desktop')]
          [Alias('d')]
          [switch] $Desktop
          ,
          [Alias('h')]
          [Parameter(ParameterSetName = 'help')]
          [switch]$Help
          ,
          [Alias('r')]
          [Parameter(ParameterSetName = 'root')]
          [switch]$root
        )
       <# 
    **One of these can be used to navigate to the username directory. The first will only allow you to navigate to one user, the second allows for you to select the user.**
    $targetFolder = 
      if ($Username) { 
        $targetFolder += env:USERPROFILE #replace with your username
      } 
       
    if ($Username) { 
      Join-Path (Split-Path -LiteralPath $HOME) $Username
    } else {
      $HOME
    } #>
        $targetFolder =  $env:USERPROFILE
        if ($Username) { 
            $targetFolder = $env:USERPROFILE
            $u = ' -U'
          }
          <# example continued.
          elseif ($Scripts) {
          $targetFolder += '\Desktop\Scripts'
        }#>
          elseif ($Desktop) {
          $targetFolder += '\Desktop'
        }
          elseif ($root) {
  
            ## same as other but we can use $env:homedrive for the root of C:
        
            $targetFolder = $env:HOMEDRIVE + '\'
            $r = ' -R '
        
          }
        elseif ($Help) {
        echo "
        -H         Display help. This is the same as not typing any options.
        -U         Change to the 'Username' directory
        -S         Change to the 'scripts' directory
        -D         Change to the 'desktop' directory"
    }
        else {
        echo "
        -H         Display help. This is the same as not typing any options.
        -U         Change to the 'Username' directory
        -S         Change to the 'scripts' directory
        -D         Change to the 'desktop' directory"
    }
      
        Push-Location -LiteralPath $targetFolder
      }

set-alias -Name path -Value display-path
Set-Alias -Name ip -Value ipconfig -Option AllScope
Set-Alias cat     -Value type -Option AllScope
Set-Alias cp      -Value copy -Option AllScope
Set-Alias cpr     -Value xcopy -Option AllScope
Set-Alias grep    -Value find -Option AllScope
Set-Alias man     -Value help -Option AllScope
Set-Alias mv      -Value move -Option AllScope 
Set-Alias ps      -Value tasklist -Option AllScope
Set-Alias rm      -Value del -Option AllScope
Set-Alias rmr     -Value deltree -Option AllScope
Set-Alias get    -Value Get-Item 
