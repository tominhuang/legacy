<?php
require_once MYBB_ROOT."inc/settings_csca.php";
function isInDevilForum(){
	global $devil1_availableForum, $devil2_availableForum, $devil3_availableForum, $mybb, $fid;
	$inDevilForum = 0;	
	$isControlGroup = ($mybb->user['additionalgroups']=="")? 1: 0;
	
	if(!$isControlGroup){																				
		if($mybb->user['additionalgroups'] == $mybb->settings['devil1']){
			if (in_array($fid, $devil1_availableForum)) {
				$inDevilForum = 1;
			}	
		}else if($mybb->user['additionalgroups'] == $mybb->settings['devil2']){
			if (in_array($fid, $devil2_availableForum)) {
				$inDevilForum = 1;
			}		
		}else if($mybb->user['additionalgroups'] == $mybb->settings['devil3']){
			if (in_array($fid, $devil3_availableForum)) {
				$inDevilForum = 1;
			}				
		}			
	}		
	return $inDevilForum ;
}
?>