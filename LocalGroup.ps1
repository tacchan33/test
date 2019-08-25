$LocalGroupList_Filepath = '.\LocalGroupList.csv'

#ローカルグループ一覧出力
Get-WmiObject -class win32_Group | Select-Object Domain,Name,Caption,SID | Export-Csv -Path $LocalGroupList_Filepath -Encoding UTF8 -NoTypeInformation

#ローカルグループ一覧入力
$LocalGroupList = Import-Csv -Path $LocalGroupList_Filepath -Encoding UTF8
foreach( $record in $LocalGroupList ){
    $LocalGroupMemberList_Filepath = '.\LocalGroup\' + $record.Name + '.csv'
    net localgroup $record.Name #| Select-Object Members
}

# | Export-Csv -Path $LocalGroupMemberList_Filepath -Encoding UTF8 -NoTypeInformation



