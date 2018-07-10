<?php
    require_once("action/AjaxEnterAction.php");

    $action = new AjaxEnterAction();
    $action->execute();

	echo json_encode($action->result);
?>
