<?php
	require_once("action/ajaxProfileAction.php");

	$action = new ajaxProfileAction();
	$action->execute();

	echo json_encode($action->result);

