<?php
require_once $_SERVER['DOCUMENT_ROOT']."/global.php";

$searching = false;
if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['ctl00$cphRoblox$SearchTextBox']) && $_POST['ctl00$cphRoblox$SearchTextBox'] && !ctype_space($_POST['ctl00$cphRoblox$SearchTextBox']))
{
  $searching = true;
  $query = strtolower("%".$_POST['ctl00$cphRoblox$SearchTextBox']."%");
  $getUsersQuery = $pdo->prepare("SELECT * FROM public_users WHERE lower(Name) LIKE :query");
  $getUsersQuery->bindParam(":query", $query, PDO::PARAM_STR);
  $getUsersQuery->execute();
}

require_once $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Top.php";
?>
<script type="text/javascript">
  function GroupsSearch() {
       var search_text = $("#ctl00_cphRoblox_SearchTextBox").val();
       window.location.href = "Groups/Search.aspx?sort=Member+Count&filter=All&val=" + search_text;
   }
</script>
<div id="ctl00_cphRoblox_ContainerPanel">
  <div id="BrowseContainer" style="text-align: left">
    <form method="post">
    <div style="width: 876px; height: 28px; margin-bottom: 10px; clear: both;">
      <span class="form-label" style="margin-right: 30px;">Search: </span>
      <span>
        <span class="SearchBox">
          <input name="ctl00$cphRoblox$SearchTextBox" type="text" maxlength="100" id="ctl00_cphRoblox_SearchTextBox" style="width: 400px;"/></span>
        <span class="SearchButton">
          <input type="submit" name="ctl00$cphRoblox$SearchButton" value="Search Users" id="ctl00_cphRoblox_SearchButton" class="translate"/></span>
        <input name="ctl00$cphRoblox$Button1" type="button" id="ctl00_cphRoblox_Button1" class="translate" value="Search Groups" onclick="GroupsSearch()" onkeypress="GroupsSearch()"/>
        <input type="text" style="visibility: hidden; width:1px; position: absolute;"/>
      </span>
    </div>
    </form>
    <div style="float:left;min-height:600px">
      <?php if($searching) { ?>
      <table class="table" cellpadding="0" cellspacing="0" border="0">
        <tbody>
          <tr class="table-header">
            <th class="Avatar">Avatar</th>
            <th class="Member" style="width:126px;">Name</th>
            <th class="Description" style="width:435px;">Blurb</th>
            <th class="Date" style="width:85px;">Last Seen</th>
          </tr>
          <?php while($row = $getUsersQuery->fetch(PDO::FETCH_OBJ)) { ?>
          <tr class="datarow">
            <td><a class="roblox-avatar-image" data-user-id="<?=$row->Id?>" data-image-size="custom" data-image-size-x="64" data-image-size-y="64" href="/User.aspx?ID=<?=$row->Id?>"></a></td>
            <td><img src="/images/offline.png" alt="<?=$friend->Name?> is offline (last seen at 3/5/2013 3:53:35 PM."> <a href="/User.aspx?ID=<?=$row->Id?>"><?=htmlspecialchars($row->Name)?></a></td>
            <td><?=htmlspecialchars($row->Bio)?></td>
            <td>test</td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } ?>
    </div>
    <div style="float:right;width:160px;">
    </div>
    <br style="clear:both"/>
  </div>
</div>
<script type="text/javascript">
  $(function () {
  	$("#ctl00_cphRoblox_SearchTextBox").focus();
     });
</script>
<div style="clear:both"></div>
<?php require_once $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Bottom.php"; ?>