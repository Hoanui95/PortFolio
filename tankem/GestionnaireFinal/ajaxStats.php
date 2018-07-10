<?php
	require_once("action/ajaxStatsAction.php");

	$action = new ajaxStatsAction();
	$action->execute();

	echo json_encode($action->result);

