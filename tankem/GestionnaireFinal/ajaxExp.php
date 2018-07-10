<?php
	require_once("action/AjaxExpAction.php");

	$action = new AjaxExpAction();
	$action->execute();
	echo json_encode($action->result);

