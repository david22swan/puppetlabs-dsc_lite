#--------------------------------------------------------------------------------- 

Configuration CreateSystemRestorePoint
{
   Param
   (
       [String[]]$NodeName = $env:COMPUTERNAME
   )

    Import-DSCResource -ModuleName xWindowsRestore

    Node $NodeName
    {
        xSystemRestorePoint SystemRestorePointExample
        {
            Description = "Modify system settings"
            RestorePointType = "MODIFY_SETTINGS"
            Ensure = "Absent"
        }
    }
}

CreateSystemRestorePoint -NodeName "localhost"
Start-DscConfiguration -Path .\CreateSystemRestorePoint  -Wait -Force -Verbose