$nameSpaceName="root\cimv2\mdm\dmmap"
$className="MDM_AssignedAccess"
$obj = Get-CimInstance -Namespace $namespaceName -ClassName $className
Add-Type -AssemblyName System.Web
$obj.Configuration = [System.Web.HttpUtility]::HtmlEncode(@"

<?xml version="1.0" encoding="utf-8" ?>
<AssignedAccessConfiguration
    xmlns="http://schemas.microsoft.com/AssignedAccess/2017/config" xmlns:win11="http://schemas.microsoft.com/AssignedAccess/2022/config">
    <Profiles>
        <Profile Id="{2DF34DD2-7983-48B3-B1C7-CDCDF341F2BD}">
            <AllAppsList>
                <AllowedApps>
                    <App AppUserModelId="Microsoft.WindowsCalculator_8wekyb3d8bbwe!App" />
                </AllowedApps>
            </AllAppsList>

            <Taskbar ShowTaskBar="false" />
        </Profile>
    </Profiles>
    <Configs>
        <Config>
            <Account>DiagnosticsDevice</Account>
            <DefaultProfile Id="{2DF34DD2-7983-48B3-B1C7-CDCDF341F2BD}"/>
        </Config>
    </Configs>
</AssignedAccessConfiguration>
    
"@)

Set-CimInstance -CimInstance $obj
