New-Module -Name emacs -ScriptBlock {
    function Install-Main {
        Write-Output "installing doom-emacs on windows"

        scoop install emacs git ripgrep fd llvm

        if (-not(Test-Path $HOME/.emacs.d)) {
            git clone https://github.com/hlissner/doom-emacs $HOME/.emacs.d
        }

        if ((Test-Path $HOME\.doom.d) -and ((Get-Item $HOME\.doom.d).Target -eq (Get-Item $PSScriptRoot\..\emacs\doom).ToString())) {
            Write-Output "$HOME\.doom.d points to correct location"
        } else {
            sudo New-Item -Path $HOME -Name .doom.d -ItemType SymbolicLink -Value $PSScriptRoot\..\emacs\doom
        }

        Write-Output "create a HOME system environment variable and set it to C:\Users\USERNAME\, otherwise Emacs will treat C:\Users\USERNAME\AppData\Roaming as your HOME, which will cause issues later."
        [System.Environment]::SetEnvironmentVariable('HOME', "$HOME", [System.EnvironmentVariableTarget]::User)

        Write-Output "setting proxy to install doom-emacs"
        $env:HTTP_PROXY = "http://127.0.0.1:1080"
        $env:HTTPS_PROXY = "http://127.0.0.1:1080"
        powershell $HOME\.emacs.d\bin\doom.cmd install
        powershell $HOME\.emacs.d\bin\doom.cmd sync
        powershell $HOME\.emacs.d\bin\doom.cmd upgrade

        Write-Output "refer to the following link for more information"
        Write-Output "https://earvingad.github.io/posts/doom_emacs_windows/"
    }
}
