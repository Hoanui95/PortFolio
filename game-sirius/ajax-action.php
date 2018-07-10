<?php
    require_once("action/AjaxActionAction.php");

    $action = new AjaxActionAction();
    $action->execute();

	echo json_encode($action->result);
?>
