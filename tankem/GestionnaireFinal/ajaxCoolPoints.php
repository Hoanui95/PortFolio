<?php
	require_once("action/ajaxCoolPointsAction.php");

	$action = new AjaxCoolPointsAction();
	$action->execute();
	echo json_encode($action->result);

