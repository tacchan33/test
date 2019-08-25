$SmbShareList_Filepath = '.\SmbShareList.csv'

#共有フォルダ一覧出力
Get-WmiObject -class win32_share | Select-Object Name,Path,Description | Export-Csv -Path $SmbShareList_Filepath -Encoding UTF8 -NoTypeInformation

#共有フォルダ一覧入力
$SmbShareList = Import-Csv -Path $SmbShareList_Filepath -Encoding UTF8
foreach( $record in $SmbShareList ){
    $record.Name
}
