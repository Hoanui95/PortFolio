<?php
	require_once("action/ajaxPartieLoadAction.php");

	$action = new AjaxPartieLoadAction();
	$action->execute();

	echo json_encode($action->result);

