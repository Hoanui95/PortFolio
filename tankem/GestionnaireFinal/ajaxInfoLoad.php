<?php
	require_once("action/ajaxInfoLoadAction.php");

	$action = new AjaxInfoLoadAction();
	$action->execute();

	echo json_encode($action->result);

