<?php 
//todo - when game joining is fully functional, actually make this show the user's recently visited places
header("content-type: application/json"); 
/*$json = 
[
  'Items' => 
  [
    [
      'ThumbnailUrl' => '/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=148',
      'Name' => 'Build to Survive the Creepers',
      'NavigateUrl' => '/PlaceItem.aspx?ID=149',
      'PersonalPlaceOverlay' => [ 'Url' => NULL, ],
      'Stats' => [ 'CurrentPlayersCount' => 0, ],
    ],
	[
      'ThumbnailUrl' => '/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=149',
      'Name' => 'Welcome to the town of ROBLOXia',
      'NavigateUrl' => '/PlaceItem.aspx?ID=149',
      'PersonalPlaceOverlay' => [ 'Url' => NULL, ],
      'Stats' => [ 'CurrentPlayersCount' => 0, ],
    ]
  ],
];*/

$json = [ 'Items' => [] ];

echo json_encode($json, JSON_UNESCAPED_SLASHES);
